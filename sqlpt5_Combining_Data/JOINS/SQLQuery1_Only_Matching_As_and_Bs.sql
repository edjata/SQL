-- 3b.) Only Matching ( A ( A & B:DATA ) B)
-- Only Matching -> ( A ( A & B:DATA ) B) <- Only Matching 
-- Only Matching Data from A & B

-- Return Only Rows that Match in both Tables

/* 
Get all customers along their orders,
but only for customers who have placed an order
(Without using INNER JOIN)
*/

SELECT *
FROM customers AS c
LEFT JOIN MyDatabase.dbo.orders AS o
ON c.id = o.customer_id
WHERE o.customer_id > 0

SELECT *
FROM customers AS c
LEFT JOIN MyDatabase.dbo.orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL



