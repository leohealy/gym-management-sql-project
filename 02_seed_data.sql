-- ==========================================
-- Gym Management System - Seed Data
-- ==========================================
-- This script populates the database with
-- realistic sample data for analysis purposes.
--
-- Tables included:
-- - Trainers
-- - Members
-- - Classes
-- - Attendance
-- - Payments
--
-- Created as part of a SQL portfolio project
-- demonstrating relational database design,
-- data modelling, and business analysis skills.
-- ==========================================

INSERT INTO Trainers (first_name, last_name, specialty, hire_date)
VALUES
('John', 'Murphy', 'Strength', '2023-01-10'),
('Sarah', 'Kelly', 'Yoga', '2022-08-15'),
('David', 'OBrien', 'HIIT', '2024-03-01'),
('Emma', 'Ryan', 'Weight Loss', '2021-06-20'),
('Mark', 'Doyle', 'CrossFit', '2023-09-12');

INSERT INTO Members (first_name, last_name, gender, age, join_date, membership_type)
VALUES
('Liam', 'Doyle', 'Male', 28, '2024-01-05', 'Premium'),
('Aoife', 'Kavanagh', 'Female', 32, '2023-11-12', 'Standard'),
('Sean', 'Murphy', 'Male', 24, '2024-02-20', 'Premium'),
('Emma', 'Walsh', 'Female', 29, '2023-09-18', 'Standard'),
('Jack', 'Ryan', 'Male', 35, '2022-06-10', 'Premium'),
('Sophie', 'Byrne', 'Female', 27, '2024-03-01', 'Basic'),
('Conor', 'Hogan', 'Male', 31, '2023-08-22', 'Standard'),
('Niamh', 'Foley', 'Female', 26, '2024-01-30', 'Premium'),
('Daniel', 'Byrne', 'Male', 40, '2022-12-14', 'Standard'),
('Hannah', 'Kelly', 'Female', 23, '2024-04-10', 'Basic'),
('Patrick', 'Dunne', 'Male', 33, '2023-05-25', 'Premium'),
('Lucy', 'OBrien', 'Female', 30, '2023-10-05', 'Standard');

INSERT INTO Classes (class_name, trainer_id, class_date, class_time, capacity)
VALUES
('HIIT Blast', 3, '2025-07-10', '18:00', 20),
('Yoga Flow', 2, '2025-07-11', '09:00', 15),
('Strength Basics', 1, '2025-07-12', '17:00', 25),
('Weight Loss Circuit', 4, '2025-07-13', '19:00', 18),
('CrossFit Intro', 5, '2025-07-14', '08:00', 22);

INSERT INTO Attendance (member_id, class_id, attendance_date)
VALUES
(1, 1, '2025-07-10'),
(2, 1, '2025-07-10'),
(3, 2, '2025-07-11'),
(4, 2, '2025-07-11'),
(5, 3, '2025-07-12'),
(6, 3, '2025-07-12'),
(7, 4, '2025-07-13'),
(8, 4, '2025-07-13'),
(9, 5, '2025-07-14'),
(10, 5, '2025-07-14');

INSERT INTO Payments (member_id, amount, payment_date, payment_method)
VALUES
(1, 50.00, '2025-07-01', 'Card'),
(2, 30.00, '2025-07-02', 'Cash'),
(3, 50.00, '2025-07-03', 'Card'),
(4, 30.00, '2025-07-04', 'Card'),
(5, 50.00, '2025-07-05', 'Card'),
(6, 20.00, '2025-07-06', 'Cash'),
(7, 30.00, '2025-07-07', 'Card'),
(8, 50.00, '2025-07-08', 'Card'),
(9, 30.00, '2025-07-09', 'Cash'),
(10, 20.00, '2025-07-10', 'Card'),
(11, 50.00, '2025-07-11', 'Card'),
(12, 30.00, '2025-07-12', 'Cash');

-- NOTE: This is synthetic data for learning/portfolio purposes only.