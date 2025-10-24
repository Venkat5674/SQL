-- Create database
CREATE DATABASE company;
USE company;

-- Create table
CREATE TABLE employee (
    empid INT,
    empname VARCHAR(50),
    empadd VARCHAR(100)
);

-- Add column
ALTER TABLE employee ADD COLUMN emp_salary DECIMAL(10,2);

-- Rename column
ALTER TABLE employee CHANGE COLUMN empid employeeid INT;

-- Modify column datatype
ALTER TABLE employee MODIFY COLUMN empname VARCHAR(100);
ALTER TABLE employee MODIFY COLUMN emp_salary DECIMAL(15,2);

-- Drop column
ALTER TABLE employee DROP COLUMN empadd;

-- Rename table
ALTER TABLE employee RENAME TO employee_details;

-- Drop table
DROP TABLE employee_details;

-- Create backup table
CREATE TABLE employee_backup (
    employeeid INT,
    empname VARCHAR(100),
    emp_salary DECIMAL(15,2)
);
