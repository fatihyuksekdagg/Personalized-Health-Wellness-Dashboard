--Views

-- 1. Kullan�c�lar�n Ortalama Ad�m Say�lar�
CREATE VIEW vwAverageSteps
AS
SELECT UserID, AVG(Steps) AS AverageSteps
FROM dbo.HealthData
GROUP BY UserID;
GO

-- 2. G�nl�k Aktivite Loglar�
CREATE VIEW vwDailyActivityLogs
AS
SELECT UserID, ActivityType, SUM(DurationMinutes) AS TotalDuration, SUM(CaloriesBurned) AS TotalCaloriesBurned, Date
FROM dbo.ActivityLogs
GROUP BY UserID, ActivityType, Date;
GO

-- 3. Kullan�c� Wellness Hedefleri ve Durumlar�
CREATE VIEW vwUserWellnessGoals
AS
SELECT u.UserName, wg.GoalDescription, wg.StartDate, wg.EndDate, wg.TargetValue, wg.CurrentValue
FROM dbo.WellnessGoals wg
JOIN dbo.Users u ON wg.UserID = u.UserID;
GO

-- 4. Kullan�c� Sa�l�k Verileri ve �nerileri
CREATE VIEW vwUserHealthAndRecommendations
AS
SELECT hd.UserID, hd.Date, hd.HeartRate, hd.BloodPressure, hd.Steps, r.RecommendationText
FROM dbo.HealthData hd
LEFT JOIN dbo.Recommendations r ON hd.UserID = r.UserID AND hd.Date = r.Date;
GO

-- 5. Kullan�c� Randevular� ve Doktor �simleri
CREATE VIEW vwUserAppointments
AS
SELECT u.UserName, a.AppointmentDate, a.DoctorName, a.Purpose
FROM dbo.Appointments a
JOIN dbo.Users u ON a.UserID = u.UserID;
GO
