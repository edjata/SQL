

SELECT 
	country,
	SUM(score) AS total_sum
FROM customers
WHERE score > 400
GROUP BY country
HAVING SUM(score) > 800