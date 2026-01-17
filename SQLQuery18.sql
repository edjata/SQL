-- Retrieve all customers & sort result by country & highest score
SELECT *
FROM customers
ORDER BY 
	country ASC,
	score DESC
