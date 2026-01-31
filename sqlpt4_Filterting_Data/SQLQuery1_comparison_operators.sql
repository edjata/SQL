-- Retrieve all customers who are not from Germany: (not equal) Column1 != Column2	
/*
Compare two things: 
	condition-->[expression][operator][expression]
	[column_1][=][column_2]			--> [first_name][=][last_name]
	[column_1][=][value]			--> [first_name][=]['John']
	[function][=][value]			--> [UPPER(first_name)][=]['JOHN']
	[expression][=][value]			--> [Price*Quantity][=][1000]
	[subquery'advanced'][=][value]	--> [SELECT AVG(sales) FROM orders][=][1000]

*/

-- WHERE condition country = 'USA'
SELECT *
FROM customers
WHERE country = 'USA'

-- Retrieve all customers from Germany
SELECT *
FROM MyDatabase.dbo.customers
WHERE country = 'Germany'

-- Retrieve all customers NOT equal to Germany
SELECT *
FROM MyDatabase.dbo.customers
WHERE country != 'Germany'

SELECT *
FROM MyDatabase.dbo.customers
WHERE country <> 'Germany'

-- Retrieve all customers with score greater than 500: (>) Column1 > Column2	
SELECT *
FROM MyDatabase.dbo.customers
WHERE score > 500

-- Retrieve all customers with score 500 or more: (>=) Column1 >= Column2	
SELECT *
FROM MyDatabase.dbo.customers
WHERE score >= 500

-- Retrieve all customers with score less than 500: (<) Column1 < Column2	
SELECT *
FROM MyDatabase.dbo.customers
WHERE score < 500

-- Retrieve all customers with score 500 or less: (<=) Column1 <= Column2	
SELECT *
FROM MyDatabase.dbo.customers
WHERE score <= 500
