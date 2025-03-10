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