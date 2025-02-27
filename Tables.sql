CREATE DATABASE PersonalizedHealthDashboard;


USE PersonalizedHealthDashboard;
GO
-- Users Tablosunu Önce Oluþturun
CREATE TABLE dbo.Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(100),
    PasswordHash NVARCHAR(256),
    Email NVARCHAR(100),
    BirthDate DATE,
    Gender NVARCHAR(10),
    HeightCM INT,
    WeightKG INT
);
GO

-- HealthData Tablosu
CREATE TABLE dbo.HealthData (
    HealthDataID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    Date DATE,
    HeartRate INT NULL,
    BloodPressure VARCHAR(20) NULL,
    Steps INT,
    CaloriesBurned INT NULL,
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO

-- ActivityLogs Tablosu
CREATE TABLE dbo.ActivityLogs (
    ActivityLogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    ActivityType NVARCHAR(50),
    DurationMinutes INT,
    CaloriesBurned INT,
    Date DATE,
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO

-- WellnessGoals Tablosu
CREATE TABLE dbo.WellnessGoals (
    GoalID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    GoalDescription NVARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    TargetValue INT,
    CurrentValue INT,
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO

-- Recommendations Tablosu
CREATE TABLE dbo.Recommendations (
    RecommendationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    RecommendationText NVARCHAR(255),
    Date DATE,
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO

-- Medications Tablosu
CREATE TABLE dbo.Medications (
    MedicationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    MedicationName NVARCHAR(100),
    Dosage NVARCHAR(50),
    Frequency NVARCHAR(50),
    StartDate DATE,
    EndDate DATE NULL,
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO

-- Appointments Tablosu
CREATE TABLE dbo.Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    AppointmentDate DATE,
    DoctorName NVARCHAR(100),
    Purpose NVARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO

-- SleepData Tablosu
CREATE TABLE dbo.SleepData (
    SleepDataID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    SleepDate DATE,
    SleepDurationMinutes INT,
    SleepQuality NVARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO

-- DietLogs Tablosu
CREATE TABLE dbo.DietLogs (
    DietLogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    Date DATE,
    MealType NVARCHAR(50),
    Calories INT,
    ProteinGrams INT,
    FatGrams INT,
    CarbsGrams INT,
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO

-- Allergies Tablosu
CREATE TABLE dbo.Allergies (
    AllergyID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    AllergyName NVARCHAR(100),
    Severity NVARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);
GO
