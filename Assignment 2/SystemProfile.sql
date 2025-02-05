-- Create schema (database)
CREATE DATABASE IF NOT EXISTS UserAccount;
USE UserAccount;

-- Create Department table
CREATE TABLE Department (
    DeptNo INT PRIMARY KEY,
    DName VARCHAR(50) NOT NULL,
    Loc VARCHAR(50) NOT NULL
);

-- Insert data into Department table
INSERT INTO Department (DeptNo, DName, Loc) VALUES
(10, 'SALES', 'KAMPALA'),
(40, 'MARKETING', 'ENTEBBE'),
(30, 'ACCOUNTING', 'MUKONO');

-- Create Employee table
CREATE TABLE Employee (
    EmpNo VARCHAR(10) PRIMARY KEY,
    Ename VARCHAR(50),
    Job VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    DeptNo INT,
    FOREIGN KEY (DeptNo) REFERENCES Department(DeptNo)
);

-- Insert data into Employee table
INSERT INTO Employee (EmpNo, Ename, Job, Salary, DeptNo) VALUES
('E001', NULL, 'Clerk', 40000, 30),
('E002', 'Agaba', 'Manager', 16000, 30),
('E003', 'Mary', 'SalesLady', 20000, 10),
('E004', 'Timo', 'Clerk', 40000, 30),
('E005', 'Simon', 'Manager', 60000, 40),
('E006', 'Mark', 'Manager', 45000, 10),
('E007', 'Solomon', 'Teacher', 30000, 30);
SHOW TABLES;
SELECT * FROM department;
SELECT * FROM employee;
