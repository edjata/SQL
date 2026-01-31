-- NOTE: Membership Operators Section (IN, NOT IN)
-- Check if a value is within a range

-- Retrieve all customers (IN LIST) from either Germany OR USA

SELECT *
FROM MyDatabase.dbo.customers
WHERE country IN ('Germany', 'USA')

SELECT *
FROM MyDatabase.dbo.customers
WHERE country = 'GERMANY' OR country = 'USA'

-- Retrieve all customers (NOT IN LIST) UK
SELECT *
FROM MyDatabase.dbo.customers
WHERE NOT country = 'UK'

SELECT *
FROM MyDatabase.dbo.customers
WHERE NOT country IN ('UK')
