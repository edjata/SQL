-----------------------------------------------------
-- 4.) [GROUP BY] - Aggregates Data
-----------------------------------------------------
-- Combines rows with the same value. 
-- Aggregates a column BY another Column 
-- [Total score by country]
-----------------------------------------------------
/*
NOTE: [GROUP BY]
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) GROUP BY: column_name ASC or DESC
				a.) country <-- (Combine so only 1), EACH ONLY ONCE
		Step 3.) SELECT: check select statement 
				a.) country
				b.) SUM()<-- sum all combined
SYNTAX:
	SELECT 
		country, <-- category to "GROUP BY"
		SUM(score), <--Aggregation SUM(), AVG(),...
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
	GROUP BY country <-- EACH ONLY ONCE
*/
-----------------------------------------------------


-----------------------------------------------------
-- Sum all values by country
SELECT
	country AS customer_country,
	SUM(score) AS total_score
FROM MyDatabase.dbo.customers
WHERE country IS NOT NULL
GROUP BY country

-- see 2 columns country & name
SELECT
	country AS customer_country,
	SUM(score) AS total_score
FROM MyDatabase.dbo.customers
WHERE country IS NOT NULL AND score != 0
GROUP BY country

-- (2 aggregations) total score & total number of customers for each "GROUP BY" country
USE MyDatabase
SELECT 
	country AS Customer_Country,
	SUM(score) AS Total_Score,
	COUNT(first_name) AS Total_Customers
FROM customers
WHERE country IS NOT NULL 
GROUP BY country 

-- GROUP BY country, total score by country & count customers
USE MyDatabase
SELECT 
	country,
	SUM(score) AS total_score,
	COUNT(id) 
FROM customers
GROUP BY country

-- GROUP BY 2 columns, name and country
USE MyDatabase
SELECT
	country AS Country,
	first_name AS Name,
	SUM(score) AS Total_Score
FROM customers
WHERE country IS NOT NULL AND score != 0 
GROUP BY country, first_name
