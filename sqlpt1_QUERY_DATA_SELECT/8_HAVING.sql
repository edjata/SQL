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
