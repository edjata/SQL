-- 1.) Install SQL SERVER
-- 2.) Install SSMS 
-- 3.) Create Database
------------------------------------------------------------
/*
Commonly Used Aggregate Functions:
COUNT()
SUM()
AVG()
MIN()
MAX()

Key Concerpts & Usage:
GROUP BY Clause
HAVING Clause - Filters groups based on aggregate results
NULL Values
DISTINCT Keyword

*/
------------------------------------------------------------
-- ** 1st Connect to right database 
-- ** Can use complete db path to table
------------------------------------------------------------

/* 

[HOW TO QUERY DATABASE]:

||SQL Query||: order-->
	[SELECT]	: Retrieves data from db table, "* columns" or "specific columns"
	[DISTINCT]	: Remove Duplicates
	[TOP]		: Limit data. Restrict the Number of Rows Returned
	[FROM]		:
	[JOIN]		:
	[WHERE]		: Filters data
	[GROUP BY]	: Combines rows with the same value. Aggregates a column BY another Column 
					-- i.e.,[Total score by country]
	[HAVING]	: Filters Data After Aggregated ( used ONLY with GROUP BY)
	[ORDER BY]	: Sort Data (ASC:low->high)(DESC:high->low)
----------------------------------------------------------
----------------------------------------------------------
Execution Order VS Coding Order
----------------------------------------------------------

|Ex.1a|Coding Order||: -->
--------------------------------
SELECT DISTINCT TOP 2 <-- [SELECT]Filter Columns, [DISTINCT]Filter Duplicates,[TOP 2] Filter Result Rows
	Col1,
	SUM(col2)
FROM Table
WHERE Col1 = 10 <-- Filter Rows Before Aggregation
GROUP BY  Col1
HAVING SUM(Col2) > 30 <-- Filter Rows After Aggregation
ORDER BY Col1 ASC

|Ex.1b|Execution Order||: -->
1.) FROM
2.) WHERE
3.) GROUP BY & Aggregation function --> SUM(col2)
4.) HAVING
5.) SELECT DISTINCT
6.) ORDER BY
7.) TOP

*/
------------------------------------------------------------


-----------------------------------------------------
-- 1.) [SELECT] - Choose "*" all Columns
-----------------------------------------------------
/*
NOTE: [SELECT]:
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) SELECT: check select statement 
					* --> SELECT all columns

SYNTAX:
	SELECT * (ALL)
		"Retrieves ALL Columns (EVERYTHING)"
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
*/
-----------------------------------------------------

----------------------------------------------------
USE MyDatabase

-- View all customer table cols & rows data
SELECT *
FROM MyDatabase.dbo.customers 

-- View all order table cols & rows data
SELECT *
FROM MyDatabase.dbo.orders

USE SalesDB
-- Sales db view customers
SELECT *
FROM SalesDB.Sales.Customers

-- Sales db view employees
SELECT *
FROM SalesDB.Sales.Employees

----------------------------------------------------


-----------------------------------------------------
-- 1b.) [SELECT] - Choose Specific Columns_BY_Name 
-----------------------------------------------------
/*
NOTE: SELECT
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) SELECT: check select statement --> SELECT specific Columns_BY_Name 
					COLUMN_NAME_1,
					COLUMN_NAME_2,
					COLUMN_NAME_3

SNYTAX:
	SELECT 
		COLUMN_NAME_1,
		COLUMN_NAME_2,
		COLUMN_NAME_3
	FROM TABLE_NAME

*/
-----------------------------------------------------

USE MyDatabase
-- Select name, country & score from customers table
SELECT 
	first_name,
	country,
	score
FROM MyDatabase.dbo.customers

-- Select customer_id & sales from customers table
SELECT 
	customer_id,
	sales
FROM MyDatabase.dbo.orders

-- from SalesDB
USE SalesDB
SELECT 
	CustomerID,
	OrderDate,
	OrderStatus
FROM SalesDB.Sales.OrdersArchive

-----------------------------------------------------


-----------------------------------------------------
-- 2.) [WHERE] - Filter data <based on a condition>
-----------------------------------------------------
/*
NOTE: [WHERE] - (filters individual rows)
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) WHERE: check WHERE <condition> 
					DOES IT MEET CONDITION? 
						IF NO, FILTER OUT
		Step 3.) SELECT: check select statement --> SELECT all columns and rows or specific columns 

	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) WHERE: check WHERE <condition> 
					DOES IT MEET CONDITION? 
						IF NO, FILTER OUT
		Step 3.) SELECT: check select statement 
					--> SELEC specific columns 
						name,
						country

** Filter data based on a condition

SNYTAX:
	SELECT *
	FROM TABLE_NAME
	WHERE <condition>
*/
-----------------------------------------------------


-----------------------------------------------------
-- condition score greater than 550
SELECT *
FROM MyDatabase.dbo.customers
WHERE score > 550

-- condition score greater than 550, select name & score
SELECT 
	first_name,
	score
FROM MyDatabase.dbo.customers
WHERE score > 550

-- Retrieve customers with a score not equal to 0
SELECT *
FROM MyDatabase.dbo.customers
WHERE score != 0 

SELECT *
FROM MyDatabase.dbo.customers
WHERE score > 0

-- Retrieve customers from Germany
SELECT *
FROM MyDatabase.dbo.customers
WHERE country = 'Germany'

SELECT 
	first_name,
	country
FROM MyDatabase.dbo.customers
WHERE country = 'Germany'

-----------------------------------------------------


-----------------------------------------------------
-- 3.) [ORDER BY] - Sort Data (ASC:low->high)(DESC:high->low)
-----------------------------------------------------
/*
NOTE: [ORDER BY]
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) ORDER BY: column_name ASC, (DEFAULT) or DESC
		Step 3.) SELECT: check select statement --> SELECT all columns and rows 

SYNTAX:
	SELECT * (ALL)
		"Retrieves ALL Columns (EVERYTHING)"
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
	ORDER BY column_name ASC & default or DESC 
*/
-----------------------------------------------------


-----------------------------------------------------
SELECT *
FROM MyDatabase.dbo.customers
ORDER BY first_name ASC

SELECT *
FROM MyDatabase.dbo.customers
ORDER BY first_name DESC

-- sort score by low to high
SELECT *
FROM MyDatabase.dbo.customers
ORDER BY score ASC

-- sort score by high to low
SELECT *
FROM MyDatabase.dbo.customers
ORDER BY score DESC

-----------------------------------------------------
-- 3b.) (Nested)[ORDER BY] - Sort Data by multiple columns (ASC:low->high)(DESC:high->low)
-----------------------------------------------------
/*
NOTE: (Nested)[ORDER BY]
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) ORDER BY: 
				1st. column_name1 ASC or DESC,
					country ASC
				2nd. column_name2 ASC or DESC
					score DESC
		Step 3.) SELECT: check select statement --> SELECT all columns and rows 

SYNTAX:
	SELECT * (ALL)
		"Retrieves ALL Columns (EVERYTHING)"
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
	ORDER BY MULTIPLE COLUMNS
		column_name1 ASC & default or DESC,
			country ASC
		column_name2 ASC & default or DESC 
			score DESC
*/
-----------------------------------------------------


-----------------------------------------------------
/*
Retrieve all customers & sort the results by the country &
then by the highest score.
*/
SELECT *
FROM MyDatabase.dbo.customers
WHERE country IS NOT NULL
ORDER BY 
	country ASC,
	score DESC

--
SELECT 
	first_name,
	score,
	country
FROM MyDatabase.dbo.customers
WHERE 
	country IS NOT NULL AND 
	score IS NOT NULL AND score != 0
ORDER BY 
	country ASC,
	score ASC


/*
Retrieve all customers & sort the results by the highest score.
& then by the country
*/
SELECT *
FROM MyDatabase.dbo.customers
WHERE country IS NOT NULL
ORDER BY 
	score DESC,
	country ASC

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
-----------------------------------------------------
-- 5.) [HAVING] - Filters Data "After Aggregation"
				-- can be used only with GROUP BY 
-----------------------------------------------------
/*
NOTE: [HAVING]
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) GROUP BY: column_name ASC or DESC
				a.) country - (group all of same value)
				b.) sum - total for each group
		Step 3.) HAVING: SUM(score) > 800
		Step 4.) SELECT: check select statement 
				a.) country
				b.) sum

	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) WHERE score > 400 <-- Before Aggregation
		Step 3.) GROUP BY: column_name ASC or DESC
				a.) country - (group all of same value)
				b.) sum - Aggregation total for each group
		Step 4.) HAVING: SUM(score) > 800 <-- After Aggregation
		Step 5.) SELECT: check select statement 
				a.) country
				b.) sum

SYNTAX:
	SELECT 
		country,<-- category
		SUM(score),<--Aggregation
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
	GROUP BY country
	HAVING <condition> SUM(score) > 800
		"After Aggregation"

SYNTAX:
	SELECT 
		country,<-- category
		SUM(score),<--Aggregation
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
	WHERE score > 400 <-- Filter "Before Aggregation"
	GROUP BY country
	HAVING <condition> SUM(score) > 800
		"After Aggregation"

*/
-----------------------------------------------------

-- Filters Data After Aggregated
USE MyDatabase
SELECT 
	country,
	SUM(score)
FROM customers
GROUP BY country 
HAVING SUM(score) > 800

-----------------------------------------------------
-- 5b.) [HAVING] - Filters Data Before & After Aggregation
-----------------------------------------------------
/*
NOTE: [HAVING]
	Execution order:
		Step 1.) FROM: Retrieve all data FROM database TABLE_NAME
		Step 2.) WHERE score > 400 <-- Before Aggregation
		Step 3.) GROUP BY column_name ASC or DESC
		Step 3.) HAVING SUM(score) > 800 <-- After Aggregation
		Step 4.) check select statement 
				a.) country
				b.) sum
SYNTAX:
	SELECT 
		country,<-- category
		SUM(score),<--Aggregattion
	FROM TABLE_NAME
		"Tells SQL Where to find your Data"
	WHERE score > 400
		"Before Aggregation"
	GROUP BY country
	HAVING <condition> SUM(score) > 800
		"After Aggregation"
*/
-----------------------------------------------------

USE MyDatabase
SELECT 
	country,
	SUM(score)
FROM customers
WHERE score > 400
GROUP BY country
HAVING SUM(score) > 800

/*
Find the avarage score for each country
considering only customers with a score not equal to 0
*/
USE MyDatabase
SELECT 
	country,
	AVG(score)
FROM customers
WHERE score != 0 AND country IS NOT NULL
GROUP BY country

/*
Find the avarage score for each country
considering only customers with a score not equal to 0
And return only those countries with an average score 
greater than 430
*/

SELECT 
	country,
	AVG(score) AS Averager
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430

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


/*
----------------------------------------------------------
Execution Order VS Coding Order
----------------------------------------------------------

|Ex.1a|Coding Order||: -->
--------------------------------
SELECT DISTINCT TOP 2 <-- [SELECT]Filter Columns, [DISTINCT]Filter Duplicates,[TOP 2] Filter Result Rows
	Col1,
	SUM(col2)
FROM Table
WHERE Col1 = 10 <-- Filter Rows Before Aggregation
GROUP BY  Col1
HAVING SUM(Col2) > 30 <-- Filter Rows After Aggregation
ORDER BY Col1 ASC

|Ex.1b|Execution Order||: -->
1.) FROM
2.) WHERE
3.) GROUP BY & Aggregation function --> SUM(col2)
4.) HAVING
5.) SELECT DISTINCT
6.) ORDER BY
7.) TOP

*/

----------------------------------------------------------
-- Multi-Queries: Cool Techniques
----------------------------------------------------------

-- 2 queries
USE MyDatabase

SELECT *
FROM customers;

SELECT *
FROM orders;

-- Static (Fixed) Values from user
SELECT 123 AS static_number

SELECT 'HELLO' AS static_string

-- Data from DB & Static (Fixed) Values from user not stored
USE MyDatabase
SELECT 
id,
first_name,
'New Customer' AS Customer_Type
FROM customers

-- Highlight & Execute
SELECT *
FROM customers
-- Don't Highlight
WHERE country = 'Germany'

-- Highlight & Execute
SELECT *
FROM orders























