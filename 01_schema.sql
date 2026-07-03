-- ==========================================
-- Gym Management System - Database Schema
-- ==========================================
-- This script creates the relational database
-- structure for a gym management system.
--
-- It defines core tables:
-- - Members (customer data)
-- - Trainers (staff data)
-- - Classes (scheduled sessions)
-- - Attendance (member participation)
-- - Payments (revenue tracking)
--
-- Relationships:
-- - Classes link to Trainers
-- - Attendance links Members to Classes
-- - Payments link to Members
--
-- Purpose:
-- Demonstrates relational database design,
-- foreign key relationships, and normalization
-- for portfolio and data analysis use.
--
-- Created as part of a SQL portfolio project.
-- ==========================================

CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    join_date DATE,
    membership_type VARCHAR(20)
);

CREATE TABLE Trainers (
    trainer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(50),
    hire_date DATE
);

CREATE TABLE Classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(50),
    trainer_id INT,
    class_date DATE,
    class_time TIME,
    capacity INT,
    FOREIGN KEY (trainer_id)
        REFERENCES Trainers(trainer_id)
);

CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    member_id INT,
    amount DECIMAL(8,2),
    payment_date DATE,
    payment_method VARCHAR(20),
    FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

CREATE TABLE Attendance (
    attendance_id SERIAL PRIMARY KEY,
    member_id INT,
    class_id INT,
    attendance_date DATE,
    FOREIGN KEY (member_id)
        REFERENCES Members(member_id),
    FOREIGN KEY (class_id)
        REFERENCES Classes(class_id)
);
 