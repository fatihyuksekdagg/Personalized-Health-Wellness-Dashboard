--Functions

-- 1. Belirli Bir Kullanýcýnýn Ortalama Adým Sayýsýný Getirme
CREATE FUNCTION fnGetUserAverageSteps(@UserID INT)
RETURNS INT
AS
BEGIN
    DECLARE @AvgSteps INT;
    SELECT @AvgSteps = AVG(Steps)
    FROM dbo.HealthData
    WHERE UserID = @UserID;
    RETURN @AvgSteps;
END;
GO

-- 2. Belirli Bir Kullanýcýnýn Günlük Kalori Yakma Oranýný Getirme
CREATE FUNCTION fnGetUserDailyCaloriesBurned(@UserID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalCalories INT;
    SELECT @TotalCalories = SUM(CaloriesBurned)
    FROM dbo.ActivityLogs
    WHERE UserID = @UserID AND Date = CONVERT(DATE, GETDATE());
    RETURN @TotalCalories;
END;
GO

-- 3. Belirli Bir Kullanýcýnýn Ortalama Uyku Süresini Getirme
CREATE FUNCTION fnGetUserAverageSleepDuration(@UserID INT)
RETURNS INT
AS
BEGIN
    DECLARE @AvgSleepDuration INT;
    SELECT @AvgSleepDuration = AVG(SleepDurationMinutes)
    FROM dbo.SleepData
    WHERE UserID = @UserID;
    RETURN @AvgSleepDuration;
END;
GO
