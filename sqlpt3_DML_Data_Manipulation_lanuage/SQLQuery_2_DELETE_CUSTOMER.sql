/*
DML - Data Manipulation Language

DELETE Syntax:
DELETE FROM table_name
WHERE <condition>

NOTE: Always use WHERE to avoid DELETING all rows unintentionally
CAUTION: Without a where, all rows will be updated!
*/

-- Delete all customers with an ID greater than 9

DELETE FROM customers
WHERE id > 9

SELECT *
FROM customers

-- Delete all data from table persons: small tables do this way
DELETE FROM persons

-- Big tables do this way delete all data
-- Truncate: Clears the whole table at once without checking or logging
TRUNCATE TABLE persons

SELECT *
FROM persons