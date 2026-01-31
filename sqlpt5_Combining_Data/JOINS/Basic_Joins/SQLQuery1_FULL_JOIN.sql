-- FULL Join: Returns All Rows from Both Tables
-- (A:**DATA** ( A:**DATA**:B ) B:**DATA**)
/*
Syntax: FULL JOIN Table ORDER DOESN'T MATTER
	SELECT *
	FROM TABLE_A
	FULL JOIN TABLE_B
	ON <condition: A.Key = B.Key >
		
	or
		
	SELECT *
	FROM TABLE_B
	FULL JOIN TABLE_A
	ON <condition: A.Key = B.Key >
*/


/* Get all customers & all orders, 
 even if there's no match */
USE MyDatabase
SELECT 
c.id, 
c.first_name,
O.order_id, 
O.sales
FROM customers AS c
FULL JOIN orders AS O
ON C.id = O.customer_id


SELECT 
c.id, c.first_name,
O.order_id, O.sales
FROM MyDatabase.dbo.orders AS O
FULL JOIN MyDatabase.dbo.customers AS c
ON C.id = O.customer_id
