USE UserAccount;
DELIMITER /

CREATE Procedure teachers()
    begin
    SELECT * from Employee  where job ="teacher";
    end/

call teachers()


CREATE Procedure job(in id1 varchar(20))
    begin
    select * from Employee where job = id1;
    end/
    
call job('clerk')/


SELECT * FROM Employee;

call job('Manager')/

ALTER Table Employee ADD COLUMN Gender Varchar(3);
ALTER table employee drop column gener;

UPDATE Employee SET Gender = 'M' WHERE EmpNo IN ('E002', 'E004', 'E005', 'E006', 'E007');
UPDATE Employee SET Gender = 'F' WHERE EmpNo IN ('E003');
UPDATE Employee SET Gender = 'Ukn' WHERE EmpNo = 'E001';

create Procedure amountspent(in id2 VARCHAR(10))
    begin 
    select job, sum(salary) from employee where job =id2;
    end/

DROP Procedure amountspent/

call amountspent("teacher")/

create PROCEDURE xyz(in id3 varchar(10), in ide4 VARCHAR(10))
    begin
    select count(*) from employee where job = id3 and gender =ide4;
    end/

drop Procedure xyz/

call xyz("manager", "m")/

CREATE DATABASE Students/
USe Students/

CREATE Table Student(
    regno VARCHAR(10) PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    fees INT
)/

call insertion("e001", "Alex", "Ngobi", 20000)/
call insertion("e002", "Charlie", "Nansubuga", 25000)/
call insertion("e003", "Assumpta", "Namanda", 50000)/

call insertion("e004", "Deus", "Mukibi", 270000)/
call insertion("e007", "Eric", "ongom", 26000)/


SELECT * FROM student/



create PROCEDURE updatepro(in id4 VARCHAR(10), in id5 int)
    begin
    update student set fees =id5 where regno = id4;
    end/

call updatepro('e004', 5000)/

create PROCEDURE insertion(in regno VARCHAR(50), in fname VARCHAR(50), in lname VARCHAR(50), in fees int)
    begin
    INSERT INTO student (regno, fname,lname, fees) VALUES
    (regno, fname, lname, fees);
    end/


CREATE user "rachel" @"localhost" IDENTIFIED by "rach"/

ALTER USER "rachel"@"localhost" password EXPIRE;

CREATE user "denise" @"localhost" IDENTIFIED by "den"/

ALTER USER "denise"@"localhost" password EXPIRE;

alter user "denise"@"localhost" ACCOUNT LOCK;
alter user "denise"@"localhost" ACCOUNT UNLOCK;

alter user "denise"@"localhost" IDENTIFIED by "bag123"
