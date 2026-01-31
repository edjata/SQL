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
