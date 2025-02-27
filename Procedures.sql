--Procedures

-- 1. Kullan�c� Sa�l�k Verilerini G�ncelleme
CREATE PROCEDURE UpdateUserHealthData
    @UserID INT,
    @Date DATE,
    @HeartRate INT = NULL,
    @BloodPressure VARCHAR(20) = NULL,
    @Steps INT = NULL,
    @CaloriesBurned INT = NULL
AS
BEGIN
    UPDATE HealthData
    SET HeartRate = ISNULL(@HeartRate, HeartRate),
        BloodPressure = ISNULL(@BloodPressure, BloodPressure),
        Steps = ISNULL(@Steps, Steps),
        CaloriesBurned = ISNULL(@CaloriesBurned, CaloriesBurned)
    WHERE UserID = @UserID AND Date = @Date;
END;
GO

-- 2. Kullan�c� Bilgilerini G�ncelleme
CREATE PROCEDURE UpdateUserInfo
    @UserID INT,
    @UserName NVARCHAR(100) = NULL,
    @PasswordHash NVARCHAR(256) = NULL,
    @Email NVARCHAR(100) = NULL,
    @BirthDate DATE = NULL,
    @Gender NVARCHAR(10) = NULL,
    @HeightCM INT = NULL,
    @WeightKG INT = NULL
AS
BEGIN
    UPDATE dbo.Users
    SET UserName = ISNULL(@UserName, UserName),
        PasswordHash = ISNULL(@PasswordHash, PasswordHash),
        Email = ISNULL(@Email, Email),
        BirthDate = ISNULL(@BirthDate, BirthDate),
        Gender = ISNULL(@Gender, Gender),
        HeightCM = ISNULL(@HeightCM, HeightCM),
        WeightKG = ISNULL(@WeightKG, WeightKG)
    WHERE UserID = @UserID;
END;
GO

-- 3. Yeni Aktivite Kayd� Ekleme
CREATE PROCEDURE InsertActivityLog
    @UserID INT,
    @ActivityType NVARCHAR(50),
    @DurationMinutes INT,
    @CaloriesBurned INT,
    @Date DATE
AS
BEGIN
    INSERT INTO dbo.ActivityLogs (UserID, ActivityType, DurationMinutes, CaloriesBurned, Date)
    VALUES (@UserID, @ActivityType, @DurationMinutes, @CaloriesBurned, @Date);
END;
GO

-- 4. Wellness Hedefi G�ncelleme
CREATE PROCEDURE UpdateWellnessGoal
    @GoalID INT,
    @GoalDescription NVARCHAR(255) = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL,
    @TargetValue INT = NULL,
    @CurrentValue INT = NULL
AS
BEGIN
    UPDATE dbo.WellnessGoals
    SET GoalDescription = ISNULL(@GoalDescription, GoalDescription),
        StartDate = ISNULL(@StartDate, StartDate),
        EndDate = ISNULL(@EndDate, EndDate),
        TargetValue = ISNULL(@TargetValue, TargetValue),
        CurrentValue = ISNULL(@CurrentValue, CurrentValue)
    WHERE GoalID = @GoalID;
END;
GO

-- 5. Kullan�c� �nerisi Ekleme
CREATE PROCEDURE InsertUserRecommendation
    @UserID INT,
    @RecommendationText NVARCHAR(255),
    @Date DATE
AS
BEGIN
    INSERT INTO dbo.Recommendations (UserID, RecommendationText, Date)
    VALUES (@UserID, @RecommendationText, @Date);
END;
GO

-- 6. Belirli Tarihler Aras�nda Kullan�c� Sa�l�k Verilerini Getirme
CREATE PROCEDURE GetUserHealthDataByDate
    @UserID INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT *
    FROM dbo.HealthData
    WHERE UserID = @UserID AND Date BETWEEN @StartDate AND @EndDate;
END;
GO

-- 7. Aktivite T�r�ne G�re Aktivite Loglar�n� Getirme
CREATE PROCEDURE GetActivityLogsByType
    @ActivityType NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM dbo.ActivityLogs
    WHERE ActivityType = @ActivityType;
END;
GO

-- 8. Kullan�c�ya Ait T�m Hedefleri Getirme
CREATE PROCEDURE GetUserWellnessGoals
    @UserID INT
AS
BEGIN
    SELECT *
    FROM dbo.WellnessGoals
    WHERE UserID = @UserID;
END;
GO

-- 9. T�m Kullan�c�lar�n G�nl�k Ortalama Ad�m Say�s�n� Getirme
CREATE PROCEDURE GetAverageDailySteps
    @Date DATE
AS
BEGIN
    SELECT AVG(Steps) AS AverageSteps
    FROM dbo.HealthData
    WHERE Date = @Date;
END;
GO

-- 10. Belirli Tarihteki Aktivite Loglar�n� Silme
CREATE PROCEDURE DeleteActivityLogsByDate
    @Date DATE
AS
BEGIN
    DELETE FROM dbo.ActivityLogs
    WHERE Date = @Date;
END;
GO

-- 11. Kullan�c�ya Ait T�m Verileri Silme
CREATE PROCEDURE DeleteAllUserData
    @UserID INT
AS
BEGIN
    DELETE FROM dbo.HealthData WHERE UserID = @UserID;
    DELETE FROM dbo.ActivityLogs WHERE UserID = @UserID;
    DELETE FROM dbo.WellnessGoals WHERE UserID = @UserID;
    DELETE FROM dbo.Recommendations WHERE UserID = @UserID;
END;
GO

-- 12. Belirli Bir Kullan�c�n�n En Son �nerisini Getirme
CREATE PROCEDURE GetLatestUserRecommendation
    @UserID INT
AS
BEGIN
    SELECT TOP 1 *
    FROM dbo.Recommendations
    WHERE UserID = @UserID
    ORDER BY Date DESC;
END;
GO

-- 13. Kullan�c� Sa�l�k Verilerini Ekleme
CREATE PROCEDURE InsertUserHealthData
    @UserID INT,
    @Date DATE,
    @HeartRate INT,
    @BloodPressure VARCHAR(20),
    @Steps INT,
    @CaloriesBurned INT
AS
BEGIN
    INSERT INTO dbo.HealthData (UserID, Date, HeartRate, BloodPressure, Steps, CaloriesBurned)
    VALUES (@UserID, @Date, @HeartRate, @BloodPressure, @Steps, @CaloriesBurned);
END;
GO

-- 14. Kullan�c�n�n T�m Hedeflerini Tamamlanm�� Olarak ��aretleme
CREATE PROCEDURE MarkUserGoalsAsCompleted
    @UserID INT
AS
BEGIN
    UPDATE dbo.WellnessGoals
    SET CurrentValue = TargetValue
    WHERE UserID = @UserID;
END;
GO

-- 15. Kullan�c� Randevular�n� Getirme
CREATE PROCEDURE GetUserAppointments
    @UserID INT
AS
BEGIN
    SELECT *
    FROM dbo.Appointments
    WHERE UserID = @UserID;
END;
GO
