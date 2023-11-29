drop table course;
drop table meetingHost;
drop table meetingParticipant;
drop table teacher;
drop table student;
drop table meeting;
drop table department;

create table department(
    deptCode varchar(20) not null PRIMARY KEY,
    deptName varchar(20) not null,
    phoneNo varchar(20) not null,
    officeRoom varchar(20) not null
);

create table course(
    courseNo varchar(20) not null PRIMARY KEY,
    courseName varchar(20) not null,
    creditHour number(3,2) not null,
    deptId varchar(20) not null,
    FOREIGN KEY (deptId) REFERENCES department(deptCode)
);

create table teacher(
    teacherId varchar(20) not null PRIMARY KEY,
    teacherName varchar(20) not null,
    designation varchar(20) not null,
    deptId varchar(20) not null,
    phoneNo varchar(20) not null,
    email varchar(20) not null,
    FOREIGN KEY (deptId) REFERENCES department(deptCode)
);

create table student(
    studentRoll varchar(20) not null PRIMARY KEY,
    Name varchar(20) not null,
    address varchar(20) not null,
    phoneNo varchar(20) not null,
    deptCode varchar(20) not null,
    birthdate DATE NOT NULL,
    age number,
    FOREIGN KEY (deptCode) REFERENCES department(deptCode)
);

create table meeting(
    meetingId varchar(20) not null PRIMARY KEY,
    time varchar(20) not null,
    duration INTEGER not null,
    topic varchar(20) not null,
    resourse varchar(20) not null
);

create table meetingHost(
    teacherId varchar(20) not null,
    meetingId varchar(20) not null,
    PRIMARY KEY (teacherId, meetingId),
    FOREIGN KEY (teacherId) REFERENCES teacher(teacherId),
    FOREIGN KEY (meetingId) REFERENCES meeting(meetingId)
);

create table meetingParticipant(
    studentRoll varchar(20) not null,
    meetingId varchar(20)   not null,
    PRIMARY KEY (studentRoll, meetingId),
    FOREIGN KEY (studentRoll) REFERENCES student(studentRoll),
    FOREIGN KEY (meetingId) REFERENCES meeting(meetingId)
);


--trigger to add age using birthdate
CREATE TRIGGER calculate_age BEFORE UPDATE OR INSERT ON student
FOR EACH ROW
DECLARE
    date_of_birth student.birthdate%TYPE;
    cal_age number;
BEGIN
    date_of_birth := :new.birthdate;
    select floor(months_between(sysdate, date_of_birth)/12) into cal_age from dual;
    :new.age := cal_age;
END calculate_age;
/
show errors;

INSERT INTO  department VALUES ('CSE', 'CSE', '01712345678', '202'); 
INSERT INTO  department VALUES ('EEE', 'EEE', '01722345678', '302'); 
INSERT INTO  department VALUES ('CE', 'CE', '01732345678', '204'); 
INSERT INTO  department VALUES ('ME', 'ME', '01742345678', '212'); 
INSERT INTO  department VALUES ('ECE', 'ECE', '01752345678', '312'); 

INSERT INTO course VALUES ('CSE3100', 'Web', '1.5', 'CSE');
INSERT INTO course VALUES ('CSE3101', 'TOC', '3.0', 'CSE');
INSERT INTO course VALUES ('CSE3109', 'Database', '3.0', 'CSE');
INSERT INTO course VALUES ('CSE3103', 'Peripherals', '3.0', 'CSE');
INSERT INTO course VALUES ('ECE3115 ', 'DataCommunication ', '3.0', 'CSE');
INSERT INTO course VALUES ('EE3107 ', 'Machines', '3.0', 'EEE');
INSERT INTO course VALUES ('EE3109', 'Electronics', '3.0', 'EEE');
INSERT INTO course VALUES ('EE3113', 'LogicDesign', '3.0', 'EEE');
INSERT INTO course VALUES ('EE3115', 'Measurement ', '3.0', 'EEE');
INSERT INTO course VALUES ('EE3121', 'Numerical', '3.0', 'EEE');
INSERT INTO course VALUES ('ME3100', 'SpecialStudies', '0.75', 'ME');
INSERT INTO course VALUES ('ME3105', 'Heattransfe', '3.0', 'ME');
INSERT INTO course VALUES ('ME3109', 'Mechanics ', '3.0', 'ME');
INSERT INTO course VALUES ('ME3117', 'MachineDesign ', '3.0', 'ME');
INSERT INTO course VALUES ('ME3119', 'Statistics', '3.0', 'ME');
INSERT INTO course VALUES ('ME31121', 'Numerical', '3.0', 'ME');
INSERT INTO course VALUES ('CE3111', 'StructuralDesign', '3.0', 'CE');
INSERT INTO course VALUES ('CE3113', 'Structures', '3.0', 'CE');
INSERT INTO course VALUES ('CE3131', 'Geotechnical', '3.0', 'CE');
INSERT INTO course VALUES ('CE3141', 'Environmental', '3.0', 'CE');
INSERT INTO course VALUES ('CE3161', 'Hydraulics', '3.0', 'CE');
INSERT INTO course VALUES ('CSE3102', 'Programming', '3.0', 'ECE');
INSERT INTO course VALUES ('CSE3111', 'Electronics', '3.0', 'ECE');
INSERT INTO course VALUES ('CSE3133', 'Microprocessors', '3.0', 'ECE');
INSERT INTO course VALUES ('CSE3105', 'Microwave', '3.0', 'ECE');
INSERT INTO course VALUES ('CSE3119', 'Numerical', '3.0', 'ECE');
INSERT INTO course VALUES ('Hum3109', 'Government', '3.0', 'ECE');


INSERT INTO teacher VALUES ('01', 'Lewis', 'Professor', 'CSE', '01812345678', 'em@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('02', 'Sarah ', 'Professor', 'CSE', '01832345678', 'az@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('03', 'Rahim', 'AstProfessor', 'CSE', '01852345678', 'rm@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('04', 'karim', 'Lecturer', 'CSE', '01842345678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('05', 'James', 'Professor', 'ME', '01842345678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('06', 'karim', 'AstProfessor', 'ME', '01842345678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('07', 'Jones', 'Lecturer', 'ME', '01842335678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('08', 'Ryan', 'Lecturer', 'ME', '01842345378', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('09', 'Edwards', 'Lecturer', 'ME', '01842545678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('10', 'Zara', 'Professor', 'ECE', '01842355678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('11', 'Smith', 'AstProfessor', 'ECE', '01842343678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('12', 'Allen', 'Lecturer', 'ECE', '018423425678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('13', 'Eloise', 'Lecturer', 'ECE', '018423245678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('14', 'Sophia', 'Professor', 'CE', '01842325678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('15', 'Reid', 'AstProfessor', 'CE', '01842345278', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('16', 'Stewart', 'Lecturer', 'CE', '01842645678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('17', 'Liam', 'Lecturer', 'CE', '01842345278', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('18', 'Bennett', 'Lecturer', 'CE', '01847345678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('19', 'Lola', 'Professor', 'EEE', '01842315678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('20', 'Watson', 'AstProfessor', 'EEE', '01842345678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('21', 'Ella', 'Lecturer', 'EEE', '01842345678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('22', 'Mitchell', 'Lecturer', 'EEE', '01842345678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('23', 'Jack', 'Lecturer', 'EEE', '01842345678', 'km@cse.kuet.ac.bd');
INSERT INTO teacher VALUES ('24', 'Cook ', 'Lecturer', 'EEE', '01842345678', 'km@cse.kuet.ac.bd');



INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1807001', 'Johnston', 'Dhaka', '01842345678', 'CSE', TO_DATE('08/12/1999', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1807002', 'Felix', 'Bogra', '01842345678', 'CSE', TO_DATE('04/03/2000', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1807003', 'Morris', 'Raj', '01842345678', 'CSE', TO_DATE('10/03/2001', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1807004', 'Emilia', 'Khulna', '01842345678', 'CSE', TO_DATE('30/05/2001', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1807005', 'Archie', 'Dhaka', '01842345678', 'CSE', TO_DATE('11/08/2002', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1803001', 'Cooper', 'Dhaka', '01842345678', 'ME', TO_DATE('20/08/1999', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1803002', 'Alexander', 'Bogra', '01842345678', 'ME', TO_DATE('23/06/2000', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1803003', 'King', 'Raj', '01842345678', 'ME', TO_DATE('01/08/2000', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1803004', 'Parker', 'Khulna', '01842345678', 'ME', TO_DATE('07/11/2000', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1803005', 'Archie', 'Dhaka', '01842345678', 'ME', TO_DATE('08/10/2001', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1805001', 'Johnston', 'Dhaka', '01842345678', 'CE', TO_DATE('13/10/1999', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1805002', 'Felix', 'Bogra', '01842345678', 'CE', TO_DATE('30/06/2000', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1805003', 'Morris', 'Raj', '01842345678', 'CE', TO_DATE('19/04/2001', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1805004', 'Emilia', 'Khulna', '01842345678', 'CE', TO_DATE('12/06/2001', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1805005', 'Archie', 'Dhaka', '01842345678', 'CE', TO_DATE('21/04/2002', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1801001', 'Johnston', 'Dhaka', '01842345678', 'EEE', TO_DATE('19/08/1999', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1801002', 'Felix', 'Bogra', '01842345678', 'EEE', TO_DATE('27/09/1999', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1801003', 'Morris', 'Raj', '01842345678', 'EEE', TO_DATE('18/12/1999', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1801004', 'Emilia', 'Khulna', '01842345678', 'EEE', TO_DATE('28/05/2000', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1801005', 'Archie', 'Dhaka', '01842345678', 'EEE', TO_DATE('27/07/2000', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1809001', 'Johnston', 'Dhaka', '01842345678', 'ECE', TO_DATE('12/12/1999', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1809002', 'Felix', 'Bogra', '01842345678', 'ECE', TO_DATE('06/04/2000', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1809003', 'Morris', 'Raj', '01842345678', 'ECE', TO_DATE('14/11/2001', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1809004', 'Emilia', 'Khulna', '01842345678', 'ECE', TO_DATE('18/06/2002', 'DD/MM/YYYY'));
INSERT INTO student (studentRoll, Name, address, phoneNo, deptCode, birthdate) VALUES ('1809005', 'Archie', 'Dhaka', '01842345678', 'ECE', TO_DATE('04/11/1999', 'DD/MM/YYYY'));

INSERT INTO meeting VALUES ('001', '09:00', 1, 'Database', 'Database.com');
INSERT INTO meeting VALUES ('002', '21:00', 2, 'LogicDesign', 'LogicDesign.com');
INSERT INTO meeting VALUES ('003', '11:00', 1, 'Electronics', 'Electronics.com');
INSERT INTO meeting VALUES ('004', '12:00', 4, 'Hydraulics', 'Hydraulics.com');
INSERT INTO meeting VALUES ('005', '18:00', 3, 'Numerical', 'Numerical.com');
INSERT INTO meeting VALUES ('006', '05:00', 1, 'Statistics', 'Statistics.com');
INSERT INTO meeting VALUES ('007', '15:00', 2, 'Structures', 'Structures.com');
INSERT INTO meeting VALUES ('008', '23:00', 1, 'Programming', 'Programming.com');
INSERT INTO meeting VALUES ('009', '02:00', 3, 'Microwave', 'Microwave.com');

INSERT INTO meetingHost VALUES ('01', '001');
INSERT INTO meetingHost VALUES ('02', '001');
INSERT INTO meetingHost VALUES ('03', '001');
INSERT INTO meetingHost VALUES ('04', '002');
INSERT INTO meetingHost VALUES ('05', '002');
INSERT INTO meetingHost VALUES ('06', '002');
INSERT INTO meetingHost VALUES ('07', '003');
INSERT INTO meetingHost VALUES ('08', '003');
INSERT INTO meetingHost VALUES ('09', '003');
INSERT INTO meetingHost VALUES ('10', '004');
INSERT INTO meetingHost VALUES ('11', '005');
INSERT INTO meetingHost VALUES ('12', '005');
INSERT INTO meetingHost VALUES ('13', '005');
INSERT INTO meetingHost VALUES ('14', '006');
INSERT INTO meetingHost VALUES ('15', '006');
INSERT INTO meetingHost VALUES ('16', '007');
INSERT INTO meetingHost VALUES ('17', '007');
INSERT INTO meetingHost VALUES ('18', '007');
INSERT INTO meetingHost VALUES ('19', '008');
INSERT INTO meetingHost VALUES ('20', '008');
INSERT INTO meetingHost VALUES ('21', '009');
INSERT INTO meetingHost VALUES ('22', '009');
INSERT INTO meetingHost VALUES ('23', '009');
INSERT INTO meetingHost VALUES ('24', '009');

INSERT INTO meetingParticipant VALUES ('1807001', '001');
INSERT INTO meetingParticipant VALUES ('1807002', '001');
INSERT INTO meetingParticipant VALUES ('1807003', '001');
INSERT INTO meetingParticipant VALUES ('1807004', '002');
INSERT INTO meetingParticipant VALUES ('1807005', '002');
INSERT INTO meetingParticipant VALUES ('1803001', '002');
INSERT INTO meetingParticipant VALUES ('1803002', '003');
INSERT INTO meetingParticipant VALUES ('1803003', '003');
INSERT INTO meetingParticipant VALUES ('1803004', '003');
INSERT INTO meetingParticipant VALUES ('1803005', '004');
INSERT INTO meetingParticipant VALUES ('1801001', '005');
INSERT INTO meetingParticipant VALUES ('1801002', '005');
INSERT INTO meetingParticipant VALUES ('1801003', '005');
INSERT INTO meetingParticipant VALUES ('1801004', '006');
INSERT INTO meetingParticipant VALUES ('1801005', '006');
INSERT INTO meetingParticipant VALUES ('1805001', '007');
INSERT INTO meetingParticipant VALUES ('1805002', '007');
INSERT INTO meetingParticipant VALUES ('1805003', '007');
INSERT INTO meetingParticipant VALUES ('1805004', '008');
INSERT INTO meetingParticipant VALUES ('1805005', '008');
INSERT INTO meetingParticipant VALUES ('1809001', '009');
INSERT INTO meetingParticipant VALUES ('1809002', '009');
INSERT INTO meetingParticipant VALUES ('1809003', '009');
INSERT INTO meetingParticipant VALUES ('1809004', '009');


--check trigger
select birthdate,age from student;

--LAB 02 & 03:


--Description of each table
DESC course;
DESC department;
DESC teacher;
DESC student;
DESC meeting;
DESC meetingHost;
DESC meetingParticipant;

--Data according each table
select * from course;
select * from department;
select * from teacher;
select * from student;
select * from meeting;
select * from meetingHost;
select * from meetingParticipant;

--Add operation (adding column)
alter table course add add_column VARCHAR2(50);
desc course;
select * from course;

--Drop operation (dropping column)
alter table course drop column add_column;
desc course;
select * from course;

--Rename operation (renaming column)
alter table department rename column phoneNo to p_NO;
desc department;
select * from department;

alter table department rename column p_NO to phoneNo;
desc department;
select * from department;

--Update operation (updating a value)
update department set phoneNo = 'NOphone' where deptCode='CSE';
desc department;

select * from department;

update department set phoneNo = '01719182195' where deptCode='CSE';
desc department;

select * from department;

--Delete operation (deleting a row from tags table)
delete from course where courseNo='Hum3109';
desc course;
select * from course;
INSERT INTO course VALUES ('Hum3109', 'Government', '3.0', 'ECE');
select * from course;

--Renaming field
select (duration) as timeSpan from meeting; 


--Range Search
SELECT meetingId, topic FROM meeting
WHERE time BETWEEN '12' AND '20';

--Ordering by column values
SELECT meetingId, topic FROM meeting ORDER BY time; 

SELECT meetingId, topic FROM meeting ORDER BY time desc;



--Lab 04:



--Pattern Matching
select courseNo from course
where courseNo like '%CSE%';

select courseNo from course
where courseNo like 'ECE%';

select courseNo from course
where courseNo like '%01';


--aggregate functions:
select  max(duration) from meeting;
select min(time) from meeting;
select  sum(creditHour) from course where courseNo='Lecturer';
select count(deptCode) from student;
select  avg(duration) from meeting;



--Group BY clause
select count(teacherId) from teacher group by deptId;


--HAVING clause
select count(teacherId) from teacher  group by deptId having deptId ='ECE';




--Lab-05:


--nested query
select teacherName from teacher where deptId in (select deptCode from student where studentRoll='1807004');


--union all operation
SELECT meetingId, topic FROM meeting
WHERE time BETWEEN '1' AND '5';
union all  
SELECT meetingId, topic FROM meeting
WHERE time BETWEEN '12' AND '19';

--union operation
SELECT meetingId, topic FROM meeting
WHERE time BETWEEN '1' AND '10';
union  
SELECT meetingId, topic FROM meeting
WHERE time BETWEEN '12' AND '19';

--intersection operation
SELECT meetingId, topic FROM meeting
WHERE time BETWEEN '3' AND '10';
INTERSECT  
SELECT meetingId, topic FROM meeting
WHERE time BETWEEN '14' AND '19';




--lab 06:

--join
select me.meetingId,t.teacherName from meetingHost me join
teacher t on me.teacherID = t.teacherID;

select me.meetingId, s.Name from meetingParticipant me join
student s on me.studentRoll = s.studentRoll;

--lab 07,08,09(pl/sql


-- finding the duration of meeting whose begin time is minimum
SET SERVEROUTPUT ON
DECLARE
   first_meeting_time  meeting.time%type;
   first_meeting_duration  meeting.duration%type;
BEGIN
    SELECT MIN(time)  INTO first_meeting_time
   FROM meeting;


    SELECT duration  INTO first_meeting_duration
   FROM meeting WHERE time=first_meeting_time;


   DBMS_OUTPUT.PUT_LINE('The First meeting duration is : ' || first_meeting_duration);
 END;
/


-- print all teacher ids of one meeting id
SET SERVEROUTPUT ON
DECLARE
    CURSOR host_cur IS SELECT teacherId, meetingId FROM meetingHost;
    host_record host_cur%ROWTYPE;
    meet_id meeting.meetingId%TYPE;
    rowcount integer;
BEGIN
    meet_id := '001';
    select count(*) INTO rowcount from meetingHost;
OPEN host_cur;
    
    LOOP
        FETCH host_cur INTO host_record;
        IF host_record.meetingId=meet_id THEN
            DBMS_OUTPUT.PUT_LINE ('Teacher ID : ' || host_record.teacherID);
        END iF;
        EXIT WHEN host_cur%ROWCOUNT >= rowcount;
    END LOOP;
CLOSE host_cur;   
END;
/


--Find the department of students who are joining meeting id by procedure
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE find_student_dept( meet_id meeting.meetingId%TYPE) IS

    CURSOR participant_cur IS SELECT studentRoll, meetingId FROM meetingParticipant;
    participant_record participant_cur%ROWTYPE;
    student_roll student.studentRoll%TYPE;
    dept_code student.deptCode%TYPE;
    rowcount integer;
BEGIN
    select count(*) INTO rowcount from meetingParticipant;
OPEN participant_cur;
    
    LOOP
        FETCH participant_cur INTO participant_record;
        IF participant_record.meetingId = meet_id THEN
            student_roll := participant_record.studentRoll;
            SELECT deptCode INTO dept_code FROM student WHERE studentRoll = student_roll;
            DBMS_OUTPUT.PUT_LINE('Students Department Code : ' || dept_code);
        END iF;
        EXIT WHEN participant_cur%ROWCOUNT >= rowcount;
    END LOOP;
CLOSE participant_cur;   
END find_student_dept;
/
SHOW ERRORS;

BEGIN
    find_student_dept('001');
END;
/



-- find number of teachers in meeting id by function
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION number_of_teacher( meet_id meeting.meetingId%TYPE) RETURN NUMBER IS
    ret NUMBER;
BEGIN
    SELECT count(teacherId) INTO ret FROM meetingHost WHERE meetingId = meet_id;
    RETURN RET;

END number_of_teacher;
/
SHOW ERRORS;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Number of teachers in meeting 001 is ' || number_of_teacher('001'));
END;
/


