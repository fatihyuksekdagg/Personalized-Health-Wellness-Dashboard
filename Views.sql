--Views

-- 1. Kullanýcýlarýn Ortalama Adým Sayýlarý
CREATE VIEW vwAverageSteps
AS
SELECT UserID, AVG(Steps) AS AverageSteps
FROM dbo.HealthData
GROUP BY UserID;
GO

-- 2. Günlük Aktivite Loglarý
CREATE VIEW vwDailyActivityLogs
AS
SELECT UserID, ActivityType, SUM(DurationMinutes) AS TotalDuration, SUM(CaloriesBurned) AS TotalCaloriesBurned, Date
FROM dbo.ActivityLogs
GROUP BY UserID, ActivityType, Date;
GO

-- 3. Kullanýcý Wellness Hedefleri ve Durumlarý
CREATE VIEW vwUserWellnessGoals
AS
SELECT u.UserName, wg.GoalDescription, wg.StartDate, wg.EndDate, wg.TargetValue, wg.CurrentValue
FROM dbo.WellnessGoals wg
JOIN dbo.Users u ON wg.UserID = u.UserID;
GO

-- 4. Kullanýcý Saðlýk Verileri ve Önerileri
CREATE VIEW vwUserHealthAndRecommendations
AS
SELECT hd.UserID, hd.Date, hd.HeartRate, hd.BloodPressure, hd.Steps, r.RecommendationText
FROM dbo.HealthData hd
LEFT JOIN dbo.Recommendations r ON hd.UserID = r.UserID AND hd.Date = r.Date;
GO

-- 5. Kullanýcý Randevularý ve Doktor Ýsimleri
CREATE VIEW vwUserAppointments
AS
SELECT u.UserName, a.AppointmentDate, a.DoctorName, a.Purpose
FROM dbo.Appointments a
JOIN dbo.Users u ON a.UserID = u.UserID;
GO
