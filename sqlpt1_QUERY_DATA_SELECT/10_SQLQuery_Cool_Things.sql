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
