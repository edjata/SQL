-- Find total score for each country & first name

SELECT country, SUM(score) AS total_score
FROM customers
GROUP BY country, first_name