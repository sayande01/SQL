create table Science_class(
Enrollment_No int,
Student_Name varchar,
Science_marks int);

insert into Science_class values (1,'Popeye',33);
insert into Science_class values (2,'Olive',54);
insert into Science_class values (3,'Brutus',98);

COPY science_class FROM 'D:/PostgreSQL/data/data_copy/student.csv' csv header ;

select * from Science_class;
insert into science_class values (12,'Sayan',97);
insert into science_class values (13,'Tom',72);
insert into science_class values (14,'Kevin',28);
insert into science_class values (15,'Holland',84);
insert into science_class values (16,'Sayan',47);
insert into science_class values (17,'Kevin',29);


select distinct Student_Name from science_class;

select * from science_class where Science_marks > 77

select * from science_class where science_marks > 40 and science_marks < 70;

select * from science_class where student_name = 'Sayan' or science_marks = 45;

select * from science_class where not student_name = 'Sayan';

UPDATE science_class
SET science_marks = 45
WHERE Student_Name = 'Popeye';

delete from science_class WHERE Student_Name = 'Robb';

alter table science_class add Email varchar(255);
alter table science_class drop Email;

alter table science_class rename column Enrollment_No to Roll_No;

alter table science_class alter column roll_no set not null;
alter table science_class add constraint roll_no check(roll_no > 0);
alter table science_class add primary key (roll_no);


