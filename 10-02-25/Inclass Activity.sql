CREATE DATABASE WORK2;
USE WORK2;
CREATE TABLE Donation( DonorID varchar(50) PRIMARY KEY, 
                       Department varchar(50), Amount INT);
                       
INSERT INTO Donation VALUES('D/25', 'CT', 25000)
                         ,('D/67', 'SOT', 12000)
                         ,('D/45', 'CT', 15000)
                         ,('D/46', 'SOB',NULL)
                         ,('D/50', 'SOT', 11000);
select * FROM Donation;

DELIMITER /

CREATE PROCEDURE Procedure1()
    begin
        Select MIN(Amount) FROM Donation WHERE Department ="CT";
    end/


call Procedure1()/

CREATE Procedure Procedure2()
    begin
        SELECT Department, SUM(Amount)
        FROM Donation
        GROUP BY Department;
    end/

call procedure2();


CREATE PROCEDURE Procedure3()
    begin
        ALTER TABLE donation DROP where amount = NULL
    end/

CREATE PROCEDURE Procedure4( in departmentName VARCHAR(100), in NewName VARCHAR(100))
    BEGIN
        UPDATE donation
        SET department = NewName
        WHERE department = departmentName;

    END/

-- DROP PROCEDURE Procedure4;

call procedure4("CT", "SOT");


Select * FROM Donation;


CREATE PROCEDURE Procedure5(chosenAmount INT)
    begin
        DeLETE FROM donation WHERE amount = chosenAmount;
    end/

-- Call Procedure5(25000);

-- SELECT * FROM Donation;

-- INSERT INTO donation VALUES
-- ('D/25', 'CT', 25000);
ALTER TABLE donation ADD CONSTRAINT DepartmentOptions CHECK (Department IN("CT", "SOT","SOB"));

ALTER TABLE donation ADD CONSTRAINT AmountRange CHECK(Amount BETWEEN 12000 AND 25000);

ALTER TABLE donation ADD CONSTRAINT DonorID_cost CHECK(DonorID LIKE "D%");

-- INSERT INTO donation VALUES
-- ("L/33D", "SOT", 26780);

ALTER TABLE donation Add COLUMN SNO INT AUTO_INCREMENT;