-- SET Operators
/*
** HOW TO COMBINE THE ROWS FROM MULTIPLE TABLES

*************
[TYPES]:
*************
	[UNION]: (**A:DATA**(**A:DATA:B**)**B:DATA**)
		: Combines ALL ROWS
		: Removes duplicate rows
		: ["ORDER DOES NOT MATTER"]
					
	[UNION ALL]: (**A:DATA**) (**B:DATA**)	
		: ALL ROWS
		: Find duplicates			
		: ["ORDER MATTER"]
					
	[EXCEPT]: (**DATA**(~~)~~)			
		: Shows all data that's NOT in second table
		: Returns all distinct data	
		: ["ORDER MATTER"]
					
	[INTERSECT]: (~~ (**DATA**)~~)		
		: Return common rows between two queries		
		: ["ORDER DOES NOT MATTER"] 				
*************
[RULES]:
*************
	1.) Same number of columns, Data Types, order of columns
	2.) The 1st Query controls column name
*************
[USE CASES]:
*************
1.) Combine simmuliar Information into 1 table [UNION & UNION ALL]
2.) Delta Detection [EXCEPT] compare results "FIND DIFFERENCES" on what's new
3.) Data Completeness check [EXCEPT] 
*************

---------------------------------
---------------------------------
[Syntax]: [QUERY]
---------------------------------
---------------------------------
[Query]: <-- "1st SELECT Statement"
SELECT 
	FirstName
	LastName
FROM Customers
---------------------------------
UNION <-- SET Operator [Put between SELECT Statements]
UNION
UNION ALL
INTERSECT
---------------------------------
[Query]: <-- "2nd SELECT Statement"
SELECT 
	FirstName
	LastName
FROM Employees
---------------------------------
---------------------------------
[Rules]:
---------------------------------
---------------------------------
*********************************
*********************************
RULES OF SET OPERATORS:
#1 RULE | ORDER BY can be used only once
#2 RULE | Same Number of Columns
#3 RULE | Matching Data Types
#4 RULE | Same Order of Columns
#5 RULE | First Query Controls Aliases
#6 RULE | Mapping Correct Columns
*********************************
*********************************

*********************************
#1 RULE | SQL CLAUSES
- SET Operator can be used almost in all clauses
	[WHERE] | [JOIN] | [GROUP BY] | [HAVING]
- ORDER BY is allowed only once at the end of query
---------------------------------
---------------------------------

*********************************
EXAMPLE 1:
---------------------------------
---------------------------------
Query: <-- "1st SELECT Statement"
SELECT 
	FirstName
	LastName
FROM Customers

WHERE Clause
JOIN Clause
GROUP BY Clause
HAVING Clause
---------------------------------
UNION <-- SET Operator [Put between SELECT Statements]
---------------------------------
Query: <-- "2nd SELECT Statement"
SELECT 
	FirstName
	LastName
FROM Employees

WHERE Clause
JOIN Clause
GROUP BY Clause
HAVING Clause

ORDER BY FirstName <-- "** MUST BE AT END OF QUERY **"
---------------------------------
---------------------------------

*********************************
#2 RULE | NUMBER OF COLUMNS
- The number of columns in each query must be the same
---------------------------------
---------------------------------

*********************************
#3 RULE | DATA TYPES
- Data type of columns in each query must be compatible
---------------------------------
---------------------------------

*********************************
#4 RULE | ORDER OF COLUMNS
- The order of the columns in each query must be the same
---------------------------------
---------------------------------

*********************************
#5 RULE | COLUMNS ALIASES
- The column names in the result set are determined by the column names specified in the first query
	** First column is responsible for naming columns
---------------------------------
---------------------------------

*********************************
#6 RULE | MAPPING CORRECT COLUMNS
- Even if all rules are met & SQL shows no errors, the result may be incorrect
- Incorrect column selection leads to inaccurate results
---------------------------------
---------------------------------

*********************************
SET OPERATOR:
*********************************
-----------------------------------------------------
[UNION ALL] VS. [UNION]

- UNION ALL is generally faster than UNION
- If you're confident there are no duplcates, use UNION ALL
- Use UNION ALL to find duplicates & quality issues

-----------------------------------------------------
[UNION] - ( **A:DATA** ( **A:DATA:B** ) **B:DATA** )
*********************************
- Returns all district rows from both queries
- Removes duplicate rows from the result.

*********************************
*********************************
[UNION]: Return All distinct rows from both tables
*********************************
( Jossef, Mark, Anna ( Kevin, Mary ) Carol, Frank, Michael )
*********************************
( **A:DATA** ( **A:DATA:B** ) **B:DATA** )
Table_A: customers
	Jossef, Mark, Anna, [Kevin, Mary]
Table_B: Employees
	[Kevin, Mary], Carol, Frank, Michael

-----------------------------------------------------
[UNION ALL] - ( **A:DATA** ) ( **B:DATA** )
- Returns all rows from both queries, including duplicates

*********************************
*********************************
[UNION ALL]: Return All rows, including duplicates
*********************************
( Jossef, Mark, Anna, Kevin, Mary ) ( Kevin, Mary, Carol, Frank, Michael )
*********************************
( **A:DATA** ) ( **B:DATA** )
Table_A: customers
	Jossef, Mark, Anna, [Kevin, Mary]
Table_B: Employees
	[Kevin, Mary], Carol, Frank, Michael

-----------------------------------------------------
[EXCEPT]: (MINUS) "ORDER MATTERS"
- Returns all distinct rows from the first query
  that  are not found in the second query.
- It is the only one where the order of queries
  affects the final result. 
  - The order of queries in a EXCEPT does affect the result!!

*********************************
( **DATA** ( ~~ ) ~~ )
*********************************
( **DATA** ( ~~ ) ~~ )
Table_A: customers
	[Jossef], [Mark], [Anna], Kevin, Mary
Table_B: Employees
	Kevin, Mary, Carol, Frank, Michael

-----------------------------------------------------
[INTERSECT]: "ORDER DOES NOT MATTER"
- Return common rows between two queries
- Returns only the rows that are common in both queries
*********************************
( ~~ ( **DATA** ) ~~ )
*********************************
( ~~ ( **DATA** ) ~~ )
Table_A: customers
	Jossef, Mark, Anna, [Kevin], [Mary]
Table_B: Employees
	[Kevin], [Mary], Carol, Frank, Michael
*********************************


-----------------------------------------------------
*********************************
SET OPERATOR
*********************************
[COMBINE INFORMATION]: ["UNION"] USE CASES
*********************************
*********************************
1.) Combine similar information before analyzing the data

TABLES: If anything changed in any query report error
	[Employees]	-->[SQL QUERY]	|
	[Customers]	-->[SQL QUERY]	| -->[REPORTING]
	[Suppliers]	-->[SQL QUERY]	|
	[Students]	-->[SQL QUERY]	|

TABLES: Best to use UNION ( **DATA** (**DATA**) **DATA)
	- Combine ALL tables into single [PERSON] Table
	[Employees]	-->[PERSON]	|
	[Customers]	-->			| -->[SQL QUERY]-->[REPORTING]
	[Suppliers]	-->			|
	[Students]	-->			|

NOTE: Database developers divide the data into multiple 
	tables to optimize performance & archive old data

TABLES: Best to use UNION ( **DATA** (**DATA**) **DATA)
	- Combine ALL tables into single [Orders] Table
	[Order 2025]	-->[Orders]	|
	[Order 2024]	-->			| -->[SQL QUERY]-->[REPORTING]
	[Order 2023]	-->			|
	[Order 2022]	-->			|
*************************************************************
UNION
-- BEST PRACTICES 
-- NEVER use an asterisk(*) to combine tables; list needed columns instead

-- RIGHT CLICK [TABLE: Sales.Orders] --> [SELECT] SELECT TOP 1000 rows
-- Copy column names

-- SOURCE FLAG: [NEW COLUMN]
-- Include additional column to indicate the source of each row
-- 'Orders' AS SourceTable & 'OrdersArchive' AS SourceTable

*********************************
[COMBINE INFORMATION]: ["EXCEPT"] USE CASES
*********************************
*********************************
"DELTA DETECTION"
- Identifying the differences or changes (delta) between two batches of data.
EXAMPLE:
				Build-->[(pipeline)] Load daily new data
[{Source System}] ===================================>[{DATA Warehouse}]
		FROM:SourceSystem -->[(pipeline)]--> TO:DATA Warehouse or Data Lake

[DAY 1]																		[DATA Warehouse]
[customer_id | name		| email				| order_Date]					[customer_id | name		| email				| order_Date]
[1			 | John Doe	| john@gmail.com	| 2024-09-17]					[1			 | John Doe	| john@gmail.com	| 2024-09-17]
[2			 | Jan Doe	| jan@outlook.com	| 2024-09-18]					[2			 | Jan Doe	| jan@outlook.com	| 2024-09-18]
--------------------------------------------------EXCEPT (**DATA**(~~)~~)	[3			 | Alice	| Al@outlook.com	| 2024-09-19]
[DAY 2]																		
[customer_id | name | email | order_Date]
[1			 | John Doe	| john@gmail.com	| 2024-09-17]
[3			 | Alice	| Al@outlook.com	| 2024-09-19]					

*********************************
[COMBINE INFORMATION]: ["EXCEPT"] USE CASES
*********************************
*********************************
"DATA COMPLETENESS CHECK"
EXCEPT operator can be used to compare tables to detect discrepancies between databases.


[{DATABASE A}]						[{BATABASE B}]
[TABLE 1]			-->				[TABLE 2]

[TABLE 1]	"EXCEPT":MINUS (**DATA**(~~)~~) [TABLE 2]-->[EMPTY RESULTS]

[{BATABASE B}]						[{DATABASE A}]
[TABLE 2]			-->				[TABLE 1]

[TABLE 2]	"EXCEPT":MINUS (**DATA**(~~)~~) [TABLE 1]-->[EMPTY RESULTS]

*********************************
[SET OPERATORS]: SUMMARY
*********************************
*********************************
Combine the results of multiple queries into a single result set

[TYPES]:
*************
	[UNION]: (**A:DATA**(**A:DATA:B**)**B:DATA**)
		: Combines ALL ROWS
		: Removes duplicate rows
		: ["ORDER DOES NOT MATTER"]
					
	[UNION ALL]: (**A:DATA**) (**B:DATA**)		
		: Find duplicates			
		: ["ORDER MATTER"]
					
	[EXCEPT]: (**DATA**(~~)~~)			
		: Shows all data that's NOT in second table
		: Returns all distinct data	
		: ["ORDER MATTER"]
					
	[INTERSECT]: (~~ (**DATA**)~~)		
		: Return common rows between two queries		
		: ["ORDER DOES NOT MATTER"] 				
*************
[RULES]:
*************
	1.) Same number of columns, Data Types, order of columns
	2.) The 1st Query controls column name
*************
[USE CASES]:
*************
1.) Combine simmuliar Information into 1 table [UNION & UNION ALL]
2.) Delta Detection [EXCEPT] compare results "FIND DIFFERENCES" on what's new
3.) Data Completeness check [EXCEPT] 


*/

-- UNION *********************************
USE SalesDB
SELECT 
	CustomerID AS IDs,
	FirstName AS First_Name,
	LastName AS Last_Name,
	'Customer' AS SalesDBType
FROM Sales.Customers

UNION

SELECT 
	EmployeeID,
	FirstName,
	LastName,
	'Employee' AS SalesDBType
FROM Sales.Employees


--Combine the data from employees & customers into one table
-- [UNION] OPERATOR
USE SalesDB

SELECT 
	FirstName,
	LastName
FROM Sales.Customers
UNION
SELECT 
	FirstName,
	LastName
FROM Sales.Employees
------------------

SELECT 
	FirstName,
	LastName
FROM Sales.Employees 
UNION
SELECT 
	FirstName,
	LastName
FROM Sales.Customers

-- UNION ALL *********************************
-- [UNION ALL] OPERATOR
USE SalesDB

SELECT 
	FirstName,
	LastName
FROM Sales.Customers
UNION ALL
SELECT 
	FirstName,
	LastName
FROM Sales.Employees

/* 
Combine the data from employees & customers into one 
table, including duplicates.
*/
USE SalesDB
SELECT 
	FirstName, 
	LastName
FROM Sales.Customers
UNION ALL
SELECT 
	FirstName, 
	LastName
FROM Sales.Employees

-- EXCEPT *********************************
-- Find the employees who are not customers at the same time
USE SalesDB
SELECT 
	FirstName,
	LastName
FROM Sales.Employees 
EXCEPT
SELECT 
	FirstName,
	LastName
FROM Sales.Customers

-- Find the customers who are not employees at the same time
USE SalesDB
SELECT 
	FirstName,
	LastName
FROM Sales.Customers  
EXCEPT
SELECT 
	FirstName,
	LastName
FROM Sales.Employees

-- INTERSECT *********************************
-- Find employees who are also customers
USE SalesDB
SELECT
	FirstName,
	LastName
FROM Sales.Employees
INTERSECT
SELECT 
	FirstName,
	LastName
FROM Sales.Customers

-- *********************************
-- [COMBINE INFORMATION]: UNION USE CASES
-- *********************************
/*
Orders data are stored in separte tables 
(Orders & OrdersArchive).
Combine all orders data into one report 
without duplicates
*/
USE SalesDB
SELECT *
FROM Sales.Orders
UNION
SELECT *
FROM Sales.OrdersArchive

-- BEST PRACTICES 
-- NEVER use an asterisk(*) to combine tables; list needed columns instead
USE SalesDB
SELECT 
	OrderID,
	ProductID,
	CustomerID,
	SalesPersonID,
	OrderDate,
	ShipDate,
	OrderStatus,
	ShipAddress,
	BillAddress, 
	Quantity,
	Sales,
	CreationTime
FROM Sales.Orders
UNION
SELECT 
	OrderID,
	ProductID,
	CustomerID,
	SalesPersonID,
	OrderDate,
	ShipDate,
	OrderStatus,
	ShipAddress,
	BillAddress, 
	Quantity,
	Sales,
	CreationTime
FROM Sales.OrdersArchive
--------------------------------
-- RIGHT CLICK [TABLE: Sales.Orders] --> [SELECT] SELECT TOP 1000 rows
-- Copy column names
USE SalesDB
SELECT 
	[OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
    ,[OrderStatus]
    ,[ShipAddress]
    ,[BillAddress]
    ,[Quantity]
    ,[Sales]
    ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
	[OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
    ,[OrderStatus]
    ,[ShipAddress]
    ,[BillAddress]
    ,[Quantity]
    ,[Sales]
    ,[CreationTime]
FROM Sales.OrdersArchive

------------------------------------------------
-- SOURCE FLAG: [NEW COLUMN]
-- Include additional column to indicate the source of each row
-- 'Orders' AS SourceTable & 'OrdersArchive' AS SourceTable

USE SalesDB
SELECT 
'Orders' AS SourceTable,
	[OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
    ,[OrderStatus]
    ,[ShipAddress]
    ,[BillAddress]
    ,[Quantity]
    ,[Sales]
    ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
'OrdersArchive' AS SourceTable,
	[OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
    ,[OrderStatus]
    ,[ShipAddress]
    ,[BillAddress]
    ,[Quantity]
    ,[Sales]
    ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID




