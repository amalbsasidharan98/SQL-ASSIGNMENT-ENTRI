#ans 1: Add a new column called DOB in the Persons table
ALTER TABLE Persons ADD COLUMN DOB DATE;

#ans 2: Create a user-defined function to calculate age using DOB
DELIMITER $$

CREATE FUNCTION Calculate_Age(DOB DATE) 
RETURNS INT DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, DOB, CURDATE());
END $$

DELIMITER ;

#ans 3: Select query to fetch the Age of all persons using the function
SELECT Id, Fname, Lname, DOB, Calculate_Age(DOB) AS Age FROM Persons;

#ans  4: Find the length of each country name in the Country table
SELECT Country_name, LENGTH(Country_name) AS Name_Length FROM Country;

#ans 5: Extract the first three characters of each country's name in the Country table
SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars FROM Country;

#ans 6: Convert all country names to uppercase and lowercase in the Country table
SELECT Country_name, UPPER(Country_name) AS Uppercase_Name, LOWER(Country_name) AS Lowercase_Name FROM Country;


