--Procedures

-- 1. Kullanýcý Saðlýk Verilerini Güncelleme
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

-- 2. Kullanýcý Bilgilerini Güncelleme
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

-- 3. Yeni Aktivite Kaydý Ekleme
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

-- 4. Wellness Hedefi Güncelleme
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

-- 5. Kullanýcý Önerisi Ekleme
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

-- 6. Belirli Tarihler Arasýnda Kullanýcý Saðlýk Verilerini Getirme
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

-- 7. Aktivite Türüne Göre Aktivite Loglarýný Getirme
CREATE PROCEDURE GetActivityLogsByType
    @ActivityType NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM dbo.ActivityLogs
    WHERE ActivityType = @ActivityType;
END;
GO

-- 8. Kullanýcýya Ait Tüm Hedefleri Getirme
CREATE PROCEDURE GetUserWellnessGoals
    @UserID INT
AS
BEGIN
    SELECT *
    FROM dbo.WellnessGoals
    WHERE UserID = @UserID;
END;
GO

-- 9. Tüm Kullanýcýlarýn Günlük Ortalama Adým Sayýsýný Getirme
CREATE PROCEDURE GetAverageDailySteps
    @Date DATE
AS
BEGIN
    SELECT AVG(Steps) AS AverageSteps
    FROM dbo.HealthData
    WHERE Date = @Date;
END;
GO

-- 10. Belirli Tarihteki Aktivite Loglarýný Silme
CREATE PROCEDURE DeleteActivityLogsByDate
    @Date DATE
AS
BEGIN
    DELETE FROM dbo.ActivityLogs
    WHERE Date = @Date;
END;
GO

-- 11. Kullanýcýya Ait Tüm Verileri Silme
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

-- 12. Belirli Bir Kullanýcýnýn En Son Önerisini Getirme
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

-- 13. Kullanýcý Saðlýk Verilerini Ekleme
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

-- 14. Kullanýcýnýn Tüm Hedeflerini Tamamlanmýþ Olarak Ýþaretleme
CREATE PROCEDURE MarkUserGoalsAsCompleted
    @UserID INT
AS
BEGIN
    UPDATE dbo.WellnessGoals
    SET CurrentValue = TargetValue
    WHERE UserID = @UserID;
END;
GO

-- 15. Kullanýcý Randevularýný Getirme
CREATE PROCEDURE GetUserAppointments
    @UserID INT
AS
BEGIN
    SELECT *
    FROM dbo.Appointments
    WHERE UserID = @UserID;
END;
GO
