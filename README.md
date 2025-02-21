### SQL-ASSIGNMENT-ENTRI
## ASSIGNMENT NUMBER 1 DDL COMMANDS

Create a database named School and perform all the DDL commands(CREATE, ALTER, DROP, RENAME, TRUNCATE) for the table named STUDENT with fields: Roll_No Name Marks Grade 

Create data on your own based on the given columns 

(1) Use the select command to display the table

(2) Add a column named Contact to the STUDENT table.

 (3) Remove the Grade column from the Student table.

 (4) Rename the table to CLASSTEN.

 (5) Delete all rows from the table.

 (6) Remove the table from the database.

 ## SQL ASSIGNMENT 2

Create a database called “Sales” and create a new table named “Orders” in the Sales database with columns: (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No).
Use constraints: Primary Key Unique Not Null 

1. Add a new column named “order_quantity” to the orders table. 

2. Rename the orders table to the sales_orders table. 

3. Insert 10 rows into the sales_orders table.

4. Retrieve customer_name and Ordered_Item from the sales_orders table. 

5. Use the update command to change the name of the product for any row. 

6. Delete the sales_orders table from the database.

 ## ASSIGNMENT 3 SQL

Create a table named Managers with fields : Manager_Id First_name Last_Name DOB Age ->Use check constraint Last_update Gender Department Salary -> NOT NULL

 1. Insert 10 rows. 

2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1. 

3. Write a query to display the annual income of all managers. 

4. Write a query to display records of all managers except ‘Aaliya’.

 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month. 

6. Write a query to display details of managers whose salary is between 10000 and 35000.

## ASSIGNMENT 4 QUERYING DATA


Insert 10 rows into both tables, as given below.
 Create a table named Country with fields: Id Country_name Population Area
 Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name

 (1)List the distinct country names from the Persons table 

(2)Select first names and last names from the Persons table with aliases.

 (3)Find all persons with a rating greater than 4.0. 

(4)Find countries with a population greater than 10 lakhs.

 (5)Find persons who are from 'USA' or have a rating greater than 4.5. 

(6)Find all persons where the country name is NULL.

 (7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 

(8)Find all persons not from the countries 'India' and 'Australia'.


## ASSIGNMENT 5-Sorting and Grouping data
Insert 10 rows into both tables, as given below. Create a table named Country with fields: Id Country_name Population Area Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
 1. Write an SQL query to print the first three characters of Country_name from the Country table.
 2.  Write an SQL query to concatenate first name and last name from Persons table.
 3.  Write an SQL query to count the number of unique country names from Persons table.
 4.   Write a query to print the maximum population from the Country table.
 5.Write a query to print the minimum population from Persons table.
 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
 7. Write a query to find the number of rows in the Persons table.
 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)
 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
 10. List all persons ordered by their rating in descending order.
 11. Find the total population for each country in the Persons table.
 12. Find countries in the Persons table with a total population greater than 50,000
 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.

## ASSIGNMENT 6 SQL- UNIONS AND JOINS

Consider the Country table and Persons table that you created earlier and perform the following:

 (1)Perform inner join, Left join, and Right join on the tables. 

(2)List all distinct country names from both the Country and Persons tables.

 (3)List all country names from both the Country and Persons tables, including duplicates.

 (4)Round the ratings of all persons to the nearest integer in the Persons table

## ASSIGNMENT 7 SQL- FUNCTIONS
Consider the Country table and Persons table that you created earlier and perform the following: 
1. Add a new column called DOB in Persons table with data type as Date.
2. Write a user-defined function to calculate age using DOB.
3. Write a select query to fetch the Age of all persons using the function that has been created.
4. Find the length of each country name in the Country table.
5. Extract the first three characters of each country's name in the Country table.
6. Convert all country names to uppercase and lowercase in the Country table.





