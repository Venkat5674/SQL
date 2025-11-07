-- Create Employee Table
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    join_date DATE,
    last_login DATETIME,
    salary DECIMAL(10,2)
);

-- Insert Employee Records
INSERT INTO employees (name, join_date, last_login, salary) VALUES
('Venkatesh Pamudurti', '2023-05-10', '2025-01-20 10:15:00', 55000.00),
('Lakshmi Sesha Sai Maddineni', '2024-10-10', '2025-02-05 09:45:00', 60000.00),
('Sai Satish Chandra', '2024-05-20', '2025-01-28 08:30:00', 50000.00),
('Akshay Raj', '2021-08-20', '2025-09-30 08:00:00', 48000.00),
('Kushyanth Pothineni', '2022-12-15', '2025-02-01 20:10:00', 65000.00),
('Ramesh', '2021-08-20', '2025-09-30 08:00:00', 48000.00),
('Suresh', '2024-05-10', '2025-01-15 12:10:00', 52000.00),
('Mahesh', '2020-11-11', '2025-02-03 09:05:00', 47000.00);

-------------------------------------------------------------
-- 1. Display current date, time, and datetime
SELECT CURRENT_DATE AS today_date;
SELECT CURRENT_TIME AS current_time;
SELECT NOW() AS current_datetime;

-------------------------------------------------------------
-- 2. Show employee name, last_login, and current time difference
SELECT 
    name,
    last_login,
    TIMESTAMPDIFF(DAY, last_login, NOW()) AS days_since_last_login
FROM employees;

-------------------------------------------------------------
-- 3. Find employees who joined in 2024
SELECT *
FROM employees
WHERE YEAR(join_date) = 2024;

-------------------------------------------------------------
-- 4. Count employees joined each year
SELECT 
    YEAR(join_date) AS year,
    COUNT(*) AS total_employees
FROM employees
GROUP BY YEAR(join_date);

-------------------------------------------------------------
-- 5. Find employees who joined in May
SELECT *
FROM employees
WHERE MONTH(join_date) = 5;

-------------------------------------------------------------
-- 6. Group employees by month of joining
SELECT 
    MONTHNAME(join_date) AS joining_month,
    COUNT(*) AS total
FROM employees
GROUP BY MONTH(join_date);

-------------------------------------------------------------
-- 7. Get employees who joined on 10th day of any month
SELECT *
FROM employees
WHERE DAY(join_date) = 10;

-------------------------------------------------------------
-- 8. Show joining day number for each employee
SELECT 
    name,
    join_date,
    DAY(join_date) AS joining_day_number
FROM employees;

-------------------------------------------------------------
-- 9. Display weekday number of each join_date
SELECT 
    name,
    join_date,
    DAYOFWEEK(join_date) AS weekday_number
FROM employees;

-------------------------------------------------------------
-- 10. Find employees who joined on Monday
SELECT *
FROM employees
WHERE DAYNAME(join_date) = 'Monday';
