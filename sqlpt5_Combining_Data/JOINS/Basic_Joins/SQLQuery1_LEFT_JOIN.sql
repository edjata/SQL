-- LEFT JOIN = All rows from left (Primary source of data) & only matching from right (Secondary need additional data)
-- (A:**DATA** ( A:**DATA**:B ) ~~ )
/*
Syntax: INNER JOIN ORDER DOESN'T MATTER
SELECT *
FROM TABLE_A
{LEFT:TYPE} JOIN TABLE_B
ON <condition: A.Key = B.Key >
*/
-- LEFT Primary Table
SELECT *
FROM MyDatabase.dbo.customers

-- Right Secondary Table
SELECT *
FROM MyDatabase.dbo.orders

/*
Get all customers along with their orders,
including those without orders.
*/

SELECT *
FROM MyDatabase.dbo.customers AS Cus
LEFT JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id

-- Get all customers along w/their orders, including those without orders

SELECT 
Cus.id,
Cus.first_name,
O.order_id,
O.sales
FROM MyDatabase.dbo.customers AS Cus
LEFT JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id

-- all customers who placed orders
SELECT 
Cus.id,
Cus.first_name,
O.order_id,
O.sales
FROM MyDatabase.dbo.customers AS Cus
LEFT JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id
WHERE sales IS NOT NULL

-- all customers who did not placed orders
SELECT 
Cus.id,
Cus.first_name,
O.order_id,
O.sales
FROM MyDatabase.dbo.customers AS Cus
LEFT JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id
WHERE sales IS NULL