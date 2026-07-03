-- ==========================================
-- Gym Management System - Analysis Queries
-- ==========================================
-- This file contains analytical SQL queries
-- used to extract business insights from the
-- gym database.
--
-- Includes:
-- - Revenue analysis
-- - Attendance analysis
-- - Class popularity
-- - Trainer performance
-- - Member activity
--
-- Purpose:
-- Demonstrates SQL querying, joins, grouping,
-- and business insight generation for portfolio use.
-- ==========================================

--Total revenue
SELECT SUM(amount) AS total_revenue
FROM Payments;

--Revenue by payment method
SELECT payment_method, SUM(amount) AS total_revenue
FROM Payments
GROUP BY payment_method;

--Most popular class (by attendance)
SELECT 
    c.class_name,
    COUNT(a.attendance_id) AS total_attendees
FROM Classes c
JOIN Attendance a ON c.class_id = a.class_id
GROUP BY c.class_name
ORDER BY total_attendees DESC;

--Member attendance count
SELECT 
    m.first_name,
    m.last_name,
    COUNT(a.attendance_id) AS classes_attended
FROM Members m
JOIN Attendance a ON m.member_id = a.member_id
GROUP BY m.first_name, m.last_name
ORDER BY classes_attended DESC;

--Trainer class count
SELECT 
    t.first_name,
    t.last_name,
    COUNT(c.class_id) AS total_classes
FROM Trainers t
JOIN Classes c ON t.trainer_id = c.trainer_id
GROUP BY t.first_name, t.last_name
ORDER BY total_classes DESC;

--Revenue by membership type
SELECT 
    m.membership_type,
    SUM(p.amount) AS total_revenue
FROM Members m
JOIN Payments p ON m.member_id = p.member_id
GROUP BY m.membership_type;

-- Members who have never attended a class
SELECT 
    m.first_name,
    m.last_name
FROM Members m
LEFT JOIN Attendance a ON m.member_id = a.member_id
WHERE a.attendance_id IS NULL;

-- Members who attended more than 1 class
SELECT 
    member_id,
    COUNT(*) AS visits
FROM Attendance
GROUP BY member_id
HAVING COUNT(*) > 1;

-- Age group segmentation
SELECT 
    first_name,
    age,
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        ELSE '35+'
    END AS age_group
FROM Members;

-- Monthly revenue trend
SELECT 
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS revenue
FROM Payments
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY month;

-- Top paying members
SELECT 
    m.first_name,
    m.last_name,
    SUM(p.amount) AS total_paid
FROM Members m
JOIN Payments p ON m.member_id = p.member_id
GROUP BY m.first_name, m.last_name
ORDER BY total_paid DESC;