#ASSIGNMENT 6

#ANS 1. Perform Inner Join
SELECT 
    Country.Country_name AS Country_Table_Name,
    Persons.Fname AS Person_First_Name,
    Persons.Lname AS Person_Last_Name,
    Persons.Rating AS Person_Rating
FROM Country
INNER JOIN Persons
ON Country.Id = Persons.Country_Id;

#ANS 2. Perform Left Join
SELECT 
    Country.Country_name AS Country_Table_Name,
    Persons.Fname AS Person_First_Name,
    Persons.Lname AS Person_Last_Name,
    Persons.Rating AS Person_Rating
FROM Country
LEFT JOIN Persons
ON Country.Id = Persons.Country_Id;

#ANS 3. Perform Right Join
SELECT 
    Country.Country_name AS Country_Table_Name,
    Persons.Fname AS Person_First_Name,
    Persons.Lname AS Person_Last_Name,
    Persons.Rating AS Person_Rating
FROM Country
RIGHT JOIN Persons
ON Country.Id = Persons.Country_Id;

#ANS  4. List All Distinct Country Names from Both Tables
SELECT DISTINCT Country_name
FROM (
    SELECT Country_name FROM Country
    UNION
    SELECT Country_name FROM Persons
) AS AllCountries;

#ANS 5. List All Country Names from Both Tables, Including Duplicates
SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;

#ANS 6. Round the Ratings of All Persons to the Nearest Integer
SELECT 
    Id,
    Fname,
    Lname,
    ROUND(Rating, 0) AS Rounded_Rating
FROM Persons;
