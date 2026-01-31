-- Basic Joins
/*
JOINING DATA:
	[TABLE A ]			[TABLE B]
	{Col1, col2,...}	{Col1, col2,...}
	{Row 1->}			{Row 1->}
	{Row 2->}			{Row 2->}
	{Row 3->}			{Row 3->}

{COMBINE?} BY (ROWS) or BY (COLUMNS)

(COLUMNS) (JOINS)		-> [TABLE A] [TABLE B] <--SIDE-BY-SIDE-->
{COMBINE?} BY-->

COLUMNS: (JOINS)--> [TYPES]: {Key : Column}
		1.)INNER JOIN	()data()
		2.)FULL JOIN	(data )data( data)
		3.)INNER JOIN	(data)(data) )
		4.)INNER JOIN	( (data)(data)

ROWS: (SET Operators)--> [TYPES]: {Same : Column}
		1.)UNION		(data )data( data)
		2.)UNION ALL	(data) (data)
		3.)EXCEPT		( data )() )
		4.)INTERSECT	( (data)(  )

(ROWS) (SET Operators)	->	[TABLE A] STACKED ON TOP
							[TABLE B] STACKED ON BOTTOM 

**NOTE 1: What is SQL Joins?

QUERY 2 TABLES: 
[TABLE A]		[TABLE B]
[name	|id]	[id |name]
[Maria	|1]	->	[1	|Germany]
[John	|2]	->	[2	|USA]
[Georg	|3]		[4	|Germany]
[Martin	|4]		[5	|USA]

CONNECTED
[COMBINE A & B TABLE]
[1	|Maria	|Germany]
[2	|John	|USA	]
[4	|Martin	|Germany]

**NOTE 2: When to use SQL Joins?
USE CASES =
1.) Recombine Data: (JOIN DATA FROM MULTIPLE TABLES into ONE)
		[table: customers],
		[table: address],
		[table: reviews],
		[table: orders]
	ONE Complete big picture:
	[table: customers|address|reviews|orders]
			- [INNER]
			- [LEFT]
			- [FULL]
2.) Data Enrichment (Getting Extra Data)
	[customers: Master Table]  [Zip Codes: Reference Table]
	join-> [Enhanced customers table | Extra Info column]
			- [LEFT]
3.) Check for Existence "Of Data" -- "Filtering(check data existence)"
	[customers table](Data has to be checked)
	[orders table](look-up table)
	---------
	[customers ]--> NOT ABOUT COMBINING "show customer w/no orders"
			- [INNER]
			- [LEFT] + WHERE
			- [FULL} + WHERE
			- [LEFT ANTI JOIN]
			- [FULL ANTI JOIN]
=====================================================

JOIN TYPES


(TABLE-A::Left Table)		(TABLE-B::Right Table)

(TABLE-A::Left Table)(A & B - MIDDLE OVERLAPs)(TABLE-B::Right Table)
(A ('A'- MATCHING Data -'B') B)
(A - ALL Data - 'B') B)
(A - unmatch Data ( ) B)
*/

-- BASIC
-- 0.) NO JOIN - Two Results
-- (TABLE-A:all rows:Left Table) (TABLE-B:all rows:Right Table)
-- Returns data from tables without combining them

-- Retrieve all data from customers & orders in 2 different results

SELECT *
FROM MyDatabase.dbo.customers

SELECT *
FROM MyDatabase.dbo.orders


-- 2.) INNER Join: Only matching rows from both tables
-- (A ('A'- MATCHING Data -'B') B)
/*
Syntax: INNER JOIN ORDER DOESN'T MATTER
SELECT *
FROM TABLE_A
{INNER:TYPE} JOIN TABLE_B
ON <condition: A.Key = B.Key >
*/

--Get all customers along with their orders, only for customers who placed order
SELECT * 
FROM MyDatabase.dbo.customers
INNER JOIN MyDatabase.dbo.orders
ON id = customer_id

-- HIGHLIGHT TO VIEW SEE WHICH COLUMNS CAN CONNECT->MATCH
SELECT *
FROM MyDatabase.dbo.customers

SELECT *
FROM MyDatabase.dbo.orders

--Get all customers along with their orders, only for customers who placed order
SELECT * 
FROM MyDatabase.dbo.customers
INNER JOIN MyDatabase.dbo.orders
ON customers.id = orders.customer_id

-- Select specific columns
SELECT 
MyDatabase.dbo.customers.id, 
MyDatabase.dbo.customers.first_name,
MyDatabase.dbo.customers.country, 
MyDatabase.dbo.orders.order_date, 
MyDatabase.dbo.orders.order_id
FROM MyDatabase.dbo.customers
INNER JOIN MyDatabase.dbo.orders
ON MyDatabase.dbo.customers.id = MyDatabase.dbo.orders.customer_id

-- Select specific columns
SELECT 
Cus.id, 
Cus.first_name,
Cus.country, 
O.order_date, 
O.order_id
FROM MyDatabase.dbo.customers AS Cus
INNER JOIN MyDatabase.dbo.orders AS O
ON Cus.id = O.customer_id



-- 3.) LEFT JOIN = All rows from left (Primary source of data) & only matching from right (Secondary need additional data)
-- (A TABLE - ALL Data - 'B') B)
/*
Syntax: INNER JOIN ORDER DOESN'T MATTER
SELECT *
FROM TABLE_A
{LEFT:TYPE} JOIN TABLE_B
ON <condition: A.Key = B.Key >
*/
-- LEFT Primary Table
SELECT *
FROM customers

-- Right Secondary Table
SELECT *
FROM orders

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


-- 3.) RIGHT Join
-- (A ('A' - ALL Data - B TABLE)
-- Return All rows from Right & Only matching from left

-- RIGHT Primary Table
SELECT *
FROM MyDatabase.dbo.orders

-- LEFT Secondary Table
SELECT *
FROM MyDatabase.dbo.customers

--Get all customers along w/their orders, including orders without matching customers (RIGHT JOIN)
SELECT 
c.id,c.first_name,c.country,o.order_date,o.order_id
FROM MyDatabase.dbo.customers AS C
RIGHT JOIN MyDatabase.dbo.orders AS O
ON C.id = O.customer_id

--** (POPULATE) Get all customers along w/their orders, including orders without matching customers (LEFT JOIN) SAME RESULTS
SELECT 
c.id,c.first_name,c.country,o.order_date,o.order_id
FROM MyDatabase.dbo.orders AS O 
LEFT JOIN MyDatabase.dbo.customers AS C
ON C.id = O.customer_id


-- 4.) FULL Join: Returns All Rows from Both Tables
--(A)(A & B)(B)
/*
Syntax: FULL JOIN Table ORDER DOESN'T MATTER
	SELECT *
	FROM TABLE_A
	{FULL:TYPE} JOIN TABLE_B
	or it can be
	FROM TABLE_B
	{FULL:TYPE} JOIN TABLE_A
	ON <condition: A.Key = B.Key >
*/


-- Get all customers & all orders, even if there's no match
SELECT 
c.id, c.first_name,
O.order_id, O.sales
FROM MyDatabase.dbo.customers AS c
FULL JOIN MyDatabase.dbo.orders AS O
ON C.id = O.customer_id


SELECT 
c.id, c.first_name,
O.order_id, O.sales
FROM MyDatabase.dbo.orders AS O
FULL JOIN MyDatabase.dbo.customers AS c
ON C.id = O.customer_id

--ADVANCED Join Types
-- 1.) Left anti Join: A table (Only Unmatching rows) B table (nothing) 
-- (A:DATA( B ): A primary Main Source of Data, B Lookup(filter) Not for Data, Just a filter
-- Return Row from Left that has No Match in Right
/*
The Order of table is Important

Syntax:
SELECT *
FROM A
LEFT JOIN B
ON A.Key = B.Key
WHERE B.Key IS NULL
*/

-- Get all customers who haven't placed any order

SELECT *
FROM MyDatabase.dbo.customers AS c
LEFT JOIN MyDatabase.dbo.orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL




-- 3.) Full anti Join (A:DATA (  ) B:DATA)
/*
SELECT *
FROM A
FULL JOIN B
ON A.Key = B.Key
WHERE 
	B.Key IS NULL
	A.Key IS NULL
*/
-- Find customers without orders & orders without customers
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.order_id
WHERE 
	o.order_id IS NULL OR
	c.id IS NULL


-- 3b.) Only Matching ( A ( A & B:DATA ) B)
-- Only Matching -> ( A ( A & B:DATA ) B) <- Only Matching 
-- Only Matching Data from A & B

-- Return Only Rows that Match in both Tables

/* 
Get all customers along their orders,
but only for customers who have placed an order
(Without using INNER JOIN)
*/

SELECT *
FROM customers AS c
LEFT JOIN MyDatabase.dbo.orders AS o
ON c.id = o.customer_id
WHERE o.customer_id > 0

SELECT *
FROM customers AS c
LEFT JOIN MyDatabase.dbo.orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL

-- 4.) Cross Join
/*
The order of table doesn't matter
SELECT *
FROM A
CROSS JOIN B

NOTE: No Condition Needed
*/

SELECT *
FROM MyDatabase.dbo.customers
CROSS JOIN MyDatabase.dbo.orders

