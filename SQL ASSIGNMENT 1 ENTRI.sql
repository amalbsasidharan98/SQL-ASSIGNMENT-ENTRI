#creating a database for assignment 1
create database ASSIGNMENT1;
use ASSIGNMENT1;

#CREATING TABLE FOR STUDENTS Roll_No Name Marks Grade 
create table Student(
ROLL_NUM int primary key,
Student_Name varchar(50) not null ,
Marks int ,
grade char(1) check (grade in ('A','B','C','D','F'))
);

DESC student;

INSERT INTO Student (ROLL_NUM, Student_Name, Marks, grade)
VALUES ('1', 'John W', '85', 'B');

DESC STUDENT;

#alter :  Add a column named Contact to the STUDENT table.
ALTER TABLE student ADD COLUMN Contact int;

desc student;

ALTER TABLE student drop COLUMN grade;

#Rename the table to CLASSTEN

RENAME Table student TO CLASS_TEN;

#  desc class_ten;Delete all rows from the table

TRUNCATE TABLE class_ten;
desc class_ten;

# Remove the table from the database.

DROP TABLE CLASS_TEN;
DESC CLASS_TEN; 
