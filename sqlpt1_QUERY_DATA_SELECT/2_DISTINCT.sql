-----------------------------------------------------
-- 6.) [DISTINCT] - Remove Duplicates (Repeated values). Each value appears only once
-----------------------------------------------------
/*
NOTE: [DISTINCT]
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.)  check select statement 
				a.) Select "country" column
		Step3.) DISTINCT-->Removes duplicate values
SYNTAX:
	SELECT DISTINCT
		country
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
	
*/
-----------------------------------------------------

-- unique list of country each country only once
SELECT DISTINCT country
FROM MyDatabase.dbo.customers

-- each country only once country NOT NULL
SELECT DISTINCT country
FROM MyDatabase.dbo.customers
WHERE country IS NOT NULL

--DON'T USE WITH UNIQUE ID --> UNLESS NOT UNIQUE
SELECT DISTINCT id
FROM customers
-- SAME AS ABOVE
SELECT id
FROM customers
