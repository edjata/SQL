/*
UPDATE - change content of already existing rows
Syntax: 
	UPDATE table_name
	SET column1 = new_value,
		column2 = new_value2
	WHERE <condition>

NOTE: * Always use WHERE to avoid UPDATING all rows unintentionally
CAUTION: Without a WHERE, ALL ROWS will be updated!!
*/

-- change score of customer ID 6 to 750 and name to Sara
UPDATE customers
SET first_name = 'Sara',
	score = 750
WHERE id = 6

-- change score of customer ID 6 to 0 and name to Jimmy
UPDATE customers
SET first_name = 'Jimmy',
	score = 0
WHERE id = 6

SELECT *
FROM customers
WHERE id = 6

/*
change the score of customer 10 to 0
and update the country to UK
*/
UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 10

SELECT *
FROM customers


/*
Update all customers with a NULL score by 
setting their score to 0
*/

UPDATE customers
SET score = 0
WHERE score IS NULL

SELECT *
FROM customers


UPDATE customers
SET country = 'USA'
WHERE country IS NULL

SELECT *
FROM customers


