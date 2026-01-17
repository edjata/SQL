-- Find total score & total number of customers for each country
SELECT 
	country,
	-- Aggregation
	SUM(score) AS total_score,
	COUNT(id) AS total_customers
FROM customers
GROUP BY country
