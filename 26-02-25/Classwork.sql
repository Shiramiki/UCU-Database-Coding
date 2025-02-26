CREATE DATABASE Class;
-- Check Constraint
USE Class; 

DROP TABLE Employee;
CREATE TABLE Employee(
EmployeeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Age INT,
CONSTRAINT Employee_AgeCheck CHECK(Age>=18), 
Email VARCHAR(100) UNIQUE
);

select CONSTRAINT_NAME, CONSTRAINT_type FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME='Employee';
INSERT INTO Employee (FirstName, LastName, Age, Email) VALUES
("John", "Cat", 30, "JohnCat@gmail.com"),
("Jane", "Doe", 25, "Jane.doe@gmail.com"),
("Daniel", "Wilson", 35, "danielwilson@gmail.com");

ALTER Table Employee Drop CONSTRAINT Employee_AgeCheck;

UPDATE Employee SET Age =32 WHERE EmployeeeID =2;

SELECT * FROM Employee;

