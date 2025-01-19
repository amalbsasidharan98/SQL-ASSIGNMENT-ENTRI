#ASSIGNMENT 4 QUERYING DATA

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(255) NOT NULL,
    Population INT NOT NULL,
    Area INT NOT NULL
);


CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(255) NOT NULL,
    Lname VARCHAR(255) NOT NULL,
    Population INT NOT NULL,
    Rating DECIMAL(3, 2) NOT NULL,
    Country_Id INT,
    Country_name VARCHAR(255),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 68000000, 243610),
(4, 'India', 1366000000, 3287263),
(5, 'Australia', 26000000, 7692024),
(6, 'China', 1400000000, 9596961),
(7, 'Brazil', 213993437, 8515767),
(8, 'Germany', 83000000, 357022),
(9, 'France', 67000000, 551695),
(10, 'Japan', 126800000, 377975);


INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Ava', 'Smith', 331000000, 4.8, 1, 'USA'),
(3, 'William', 'Jones', 1366000000, 4.2, 4, 'India'),
(4, 'Olivia', 'Brown', 1366000000, 3.9, 4, 'India'),
(5, 'Liam', 'Miller', 38000000, 4.7, 2, 'Canada'),
(6, 'Isabella', 'Taylor', 26000000, 4.6, 5, 'Australia'),
(7, 'Lucas', 'Anderson', 68000000, 4.0, 3, 'UK'),
(8, 'Mia', 'Thomas', 213993437, 4.1, 7, 'Brazil'),
(9, 'Ethan', 'Jackson', 68000000, 5.0, 3, 'UK'),
(10, 'Sophia', 'White', 126800000, 3.5, 10, 'Japan');

SELECT DISTINCT Country_name
FROM Persons;

SELECT Fname AS First_Name, Lname AS Last_Name
FROM Persons;

SELECT *
FROM Persons
WHERE Rating > 4.0;

SELECT Country_name
FROM Country
WHERE Population > 1000000;

SELECT *
FROM Persons
WHERE Country_name = 'USA' OR Rating > 4.5;

SELECT *
FROM Persons
WHERE Country_name IS NULL;

SELECT *
FROM Persons
WHERE Country_name IN ('USA', 'Canada', 'UK');

SELECT *
FROM Persons
WHERE Country_name NOT IN ('India', 'Australia');

SELECT Country_name
FROM Country
WHERE Population BETWEEN 500000 AND 20000000;

SELECT Country_name
FROM Country
WHERE Country_name NOT LIKE 'C%';




