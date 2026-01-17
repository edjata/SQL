SELECT 
	country,
	SUM(score) AS total_sum
FROM customers
GROUP BY country
HAVING SUM(score) > 800