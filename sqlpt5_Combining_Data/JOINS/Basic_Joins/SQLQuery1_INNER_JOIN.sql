-- INNER JOIN = MATCHING DATA
-- ( ~~ ( A:**DATA**:B ) ~~ )

--Get all customers along with their orders, only for customers who placed order
USE MyDatabase

SELECT * 
FROM customers
INNER JOIN orders
ON id = customer_id

-- or 
SELECT * 
FROM MyDatabase.dbo.customers
INNER JOIN MyDatabase.dbo.orders
ON customers.id = orders.customer_id

-- Or customer and order matching
USE MyDatabase
SELECT *
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id



-- Select specific columns
USE MyDatabase
SELECT 
id, 
first_name,
country, 
order_date, 
order_id
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id

-- Select specific columns and table where data is coming from 
SELECT 
Cus.id, 
Cus.first_name,
Cus.country, 
O.order_date, 
O.order_id
FROM MyDatabase.dbo.customers AS Cus
INNER JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id

-- Same results, if table order changes
SELECT 
Cus.id, 
Cus.first_name,
Cus.country, 
O.order_date, 
O.order_id
FROM MyDatabase.dbo.orders AS O 
INNER JOIN MyDatabase.dbo.customers AS Cus
ON Cus.id = O.customer_id
