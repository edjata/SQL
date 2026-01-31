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

-- UPDATE all customers with a NULL score by seetting score to 0
UPDATE customers
SET score = 0
WHERE score IS NULL

-- HIGHLIGHT to view
SELECT *
FROM customers
WHERE score = 0

