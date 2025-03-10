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
ALTER TABLE Employee ADD COLUMN DateOfJoining DATE DEFAULT "2025-02-26";

ALTER TABLE Employee MODIFY COLUMN DateOfJoining DATETIME DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE Employee ALTER COLUMN DateOfJoining DROP DEFAULT;

ALTER TABLE Employee ADD COLUMN PhoneNo INT;

ALTER TABLE Employee ADD CONSTRAINT UNIQUE (PhoneNo);


CREATE TABLE Project (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(50) NOT NULL,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeeID) ON DELETE CASCADE ON UPDATE CASCADE

);

DESC Project;
