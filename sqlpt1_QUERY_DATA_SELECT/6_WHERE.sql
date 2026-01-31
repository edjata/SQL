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

