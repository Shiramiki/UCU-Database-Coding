create DATABASE cs;
use cs;
create table empx(
    eid VARCHAR(20),
    CONSTRAINT empx_pk PRIMARY KEY(eid),
    designation varchar(20),
    CONSTRAINT empx_designation check (designation in ('manager','clerk','teacher')),
    age int,
    CONSTRAINT empx_age check(age>18),
    DOJ datetime default CURRENT_TIMESTAMP,
    gender varchar(10),
    email VARCHAR(20),
    telno int
);

alter table empx add constraint empx_gender check(gender in ('m', 'F'));
INSERT INTO empx (eid, designation, age, gender, email, telno)
VALUES ('E102', 'clerk', 19, 'M', 'jane.doe@email.com', '0712345678');
-- Error: Age must be greater than 18

INSERT INTO empx (eid, designation, age, gender, email, telno)
VALUES ('E103', 'teacher', 25, 'X', 'jake@email.com', '0712345678');
-- Error: Gender must be 'M' or 'F'


alter table empx drop constraint empx_gender;
INSERT INTO empx (eid, designation, age, gender, email, telno)
VALUES ('E103', 'teacher', 25, 'X', 'jake@email.com', '0712345678');
-- Error: Gender must be 'M' or 'F'

-- alter table empx add constraint empx_gender check (gender = "M" OR gender ="F");
alter table empx add constraint empx_email UNIQUE (email);
INSERT INTO empx (eid, designation, age, gender, email, telno)
VALUES ('E101', 'manager', 30, 'M', 'john.doe@email.com', '0712345678');

INSERT INTO empx (eid, designation, age, gender, email, telno)
VALUES ('E109', 'clerk', 25, 'F', 'john.doe@email.com', '0712345999');
-- Error: Duplicate entry 'john.doe@email.com' for key 'empx_email'

ALTER TABLE empx ADD CONSTRAINT emp_telno CHECK (CHAR_LENGTH(telno) = 10);

-- Doesn't work
alter table empx add constraint empx_telno check(length(telno)=10);

ALTER TABLE empx ADD CONSTRAINT emp_telno CHECK (telno BETWEEN 0700000000 AND 0799999999);

INSERT INTO empx (eid, designation, telno) 
VALUES ('E1001', 'Manager', '0734567890');

 ALTER TABLE empx DROP CONSTRAINT wmp_telno;
ALTER TABLE empx DROP CONSTRAINT emp_telno;

ALTER TABLE empx ADD COLUMN name VARCHAR(100);

ALTER TABLE empx ADD CONSTRAINT EMPY_email CHECK(email LIKE "%@%");
INSERT INTO empx (eid, designation, age, gender, email)
VALUES ('E119', 'clerk', 25, 'M', 'john.doe@gmail.com');

ALTER TABLE empx ADD CONSTRAINT emp_name_check CHECK (UPPER(name));

ALTER TABLE empx DROP CONSTRAINT emp_name_check;
INSERT INTO empx (eid, designation, gender, name)
VALUES ('E1001', 'Manager', 'M', 'john');




alter Table empx delete emp

insert into empx (EID, designation, age, gender, email, telno) values ("E001", "Manager",34, "M","one@gmail.com", 1234567890);
select * from empx;
CREATE VIEW RACHEL AS SELECT designation FROM empx WHERE designation = "Manager";
insert into empx (EID, designation, age, gender, email, telno) values ("E002", "Engineer",34, "M","two@gmail.com", 1534664890);
insert into empx (EID, designation, age, gender, email, telno) values ("E002", "Clerk",34, "M","two@gmail.com", 1534664890);
select CONSTRAINT_NAME, CONSTRAINT_type FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME='empx';