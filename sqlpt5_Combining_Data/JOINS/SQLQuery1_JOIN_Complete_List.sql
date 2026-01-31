-- JOIN COMPLETE LIST



-- BASIC JOINS

-- 1.) NO Join
-- Retrieve all data from customers & orders in 2 different results
SELECT *
FROM MyDatabase.dbo.customers;

SELECT *
FROM MyDatabase.dbo.orders;



-- 2.) INNER JOIN = MATCHING DATA

-- HIGHLIGHT TO VIEW SEE WHICH COLUMNS CAN CONNECT->MATCH
SELECT *
FROM MyDatabase.dbo.customers

SELECT *
FROM MyDatabase.dbo.orders

--Get all customers along with their orders, only for customers who placed order
SELECT * 
FROM MyDatabase.dbo.customers
INNER JOIN MyDatabase.dbo.orders
ON customers.id = orders.customer_id

-- Select specific columns
SELECT 
MyDatabase.dbo.customers.id, 
MyDatabase.dbo.customers.first_name,
MyDatabase.dbo.customers.country, 
MyDatabase.dbo.orders.order_date, 
MyDatabase.dbo.orders.order_id
FROM MyDatabase.dbo.customers
INNER JOIN MyDatabase.dbo.orders
ON MyDatabase.dbo.customers.id = MyDatabase.dbo.orders.customer_id

-- Select specific columns
SELECT 
Cus.id, 
Cus.first_name,
Cus.country, 
O.order_date, 
O.order_id
FROM MyDatabase.dbo.customers AS Cus
INNER JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id

-- 3.) LEFT JOIN = All rows from left (Primary source of data) & only matching from right (Secondary need additional data)
-- (A TABLE - ALL Data - 'B') B)
/*
Syntax: INNER JOIN ORDER DOESN'T MATTER
SELECT *
FROM TABLE_A
{LEFT:TYPE} JOIN TABLE_B
ON <condition: A.Key = B.Key >
*/
-- LEFT Primary Table
SELECT *
FROM MyDatabase.dbo.customers

-- Right Secondary Table
SELECT *
FROM MyDatabase.dbo.orders

SELECT *
FROM MyDatabase.dbo.customers AS Cus
LEFT JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id

-- Get all customers along w/their orders, including those without orders
SELECT 
Cus.id,
Cus.first_name,
O.order_id,
O.sales
FROM MyDatabase.dbo.customers AS Cus
LEFT JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id






-- ADVANCED JOINS


-- How to Choose The Right Join


-- How To Join Multiple Tables