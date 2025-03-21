# Create the library database
CREATE DATABASE library;
USE library;

# Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

# Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

# Books Table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status ENUM('Yes', 'No'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

# Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

# IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

# ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

# Insert sample data into Branch
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'Delhi', '9876543210'),
(2, 102, 'Mumbai', '8765432109'),
(3, 103, 'Bangalore', '7654321098');

# Insert sample data into Employee
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'Amit Sharma', 'Manager', 75000, 1),
(202, 'Priya Verma', 'Librarian', 50000, 1),
(203, 'Rahul Iyer', 'Assistant Librarian', 45000, 2),
(204, 'Sunita Reddy', 'Clerk', 30000, 2),
(205, 'Vikram Patel', 'Librarian', 55000, 3),
(206, 'Neha Singh', 'Assistant Librarian', 40000, 3);

# Insert sample data into Books
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(1001, 'Data Science Basics', 'Technology', 30.00, 'Yes', 'Andrew Ng', 'Pearson'),
(1002, 'Machine Learning', 'Technology', 35.00, 'No', 'Tom Mitchell', 'Springer'),
(1003, 'History of India', 'History', 25.00, 'Yes', 'Romila Thapar', 'Penguin'),
(1004, 'Modern History', 'History', 20.00, 'No', 'Bipan Chandra', 'Oxford'),
(1005, 'Chemistry for Beginners', 'Science', 28.00, 'Yes', 'Peter Atkins', 'Cambridge');

# Insert sample data into Customer
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Rajesh Kumar', 'Delhi', '2021-06-15'),
(302, 'Sneha Mehta', 'Mumbai', '2022-03-10'),
(303, 'Anil Kapoor', 'Bangalore', '2021-12-25'),
(304, 'Kavita Nair', 'Kolkata', '2023-01-20');

# Insert sample data into IssueStatus
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(401, 301, 'Machine Learning', '2023-06-10', 1002),
(402, 302, 'Modern History', '2023-07-05', 1004),
(403, 304, 'Data Science Basics', '2023-06-18', 1001);

# Insert sample data into ReturnStatus
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, 'Machine Learning', '2023-06-25', 1002),
(502, 302, 'Modern History', '2023-07-15', 1004);
# Display all tables
SHOW TABLES;

# QUERIES:

#QS  1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'Yes';

#QS 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

#QS 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

#QS  4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

#QS 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

#QS  6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT C.Customer_name FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

#QS 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no;

#QS 8. Display the names of customers who have issued books in the month of June 2023.
SELECT C.Customer_name FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#QS 9. Retrieve book_title from book table containing 'History'.
SELECT Book_title FROM Books WHERE Category LIKE '%History%';

#QS 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

#QS  11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

#QS 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT C.Customer_name FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;
