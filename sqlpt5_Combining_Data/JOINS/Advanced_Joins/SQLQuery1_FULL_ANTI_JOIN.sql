/*
[FULL ANTI JOIN]:
-----------------
(A:**DATA** ( ) B:**DATA**)	
	- Return Only the Rows that Don't Match in either Tables
	- Only unmatching rows from both Left & Right tables
	* Table ORDER DOESN'T MATTER
	- Syntax:
		SELECT *
		FROM A
		FULL JOIN B
		ON A.key = B.key
		WHERE B.key IS NULL
		OR A.key IS NULL

*/

-- Find customers without orders & orders without customers
USE MyDatabase

SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL
OR c.id IS NULL

-- OR SAME THING DIFFERENT ORDER

SELECT *
FROM orders AS o
FULL JOIN customers AS c 
ON c.id = o.customer_id
WHERE c.id IS NULL 
OR o.customer_id IS NULL



