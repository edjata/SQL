-- Retrieve the top 3 customers with highest Score
SELECT TOP 3 *
FROM customers
ORDER BY (score) DESC