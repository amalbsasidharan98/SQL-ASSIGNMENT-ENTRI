#assignment 2
CREATE DATABASE Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255) NOT NULL,
    Product_Category VARCHAR(255) NOT NULL,
    Ordered_item VARCHAR(255) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

ALTER TABLE Orders
ADD order_quantity INT NOT NULL;

RENAME TABLE Orders TO sales_orders;

INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES
(1, 'Alice Johnson', 'Electronics', 'Smartphone', '123-456-7890', 2),
(2, 'Bob Smith', 'Clothing', 'T-shirt', '234-567-8901', 3),
(3, 'Charlie Brown', 'Books', 'Novel', '345-678-9012', 1),
(4, 'Diana Prince', 'Groceries', 'Apples', '456-789-0123', 5),
(5, 'Eve Adams', 'Electronics', 'Laptop', '567-890-1234', 1),
(6, 'Frank Castle', 'Furniture', 'Chair', '678-901-2345', 4),
(7, 'Grace Lee', 'Clothing', 'Jeans', '789-012-3456', 2),
(8, 'Hannah Scott', 'Groceries', 'Bread', '890-123-4567', 10),
(9, 'Ivy Green', 'Books', 'Cookbook', '901-234-5678', 1),
(10, 'Jack White', 'Electronics', 'Headphones', '012-345-6789', 3);

SELECT Customer_name, Ordered_item
FROM sales_orders;

UPDATE sales_orders
SET Ordered_item = 'Gaming Laptop'
WHERE Order_Id = 5;

desc sales_orders;

DROP TABLE sales_orders;