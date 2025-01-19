#ASSIGNMENT 3

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(255) NOT NULL,
    Last_name VARCHAR(255) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age >= 18),  
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),  
    Department VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Managers (Manager_Id, First_name, Last_name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1985-06-15', 39, 'M', 'IT', 30000),
(2, 'Aaliya', 'Khan', '1990-02-20', 34, 'F', 'HR', 25000),
(3, 'Rahul', 'Sharma', '1978-08-25', 46, 'M', 'Finance', 35000),
(4, 'Neha', 'Verma', '1987-12-10', 37, 'F', 'Marketing', 27000),
(5, 'Karan', 'Singh', '1992-03-05', 32, 'M', 'IT', 32000),
(6, 'Priya', 'Patel', '1983-07-13', 41, 'F', 'Operations', 24000),
(7, 'Anil', 'Gupta', '1979-09-30', 45, 'M', 'IT', 33000),
(8, 'Sanya', 'Reddy', '1989-11-18', 35, 'F', 'HR', 26000),
(9, 'Vikas', 'Singh', '1980-01-25', 44, 'M', 'Finance', 34000),
(10, 'Simran', 'Chawla', '1991-04-10', 33, 'F', 'Marketing', 28000);

SELECT First_name, Last_name, DOB
FROM Managers
WHERE Manager_Id = 1;

SELECT First_name, Last_name, Salary, Salary * 12 AS Annual_Income
FROM Managers;

SELECT *
FROM Managers
WHERE First_name != 'Aaliya';

SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;







