-- 1.) LEFT ANTI JOIN: A table (Only Unmatching rows) B table (nothing) 

-- (A:**DATA**( ~~ ) ~~ ): [A] Primary Main Source of Data, [B] Lookup (filter) Not for Data, Just a filter
--	- Return rows from Left that has No MATCH IN RIGHT TABLE. Nothing intercepting 
--	- left is primary & right just lookup (filter)
--	* Only unmatching Left TABLE rows

/*
The Order of table is Important

Syntax:
SELECT *
FROM A
LEFT JOIN B
ON A.Key = B.Key
WHERE B.Key IS NULL
*/

-- Get all customers who haven't placed any order
USE MyDatabase

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL