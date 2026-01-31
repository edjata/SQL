-----------------------------------------------------
-- 7.) [TOP] - Limit data. Restrict the Number of Rows Returned
-----------------------------------------------------
/*
NOTE: [TOP]
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.)  check select statement 
				a.) Select columns
		Step3.) TOP-->only first 3 rows & all columns
SYNTAX:
	SELECT TOP 3
		*
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
	
*/
-----------------------------------------------------

-- returns top 3 customers
SELECT TOP 3
*
FROM MyDatabase.dbo.customers

use MyDatabase
select * from customers where score > 0

-- returns top 3 customers with highest score
SELECT TOP 3 *
FROM MyDatabase.dbo.customers
ORDER BY score DESC

-- returns top 6 customers with lowest score
SELECT TOP 6 *
FROM MyDatabase.dbo.customers
ORDER BY score ASC

-- get the two most recent orders
USE MyDatabase

SELECT TOP 2 * 
FROM orders
ORDER BY order_date DESC
