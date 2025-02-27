INSERT INTO dbo.Users (UserName, PasswordHash, Email, BirthDate, Gender, HeightCM, WeightKG)
VALUES 
('Atay Bacaklý', 'password123', 'atay.bacakli@gmail.com', '1998-08-19', 'Male', 178, 95),
('Ecem Sade', 'securepass', 'ecem.sade@gmail.com', '1998-10-23', 'Female', 170, 68),
('Mehmet Oðuz Seyit', 'mypassword', 'mehmet.seyit@gmail.com', '1998-12-31', 'Male', 175, 78),
('Ayþe Elisa Tiryaki', 'password321', 'ayse.tiryaki@gmail.com', '2000-07-24', 'Female', 170, 78),
('Emre Boran Arslan', 'pass1234', 'emre.arslan@gmail.com', '1999-06-25', 'Male', 170, 65),
('Öykü Karabey', 'password5678', 'oyku.karabey@gmail.com', '2000-03-06', 'Female', 165, 68),
('Mert Çolak', 'mypassword9', 'mert.colak@gmail.com', '2000-07-25', 'Male', 180, 95),
('Yeliz Deðirmenci', 'securepass1', 'yeliz.degirmenci@gmail.com', '2000-04-21', 'Female', 165, 65),
('Emre Top', 'password2024', 'emre.top@gmail.com', '2000-03-20', 'Male', 185, 80),
('Aleyna Ateþ', 'pass4567', 'aleyna.ates@gmail.com', '2000-01-13', 'Female', 155, 50),
('Fatih Yüksekdað', 'secure789', 'fatih.yuksekdag@gmail.com', '1997-05-16', 'Male', 172, 70),
('Burcu Altýn', 'pass7890', 'burcu.altin@gmail.com', '1998-11-25', 'Female', 160, 58),
('Beril Çakmak', 'securepassword', 'berilcakmak@gmail.com', '2000-04-03', 'Female', 165, 67),
('Berrak Þimþek', 'password678', 'berrak.simsek@gmail.com', '1998-09-09', 'Female', 165, 55),
('Tolga Sarýyer', 'pass456', 'tolga.sariyer@gmail.com', '1997-08-14', 'Male', 175, 78),
('Esra Yýlmaz', 'securepass2', 'esra.yilmaz@gmail.com', '1999-10-10', 'Female', 162, 60),
('Mehmet Ali Þahin', 'pass123', 'mehmet.sahin@gmail.com', '1996-12-12', 'Male', 180, 82),
('Melisa Aydýn', 'mypassword5', 'melisa.aydin@gmail.com', '1998-07-07', 'Female', 170, 62),
('Serkan Kýlýç', 'mypassword2', 'serkan.kilic@gmail.com', '1999-04-23', 'Male', 175, 76),
('Elif Demir', 'password007', 'elif.demir@gmail.com', '2000-02-01', 'Female', 158, 54);
GO

INSERT INTO dbo.HealthData (UserID, Date, HeartRate, BloodPressure, Steps, CaloriesBurned)
VALUES 
(1, '2024-08-16', 75, '120/80', 5000, 200),
(2, '2024-08-16', 82, '118/79', 10000, 350),
(3, '2024-08-16', 68, '115/75', 7000, 300),
(4, '2024-08-16', 78, '122/81', 4000, 250),
(5, '2024-08-16', 85, '130/85', 12000, 400),
(6, '2024-08-16', 77, '119/78', 6500, 280),
(7, '2024-08-16', 72, '117/76', 5500, 270),
(8, '2024-08-16', 80, '121/79', 4500, 230),
(9, '2024-08-16', 83, '123/82', 7500, 320),
(10, '2024-08-16', 76, '116/77', 5000, 240),
(11, '2024-08-17', 74, '120/80', 5200, 210),
(12, '2024-08-17', 81, '117/78', 10200, 360),
(13, '2024-08-17', 69, '116/75', 7300, 310),
(14, '2024-08-17', 77, '121/80', 3900, 245),
(15, '2024-08-17', 86, '129/84', 12500, 420),
(16, '2024-08-17', 78, '118/77', 6700, 285),
(17, '2024-08-17', 71, '118/76', 5400, 275),
(18, '2024-08-17', 79, '120/78', 4600, 235),
(19, '2024-08-17', 82, '124/80', 7600, 325),
(20, '2024-08-17', 75, '115/76', 5100, 250);
GO

INSERT INTO dbo.ActivityLogs (UserID, ActivityType, DurationMinutes, CaloriesBurned, Date)
VALUES 
(1, 'Running', 30, 300, '2024-08-16'),
(2, 'Walking', 45, 150, '2024-08-16'),
(3, 'Cycling', 60, 500, '2024-08-16'),
(4, 'Yoga', 40, 200, '2024-08-16'),
(5, 'Swimming', 50, 400, '2024-08-16'),
(6, 'Weight Lifting', 60, 450, '2024-08-16'),
(7, 'Running', 30, 300, '2024-08-16'),
(8, 'Walking', 45, 150, '2024-08-16'),
(9, 'Cycling', 60, 500, '2024-08-16'),
(10, 'Yoga', 40, 200, '2024-08-16'),
(11, 'Running', 32, 310, '2024-08-17'),
(12, 'Walking', 48, 160, '2024-08-17'),
(13, 'Cycling', 62, 520, '2024-08-17'),
(14, 'Yoga', 42, 210, '2024-08-17'),
(15, 'Swimming', 52, 410, '2024-08-17'),
(16, 'Weight Lifting', 65, 460, '2024-08-17'),
(17, 'Running', 35, 320, '2024-08-17'),
(18, 'Walking', 50, 170, '2024-08-17'),
(19, 'Cycling', 65, 540, '2024-08-17'),
(20, 'Yoga', 45, 220, '2024-08-17');
GO


INSERT INTO dbo.WellnessGoals (UserID, GoalDescription, StartDate, EndDate, TargetValue, CurrentValue)
VALUES 
(1, 'Lose 5 kg', '2024-08-01', '2024-09-01', 70, 72),
(2, 'Run 5 km daily', '2024-08-01', '2024-08-31', 5000, 3000),
(3, 'Lower blood pressure', '2024-08-01', '2024-09-01', 115, 118),
(4, 'Increase muscle mass', '2024-08-01', '2024-09-01', 15, 12),
(5, 'Improve cardiovascular fitness', '2024-08-01', '2024-09-01', 65, 60),
(6, 'Increase flexibility', '2024-08-01', '2024-09-01', 10, 7),
(7, 'Lose 3 kg', '2024-08-01', '2024-09-01', 65, 67),
(8, 'Run 7 km daily', '2024-08-01', '2024-08-31', 7000, 5000),
(9, 'Maintain a balanced diet', '2024-08-01', '2024-09-01', 2000, 1800),
(10, 'Meditate daily', '2024-08-01', '2024-08-31', 30, 25),
(11, 'Improve sleep quality', '2024-08-01', '2024-09-01', 8, 6),
(12, 'Increase daily water intake', '2024-08-01', '2024-09-01', 3000, 2500),
(13, 'Lower cholesterol', '2024-08-01', '2024-09-01', 180, 200),
(14, 'Complete a half marathon', '2024-08-01', '2024-09-01', 21000, 15000),
(15, 'Practice yoga daily', '2024-08-01', '2024-08-31', 30, 20),
(16, 'Reduce sugar intake', '2024-08-01', '2024-09-01', 25, 30),
(17, 'Cycle 100 km weekly', '2024-08-01', '2024-08-31', 100000, 75000),
(18, 'Increase protein intake', '2024-08-01', '2024-08-31', 150, 130),
(19, 'Practice mindfulness', '2024-08-01', '2024-08-31', 20, 15),
(20, 'Reduce stress levels', '2024-08-01', '2024-09-01', 50, 40);
GO


INSERT INTO dbo.Recommendations (UserID, RecommendationText, Date)
VALUES 
(1, 'You should consider increasing your daily step count to reach 10,000 steps.', '2024-08-16'),
(2, 'Great job on reaching 10,000 steps today!', '2024-08-16'),
(3, 'Keep up the good work, but aim for lower blood pressure.', '2024-08-16'),
(4, 'Try to incorporate more strength training into your routine.', '2024-08-16'),
(5, 'Excellent progress in swimming, keep going!', '2024-08-16'),
(6, 'You are doing well, keep increasing your flexibility exercises.', '2024-08-16'),
(7, 'You should consider increasing your daily step count to reach 10,000 steps.', '2024-08-16'),
(8, 'Great job on reaching 10,000 steps today!', '2024-08-16'),
(9, 'Keep up the good work, but aim for lower blood pressure.', '2024-08-16'),
(10, 'Try to incorporate more strength training into your routine.', '2024-08-16'),
(11, 'Maintain a balanced diet with more fruits and vegetables.', '2024-08-17'),
(12, 'Try to drink at least 8 glasses of water daily.', '2024-08-17'),
(13, 'Make sure to get at least 7 hours of sleep.', '2024-08-17'),
(14, 'Consider reducing your sugar intake.', '2024-08-17'),
(15, 'Great job on completing a half marathon!', '2024-08-17'),
(16, 'Focus on reducing stress through meditation.', '2024-08-17'),
(17, 'Increase your daily protein intake.', '2024-08-17'),
(18, 'Keep up the mindfulness practice, it’s making a difference.', '2024-08-17'),
(19, 'Consider including more fiber-rich foods in your diet.', '2024-08-17'),
(20, 'Stay consistent with your exercise routine.', '2024-08-17');
GO


INSERT INTO dbo.Medications (UserID, MedicationName, Dosage, Frequency, StartDate, EndDate)
VALUES 
(1, 'Lisinopril', '10mg', 'Once Daily', '2024-01-01', '2024-08-01'),
(2, 'Metformin', '500mg', 'Twice Daily', '2024-03-01', '2024-08-01'),
(3, 'Atorvastatin', '20mg', 'Once Daily', '2024-02-01', '2024-08-01'),
(4, 'Levothyroxine', '50mcg', 'Once Daily', '2024-04-01', '2024-08-01'),
(5, 'Albuterol', '90mcg', 'As Needed', '2024-05-01', NULL),
(6, 'Omeprazole', '20mg', 'Once Daily', '2024-06-01', '2024-08-01'),
(7, 'Amlodipine', '5mg', 'Once Daily', '2024-07-01', '2024-08-01'),
(8, 'Hydrochlorothiazide', '25mg', 'Once Daily', '2024-08-01', NULL),
(9, 'Simvastatin', '40mg', 'Once Daily', '2024-05-01', '2024-08-01'),
(10, 'Glipizide', '5mg', 'Twice Daily', '2024-03-01', '2024-08-01'),
(11, 'Losartan', '50mg', 'Once Daily', '2024-02-01', '2024-08-01'),
(12, 'Gabapentin', '300mg', 'Three Times Daily', '2024-01-01', '2024-08-01'),
(13, 'Furosemide', '40mg', 'Once Daily', '2024-04-01', '2024-08-01'),
(14, 'Zolpidem', '10mg', 'As Needed', '2024-06-01', NULL),
(15, 'Metoprolol', '25mg', 'Once Daily', '2024-07-01', '2024-08-01'),
(16, 'Montelukast', '10mg', 'Once Daily', '2024-03-01', '2024-08-01'),
(17, 'Citalopram', '20mg', 'Once Daily', '2024-05-01', '2024-08-01'),
(18, 'Loratadine', '10mg', 'As Needed', '2024-08-01', NULL),
(19, 'Sertraline', '50mg', 'Once Daily', '2024-04-01', '2024-08-01'),
(20, 'Cyclobenzaprine', '10mg', 'Three Times Daily', '2024-07-01', '2024-08-01');
GO


INSERT INTO dbo.Appointments (UserID, AppointmentDate, DoctorName, Purpose)
VALUES 
(1, '2024-08-01', 'Dr. Ali Veli', 'Routine Checkup'),
(2, '2024-08-03', 'Dr. Ahmet Yýlmaz', 'Blood Pressure Management'),
(3, '2024-08-05', 'Dr. Ayþe Güler', 'Diabetes Follow-up'),
(4, '2024-08-07', 'Dr. Emre Demir', 'Thyroid Function Test'),
(5, '2024-08-09', 'Dr. Fatma Sarý', 'Asthma Checkup'),
(6, '2024-08-11', 'Dr. Meltem Çelik', 'GERD Treatment'),
(7, '2024-08-13', 'Dr. Mehmet Kaya', 'Cardiovascular Health'),
(8, '2024-08-15', 'Dr. Banu Güneþ', 'Routine Physical Exam'),
(9, '2024-08-17', 'Dr. Orhan Þahin', 'Cholesterol Management'),
(10, '2024-08-19', 'Dr. Selin Özkan', 'Diabetes Management'),
(11, '2024-08-21', 'Dr. Burak Aslan', 'Hypertension Management'),
(12, '2024-08-23', 'Dr. Leyla Taþ', 'Neuropathy Follow-up'),
(13, '2024-08-25', 'Dr. Fikret Erdem', 'Kidney Function Test'),
(14, '2024-08-27', 'Dr. Canan Turan', 'Sleep Apnea Evaluation'),
(15, '2024-08-29', 'Dr. Deniz Çakýr', 'Stress Test'),
(16, '2024-08-31', 'Dr. Cenk Ünal', 'Cardiac Evaluation'),
(17, '2024-09-02', 'Dr. Özlem Akýn', 'Allergy Management'),
(18, '2024-09-04', 'Dr. Serkan Iþýk', 'Depression Management'),
(19, '2024-09-06', 'Dr. Seher Yýlmaz', 'Chronic Pain Management'),
(20, '2024-09-08', 'Dr. Asuman Demir', 'Muscle Spasm Treatment');
GO


INSERT INTO dbo.SleepData (UserID, SleepDate, SleepDurationMinutes, SleepQuality)
VALUES 
(1, '2024-08-15', 420, 'Good'),
(2, '2024-08-15', 390, 'Fair'),
(3, '2024-08-15', 450, 'Good'),
(4, '2024-08-15', 400, 'Poor'),
(5, '2024-08-15', 460, 'Excellent'),
(6, '2024-08-15', 380, 'Fair'),
(7, '2024-08-15', 430, 'Good'),
(8, '2024-08-15', 410, 'Good'),
(9, '2024-08-15', 400, 'Fair'),
(10, '2024-08-15', 470, 'Excellent'),
(11, '2024-08-16', 420, 'Good'),
(12, '2024-08-16', 390, 'Fair'),
(13, '2024-08-16', 450, 'Good'),
(14, '2024-08-16', 400, 'Poor'),
(15, '2024-08-16', 460, 'Excellent'),
(16, '2024-08-16', 380, 'Fair'),
(17, '2024-08-16', 430, 'Good'),
(18, '2024-08-16', 410, 'Good'),
(19, '2024-08-16', 400, 'Fair'),
(20, '2024-08-16', 470, 'Excellent');
GO


INSERT INTO dbo.DietLogs (UserID, Date, MealType, Calories, ProteinGrams, FatGrams, CarbsGrams)
VALUES 
(1, '2024-08-16', 'Breakfast', 400, 20, 15, 50),
(2, '2024-08-16', 'Lunch', 600, 30, 20, 80),
(3, '2024-08-16', 'Dinner', 500, 25, 18, 70),
(4, '2024-08-16', 'Snack', 200, 10, 8, 30),
(5, '2024-08-16', 'Breakfast', 450, 22, 17, 55),
(6, '2024-08-16', 'Lunch', 620, 32, 22, 85),
(7, '2024-08-16', 'Dinner', 510, 27, 19, 72),
(8, '2024-08-16', 'Snack', 220, 12, 10, 35),
(9, '2024-08-16', 'Breakfast', 430, 21, 16, 52),
(10, '2024-08-16', 'Lunch', 590, 29, 19, 78),
(11, '2024-08-17', 'Breakfast', 400, 20, 15, 50),
(12, '2024-08-17', 'Lunch', 600, 30, 20, 80),
(13, '2024-08-17', 'Dinner', 500, 25, 18, 70),
(14, '2024-08-17', 'Snack', 200, 10, 8, 30),
(15, '2024-08-17', 'Breakfast', 450, 22, 17, 55),
(16, '2024-08-17', 'Lunch', 620, 32, 22, 85),
(17, '2024-08-17', 'Dinner', 510, 27, 19, 72),
(18, '2024-08-17', 'Snack', 220, 12, 10, 35),
(19, '2024-08-17', 'Breakfast', 430, 21, 16, 52),
(20, '2024-08-17', 'Lunch', 590, 29, 19, 78);
GO


INSERT INTO dbo.Allergies (UserID, AllergyName, Severity)
VALUES 
(1, 'Peanuts', 'High'),
(2, 'Shellfish', 'Medium'),
(3, 'Pollen', 'Low'),
(4, 'Dust Mites', 'High'),
(5, 'Milk', 'Medium'),
(6, 'Eggs', 'High'),
(7, 'Wheat', 'Medium'),
(8, 'Soy', 'Low'),
(9, 'Tree Nuts', 'High'),
(10, 'Insect Stings', 'Medium'),
(11, 'Mold', 'High'),
(12, 'Pet Dander', 'Low'),
(13, 'Latex', 'Medium'),
(14, 'Fish', 'High'),
(15, 'Sunlight', 'Low'),
(16, 'Fragrance', 'Medium'),
(17, 'Nickel', 'Low'),
(18, 'Aspirin', 'Medium'),
(19, 'Sulfa Drugs', 'High'),
(20, 'Penicillin', 'High');
GO

