-- RIGHT Join
-- ( ~~ ( A:**DATA**:B ) B:**DATA**)
-- Return All rows from Right & Only matching from left

-- RIGHT Primary Table
SELECT *
FROM MyDatabase.dbo.orders

-- LEFT Secondary Table
SELECT *
FROM MyDatabase.dbo.customers

--Get all customers along w/their orders, including orders without matching customers (RIGHT JOIN)
USE MyDatabase

SELECT 
	c.id,
	c.first_name,
	c.country,
	o.order_id,
	o.sales
FROM customers AS C
RIGHT JOIN orders AS O
ON C.id = O.customer_id

--** (POPULATE) Get all customers along w/their orders, 
-- including orders without matching customers (LEFT JOIN) SAME RESULTS
-- SAME RESULTS (B:**DATA** ( B:**DATA**:A ) ~~ )
USE MyDatabase
SELECT 
	c.id,
	c.first_name,
	c.country,
	o.order_id,
	o.sales
FROM orders AS O 
LEFT JOIN customers AS C
ON C.id = O.customer_id

