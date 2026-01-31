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

-- change score of customer ID 10 to 0, & country to UK
UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 10

-- HIGHLIGHT to view
SELECT *
FROM customers
WHERE id = 10





