--Triggers

-- 1. Kullan�c� Eklendi�inde Sa�l�k Verisi Ekleme
CREATE TRIGGER trgAfterInsertUser
ON dbo.Users
AFTER INSERT
AS
BEGIN
    DECLARE @UserID INT;
    SELECT @UserID = INSERTED.UserID FROM INSERTED;
    INSERT INTO dbo.HealthData (UserID, Date, HeartRate, BloodPressure, Steps, CaloriesBurned)
    VALUES (@UserID, GETDATE(), NULL, NULL, 0, 0);
END;
GO

-- 2. Aktivite Eklendi�inde �neri Ekleme
CREATE TRIGGER trgAfterInsertActivityLog
ON dbo.ActivityLogs
AFTER INSERT
AS
BEGIN
    DECLARE @UserID INT, @ActivityType NVARCHAR(50), @Date DATE;
    SELECT @UserID = INSERTED.UserID, @ActivityType = INSERTED.ActivityType, @Date = INSERTED.Date FROM INSERTED;
    INSERT INTO dbo.Recommendations (UserID, RecommendationText, Date)
    VALUES (@UserID, 'Great job on your ' + @ActivityType + ' activity!', @Date);
END;
GO

-- 3. Kullan�c� Sa�l�k Verisi G�ncellendi�inde �neri Ekleme
CREATE TRIGGER trgAfterUpdateHealthData
ON dbo.HealthData
AFTER UPDATE
AS
BEGIN
    DECLARE @UserID INT, @Steps INT;
    SELECT @UserID = INSERTED.UserID, @Steps = INSERTED.Steps FROM INSERTED;
    IF @Steps >= 10000
    BEGIN
        INSERT INTO dbo.Recommendations (UserID, RecommendationText, Date)
        VALUES (@UserID, 'Congratulations on reaching 10,000 steps!', GETDATE());
    END
END;
GO

-- 4. Wellness Hedefi G�ncellendi�inde G�ncelleme Mesaj� Ekleme
CREATE TRIGGER trgAfterUpdateWellnessGoal
ON dbo.WellnessGoals
AFTER UPDATE
AS
BEGIN
    DECLARE @UserID INT, @GoalDescription NVARCHAR(255);
    SELECT @UserID = INSERTED.UserID, @GoalDescription = INSERTED.GoalDescription FROM INSERTED;
    INSERT INTO dbo.Recommendations (UserID, RecommendationText, Date)
    VALUES (@UserID, 'Keep pushing towards your goal: ' + @GoalDescription, GETDATE());
END;
GO

-- 5. Kullan�c� Verisi Silindi�inde �lgili Verileri Silme
CREATE TRIGGER trgAfterDeleteUser
ON dbo.Users
AFTER DELETE
AS
BEGIN
    DECLARE @UserID INT;
    SELECT @UserID = DELETED.UserID FROM DELETED;
    DELETE FROM dbo.HealthData WHERE UserID = @UserID;
    DELETE FROM dbo.ActivityLogs WHERE UserID = @UserID;
    DELETE FROM dbo.WellnessGoals WHERE UserID = @UserID;
    DELETE FROM dbo.Recommendations WHERE UserID = @UserID;
END;
GO
