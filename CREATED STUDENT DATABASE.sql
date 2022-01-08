
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS CAMPUS;
DROP TABLE IF EXISTS ROOM;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS INSTRUCTOR;
DROP TABLE IF EXISTS APPROVED_INSTRUCTOR;
DROP TABLE IF EXISTS CLASS;
DROP TABLE IF EXISTS STUDENT_GRADE;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE STUDENT(
Student_ID   VARCHAR(20),
Last_Name    VARCHAR(40) NOT NULL,
First_Name   VARCHAR(40) NOT NULL,
Address      VARCHAR(50),
Zip          VARCHAR(20),
Major        VARCHAR(40),
Class       int(4),
Status      VARCHAR(25),
PRIMARY KEY(Student_ID)
);
INSERT INTO STUDENT(Student_ID,Last_Name,First_Name,Address,Zip,Major,Class,Status)	
	VALUES('7700','Claudia','Porter','P.O. Box 1530, 0999 Diel Dr.','95035','COMPUTER SCIENCE',1,'PERFOMING'); 
    
INSERT INTO STUDENT(Student_ID,Last_Name,First_Name,Address,Zip,Major,Class,Status)	
	VALUES('7701','Sakota','Emersion','P.O. Box 162, 3rd St Idaho Falls.','83401','ENGINEERING',3,'PERFOMING'); 
    
INSERT INTO STUDENT(Student_ID,Last_Name,First_Name,Address,Zip,Major,Class,Status)	
	VALUES('7702','Roly','Fitgarelard','P.O. Box 1101, Stieren Ave','15014','INFORMATION TECHNOLOGY',4,'PERFOMING'); 
    
INSERT INTO STUDENT(Student_ID,Last_Name,First_Name,Address,Zip,Major,Class,Status)	
	VALUES('7703','Tymon','Key','P.O. Box 526, 4999 Pace Run Ct','29223','STATISTICS',5,'FAILING'); 
    
INSERT INTO STUDENT(Student_ID,Last_Name,First_Name,Address,Zip,Major,Class,Status)	
	VALUES('7704','Hafsah','Blackmore','P.O. Box 183, Magnolia Shaw A St.','29152','ECONOMICS',2,'FAILING'); 
    
CREATE TABLE CAMPUS(
Campus_Name  VARCHAR (50),
Address      VARCHAR(50),
Zip          VARCHAR(50),
Phone_No   	 VARCHAR(50),
PRIMARY KEY(Campus_Name)
);
INSERT INTO CAMPUS (Campus_Name, Address, Zip, Phone_No)
	VALUES('Belmont University','1900 Belmont','37212','+1 220-000-000');
INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('The University of Chicago','5801 S Ellis Ave','62230','+ 1-333-183-9001');
    
INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('Furman University','3300 Poinsett Hwy','5100','+ 1-744-696-8731');
    
INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('Illinois Institute of Technology','10 W 35th St','0293','+ 1-880-455-5488');
    
INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('Vassar College','124 Raymond Ave','43535','+ 1-000-654-0900');


CREATE TABLE INSTRUCTOR(
Instructor_ID  VARCHAR(25),
Last_Name    VARCHAR(25) NOT NULL,
First_Name   VARCHAR(35) NOT NULL,
Address      VARCHAR(50),
Zip          VARCHAR(22),
Office_No    VARCHAR(35),
PRIMARY KEY (Instructor_ID)
);
INSERT INTO INSTRUCTOR(Instructor_ID,Last_Name,First_Name,Address,Zip,Office_No)
	VALUES('A4123','Orlando','Corona','101 E Cherry St','76374','10');
    
INSERT INTO INSTRUCTOR(Instructor_ID,Last_Name,First_Name,Address,Zip,Office_No)
	VALUES('A8164','Adele','White ','118 Oxford Rd Greenwood,','29649','4');
    
INSERT INTO INSTRUCTOR(Instructor_ID,Last_Name,First_Name,Address,Zip,Office_No)
	VALUES('A6660','Theon','Berg',' 10610 Ashville Pike #LOT 165 Lockbourne.','43137','14');
    
INSERT INTO INSTRUCTOR(Instructor_ID,Last_Name,First_Name,Address,Zip,Office_No)
	VALUES('A2290','Roksana','Ponce',' 835 Lee Dr Orrville','44667','15');
    
INSERT INTO INSTRUCTOR(Instructor_ID,Last_Name,First_Name,Address,Zip,Office_No)
	VALUES('K5463','Yuvraj','Stamp',' 1470 Rr 1 Nicholson, Pennsylvania(PA).','18446','2');
    
CREATE TABLE COURSE(
Course_No   	VARCHAR(25),
Course_Name     VARCHAR(50) NOT NULL UNIQUE,
CreditHours     VARCHAR(4),
PRIMARY KEY (Course_No)
);
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('2206','STA 111',1);
    
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('2207','BIT 413',2);
    
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('2208','CS 342',3);
    
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('2209','INF 234',2);
    
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('22010','FTC 467',3);

CREATE TABLE APPROVED_INSTRUCTOR(
Instructor_ID  VARCHAR(30), 
Course_No      VARCHAR(30),
FOREIGN KEY(Instructor_ID) REFERENCES INSTRUCTOR (Instructor_ID) ON UPDATE CASCADE,
FOREIGN KEY(Course_No) REFERENCES COURSE (Course_No) ON UPDATE CASCADE
);

INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('A4123','2206');
    
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('A8164','2207');
    
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('A6660','2208');
    
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('A2290','2209');
    
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('K5463','22010');
    
    
#table room
CREATE TABLE ROOM (
Room_No  VARCHAR (25),
Campus_Name VARCHAR (50),
Facility VARCHAR (30),
Capacity VARCHAR (50),
PRIMARY KEY (Room_No),
FOREIGN KEY(Campus_Name) REFERENCES CAMPUS (Campus_Name) ON UPDATE CASCADE
);

INSERT INTO ROOM(Room_No,Campus_Name,Facility,Capacity)	
	VALUES('1','The University of Chicago','YY', 40);
    
INSERT INTO ROOM(Room_No,Campus_Name,Facility,Capacity)	
	VALUES('2','Belmont University','FF', 23);
    
INSERT INTO ROOM(Room_No,Campus_Name,Facility,Capacity)	
	VALUES('4','Furman University','TT', 27);
    
INSERT INTO ROOM(Room_No,Campus_Name,Facility,Capacity)	
	VALUES('3','Illinois Institute of Technology','DF',35);
    
INSERT INTO ROOM(Room_No,Campus_Name,Facility,Capacity)	
	VALUES('5','Vassar College','KC',34);


Create TABLE CLASS(
Class_ID     VARCHAR(20),
Room_No      VARCHAR (25),
Course_No     VARCHAR(30) NOT NULL,
Section_No    VARCHAR(25),
Semester_No   Varchar(30),
Years         VARCHAR(4),
Instructor_ID  VARCHAR(20) NOT NULL,
Campus_Name    Varchar(50),
Start_Date    Date,
Start_Time    Time,
PRIMARY KEY (Class_ID),
FOREIGN KEY(Room_No) REFERENCES ROOM (ROOM_No) ON UPDATE CASCADE
);

INSERT INTO CLASS(Class_ID,Room_No,Course_No,Section_No,Semester_No,Years,Instructor_ID,Campus_Name,Start_Date,Start_Time)
	VALUES('101','1','2206','8','5','2021','A4123','The University of Chicago','2021-12-12','10:00');
    
INSERT INTO CLASS(Class_ID,Room_No,Course_No,Section_No,Semester_No,Years,Instructor_ID,Campus_Name,Start_Date,Start_Time)
	VALUES('102','2','2207','9','3','2021','A8164','The University of Chicago','2021-12-13','09:30');
    
INSERT INTO CLASS(Class_ID,Room_No,Course_No,Section_No,Semester_No,Years,Instructor_ID,Campus_Name,Start_Date,Start_Time)
	VALUES('103','2','2208','10','2','2021','A6660','Belmont University','2021-12-15','14:00');
    
INSERT INTO CLASS(Class_ID,Room_No,Course_No,Section_No,Semester_No,Years,Instructor_ID,Campus_Name,Start_Date,Start_Time)
	VALUES('104','3','2209','6','8','2021','A2290','Illinois Institute of Technology','2021-12-16','12:30');
    
INSERT INTO CLASS(Class_ID,Room_No,Course_No,Section_No,Semester_No,Years,Instructor_ID,Campus_Name,Start_Date,Start_Time)
	VALUES('105','5','22010','9','6','2021','K5463','Vassar College','2021-12-20','05:30');
    
CREATE TABLE STUDENT_GRADE(
Student_ID  VARCHAR(40), 
Class_ID   VARCHAR(25),
Student_Grade ENUM('A','B','C','D','F','W','E','Enrolled'),
FOREIGN KEY(Student_ID) REFERENCES STUDENT(Student_ID) ON UPDATE CASCADE,
FOREIGN KEY(Class_ID) REFERENCES CLASS(Class_ID) ON UPDATE CASCADE
);

INSERT INTO STUDENT_GRADE(Student_ID, Class_ID, Student_Grade)	
	VALUES('7700','101', 'A'); 
    
INSERT INTO STUDENT_GRADE(Student_ID, Class_ID,Student_Grade)	
	VALUES('7701','102','B');
    
INSERT INTO STUDENT_GRADE(Student_ID, Class_ID,Student_Grade)	
	VALUES('7702','103','C');
    
INSERT INTO STUDENT_GRADE(Student_ID, Class_ID,Student_Grade)	
	VALUES('7703','104','D');
    
INSERT INTO STUDENT_GRADE(Student_ID, Class_ID,Student_Grade)	
	VALUES('7704','105','E');
    
INSERT INTO STUDENT_GRADE(Student_ID, Class_ID,Student_Grade)	
	VALUES('7701','104','F');
    
INSERT INTO STUDENT_GRADE(Student_ID, Class_ID,Student_Grade)	
	VALUES('7702','105','W');
    
INSERT INTO STUDENT_GRADE(Student_ID, Class_ID,Student_Grade)	
	VALUES('7703','101','Enrolled');
    
    
    
COMMIT;
SHOW TABLES;

SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM INSTRUCTOR;
SELECT * FROM CAMPUS;
SELECT * FROM CLASS;
SELECT * FROM ROOM;
SELECT * FROM APPROVED_INSTRUCTOR;
SELECT * FROM STUDENT_GRADE;
    
    