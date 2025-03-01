SELECT Country_name, COUNT(*) AS Total_Persons
FROM Persons
GROUP BY Country_name;

SELECT Country_name, COUNT(*) AS Total_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Total_Persons DESC;

SELECT Country_name, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

SELECT DISTINCT Country_name
FROM Persons
WHERE Rating IN (
    SELECT DISTINCT Rating FROM Persons WHERE Country_name = 'USA'
);

SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

CREATE DATABASE Product;

USE Product;

CREATE TABLE World_Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone_no VARCHAR(20),
    Address TEXT,
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(20),
    Country VARCHAR(100)
);

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM World_Customer;

SELECT * FROM customer_info;

CREATE VIEW US_Customers AS
SELECT * FROM World_Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM World_Customer;

SELECT * FROM Customer_details;

SELECT Customer_Id, First_name, Last_name FROM World_Customer WHERE State = 'California';

UPDATE World_Customer
SET Phone_no = '999-999-9999'
WHERE Customer_Id IN (1, 2, 3);

SELECT State, COUNT(*) AS Total_Customers
FROM World_Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Total_Customers
FROM Customer_details
GROUP BY State;

SELECT * FROM Customer_details
ORDER BY State ASC;

INSERT INTO World_Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Main St', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '456 Elm St', 'New York', 'New York', '10001', 'USA'),
(3, 'Emily', 'Johnson', 'emily.johnson@email.com', '555-123-4567', '789 Oak St', 'San Francisco', 'California', '94101', 'USA'),
(4, 'Michael', 'Brown', 'michael.brown@email.com', '777-888-9999', '101 Pine St', 'Chicago', 'Illinois', '60601', 'USA'),
(5, 'Chris', 'Wilson', 'chris.wilson@email.com', '222-333-4444', '202 Cedar St', 'Houston', 'Texas', '77001', 'USA'),
(6, 'Anna', 'Miller', 'anna.miller@email.com', '111-222-3333', '303 Birch St', 'Miami', 'Florida', '33101', 'USA'),
(7, 'David', 'Davis', 'david.davis@email.com', '666-777-8888', '404 Maple St', 'Seattle', 'Washington', '98101', 'USA'),
(8, 'Sophia', 'Garcia', 'sophia.garcia@email.com', '999-000-1111', '505 Walnut St', 'Boston', 'Massachusetts', '02101', 'USA'),
(9, 'James', 'Martinez', 'james.martinez@email.com', '444-555-6666', '606 Spruce St', 'Denver', 'Colorado', '80201', 'USA'),
(10, 'Olivia', 'Taylor', 'olivia.taylor@email.com', '333-444-5555', '707 Redwood St', 'San Diego', 'California', '92101', 'USA');

CREATE VIEW US_Customers AS
SELECT * FROM World_Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM World_Customer;

SELECT * FROM Customer_details;

SELECT Customer_Id, First_name, Last_name FROM World_Customer WHERE State = 'California';

UPDATE World_Customer
SET Phone_no = '999-999-9999'
WHERE Customer_Id IN (1, 2, 3);

SELECT State, COUNT(*) AS Total_Customers
FROM World_Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Total_Customers
FROM Customer_details
GROUP BY State;

SELECT * FROM Customer_details
ORDER BY State ASC;






























