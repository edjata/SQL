-- Challenge 
-- DON'T USE ( ~~ ( A:**DATA**:B ) ~~ ) :Inner Join

/*
Get all customers along with their orders,
but only for customers who have placed an order
WITHOUT USING INNER JOIN
*/

-- WITHOUT USING INNER JOIN
USE MyDatabase
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.sales IS NOT NULL

-- INNER JOIN
USE MyDatabase
SELECT *
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id