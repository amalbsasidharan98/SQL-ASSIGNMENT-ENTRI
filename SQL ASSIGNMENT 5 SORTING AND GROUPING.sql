#ASSIGNMENT 5 SORTING AND GROUPING DATA

#ANS1: Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(255) NOT NULL,
    Population INT NOT NULL,
    Area INT NOT NULL
);

#ANS2: Create the Persons table
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

#ANS 3: Insert data into the Country table
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

#ANS 4: Insert data into the Persons table
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

#1. Print the first three characters of Country_name from the Country table
SELECT LEFT(Country_name, 3) AS Country_Abbr
FROM Country;

#2. Concatenate first name and last name from the Persons table
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM Persons;

# 3. Count the number of unique country names from the Persons table
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries
FROM Persons;

#4. Print the maximum population from the Country table
SELECT MAX(Population) AS Max_Population
FROM Country;

# 5. Print the minimum population from the Persons table
SELECT MIN(Population) AS Min_Population
FROM Persons;

#6. Insert 2 new rows with NULL in Lname, and count the number of NULL Lnames

ALTER TABLE Persons MODIFY Lname VARCHAR(100) NULL;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'James', NULL, 1000000, 4.1, 2, 'Canada'),
(12, 'Emma', NULL, 8000000, 4.5, 3, 'UK');

-- Count how many rows have NULL in Lname
SELECT COUNT(*) AS Null_Lnames
FROM Persons
WHERE Lname IS NULL;

#ANS 7. Find the number of rows in the Persons table
SELECT COUNT(*) AS Total_Persons
FROM Persons;
# ANS 8. Show the population of the Country table for the first 3 rows (Use LIMIT)
SELECT Population
FROM Country
LIMIT 3;

#ANS 9. Print 3 random rows of countries (Use RAND() and LIMIT)
SELECT Country_name
FROM Country
ORDER BY RAND()
LIMIT 3;

#ANS 10. List all persons ordered by their rating in descending order
SELECT Fname, Lname, Rating
FROM Persons
ORDER BY Rating DESC;

#ANS 11. Find the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

#ANS 12. Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

#ANS 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;

