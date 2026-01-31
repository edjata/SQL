-- NOTE: Logical Operators Section (AND, OR, NOT)


-- AND Operator: All conditions must be TRUE
-- [condition_1 -->TRUE] AND [condition_2 -->TRUE] --> return value
-- Retrieve all customer from USA AND have score greater than 500
SELECT *
FROM MyDatabase.dbo.customers
WHERE 
country = 'USA'
AND
score > 500

-- OR Operator: At least one conditions must be true
-- [condition_1 -->TRUE]	OR [condition_2 -->TRUE] --> return value
-- [condition_1 -->FALSE]	OR [condition_2 -->TRUE] --> return value
-- [condition_1 -->TRUE]	OR [condition_2 -->FALSE] --> return value
-- Retrieve customer from USA OR score greater than 500

SELECT *
FROM MyDatabase.dbo.customers
WHERE 
country = 'USA'
OR
score > 500

-- NOT Operator: (Reverse) Excludes matching values
-- (NOT [condition --> TRUE]) --> remove value = condition
-- (NOT [country='USA' --> TRUE]) --> remove value = 'USA'
-- Retrieve customer [NOT from USA]

SELECT *
FROM MyDatabase.dbo.customers
WHERE 
NOT country = 'USA'

-- Retrieve all customers with a score not less than 500
SELECT
*
FROM MyDatabase.dbo.customers
WHERE score !< 500

-- or
SELECT
*
FROM MyDatabase.dbo.customers
WHERE NOT score < 500

-- or
SELECT *
FROM customers 
WHERE score >= 500

