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
alter table empx drop constraint empx_gender;
alter table empx add constraint empx_gender check(gender = "M" OR gender ="F");
alter table empx add constraints empx_email UNIQUE(email);
alter table empx add constraint emp_telno check(count(telno)=10); 
-- Doesn't work
alter table empx add constraint empx_telno check(length(telno)=10);

alter Table empx delete emp

insert into empx (EID, designation, age, gender, email, telno) values ("E001", "Manager",34, "M","one@gmail.com", 1234567890);
select * from empx;
insert into empx (EID, designation, age, gender, email, telno) values ("E002", "Engineer",34, "M","two@gmail.com", 1534664890);
insert into empx (EID, designation, age, gender, email, telno) values ("E002", "Clerk",34, "M","two@gmail.com", 1534664890);
select CONSTRAINT_NAME, CONSTRAINT_type FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME='empx';