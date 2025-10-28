--🧩 Step 1: Create Database

-- Create a new database for company structure
CREATE DATABASE CompanyDB;

-- Switch to use the newly created database
USE CompanyDB;

--🏬 Step 2: Create Table – Departments

/* 
Creating the Departments table with constraints:
1. DeptID → Primary Key, Auto Increment
2. DeptName → Unique, Not Null
*/
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(100) UNIQUE NOT NULL
);

--👨‍💼 Step 3: Create Table – Employees
/*
Creating the Employees table with constraints:
1. EmpID → Primary Key, Auto Increment
2. Name → Not Null
3. Email → Unique
4. DeptID → Foreign Key references Departments(DeptID)
5. Salary → Check (Salary > 0)
*/
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    CONSTRAINT fk_dept FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

--🧱 Step 4: Verify Structure
-- Check table structure
DESCRIBE Departments;
DESCRIBE Employees;

--🧾 Step 5: Insert Sample Records
-- Insert sample departments
INSERT INTO Departments (DeptName)
VALUES 
('Human Resources'),
('Finance'),
('Engineering'),
('Sales');

-- Insert sample employees
INSERT INTO Employees (Name, Email, DeptID, Salary)
VALUES
('Venkatesh Pamudurti', 'venkatesh@company.com', 1, 45000.00),
('Lakshmi Sesha Sai', 'lakshmi@company.com', 3, 55000.00),
('Sai Satish', 'sai@company.com', 2, 60000.00);


--🔍 Step 6: View Data
-- Display all departments
SELECT * FROM Departments;

-- Display all employees with department names
SELECT 
    E.EmpID,
    E.Name AS EmployeeName,
    E.Email,
    D.DeptName AS Department,
    E.Salary
FROM Employees E
JOIN Departments D ON E.DeptID = D.DeptID;
