-- 2.) RIGHT ANTI JOIN 

-- ( ~~ ( ~~ ) B:**DATA**)	
-- A table (filter) nothing & B table (primary) Only unmatching rows
-- Returns Rows from Right that has No MATCH in Left
/* 
( ~~ ( ~~ ) B:**DATA**)	
The Order of table is Important

Syntax:
	SELECT *
	FROM A
	Right JOIN B
	ON A.Key = B.Key
	WHERE A.Key IS NULL
*/


-- VIEW orders db
SELECT * FROM orders

-- INSERT INTO db
INSERT INTO orders(order_id, customer_id, order_date, sales)
VALUES (1907, 18, NULL, 21);


-- GET SAME RESULT LEFT AND RIGHT JOIN

/*
SELECT *
FROM A
RIGHT JOIN B
ON A.Key = B.Key
WHERE A.Key IS NULL
*/

-- Get all orders without matching customers
SELECT *
FROM MyDatabase.dbo.customers AS c
RIGHT JOIN MyDatabase.dbo.orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL

-- Get all orders without matching customers (Using LEFT JOIN)
/*
SELECT *
FROM B
LEFY JOIN A
ON A.Key = B.Key
WHERE A.Key IS NULL
*/
-- SAME AS ABOVE BY USING LEFT JOIN
USE MyDatabase

SELECT *
FROM orders AS o 
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL


