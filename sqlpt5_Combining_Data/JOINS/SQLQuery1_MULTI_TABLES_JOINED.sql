/*
Multi-Table Join

Table_A: All Rows			[MASTER TABLE]
Table_B: Only Matching		[Secondary TABLE]
Table_C: Only Matching		[Third TABLE]
Table_D: Only Matching		[Third TABLE]

CONNECTIONS:
[Table_A] ( **A:Data**( **A & B:Data** ) ~~ ) [Table_B]
[Table_A] ( **A:Data**( **A & C:Data** ) ~~ ) [Table_C]
[Table_A] ( **A:Data**( **A & D:Data** ) ~~ ) [Table_D]

Syntax:
SELECT *
FROM Table_A
LEFT Table_B ON..
LEFT Table_C ON..
LEFT Table_D ON..
WHERE <CONTROLS WHAT TO KEEP>

1.) Recombine Data

MASTER TABLE WITH LEFT JOIN: MATCHING DATA TABLES
[Customers:Table] ( **Customers:Data** ( **Customers & Address:Data** ) ~~ ) [Address:Table]
[Customers:Table] ( **Customers:Data** ( **Customers & Orders:Data** ) ~~ ) [Orders:Table]
[Customers:Table] ( **Customers:Data** ( **Customers & Reviews:Data** ) ~~ ) [Review:Table]

Complete Big Picture:All customers details in one
[Customers:Table]|[Address:Table]|[Orders:Table]|[Review:Table]

INNER:
[Customers:Table] ( ~~ ( **Customers & Address:Data** ) ~~ ) [Address:Table]
[Customers:Table] ( ~~ ( **Customers & Orders:Data** ) ~~ ) [Orders:Table]
[Customers:Table] ( ~~ ( **Customers & Reviews:Data** ) ~~ ) [Review:Table]

*/

/* My Version 
Using SalesDB, Retrieve a list of all orders, along with
the related customer, product, and employee details
ProductID,
CustomerID,
SalesPersonID

NOTE: ERROR I MADE WAS USING INFORMATION FROM WRONG 
DATABASES. EVEN IF IT WAS STRUCTURED right the data 
was pulled from the wrong databases. 
** Make sure you know where you are suppose to
pull the information from.
*/

USE SalesDB

--	OrderID,first_name,Prouct,sales,Price,FirstName,LastName

SELECT 
	so.OrderID,so.Sales,so.CustomerID,cus.first_name
	Product,pro.Price,emp.FirstName,emp.LastName
FROM SalesDB.Sales.Orders AS so

LEFT JOIN MyDatabase.dbo.orders AS ord
ON so.CustomerID = ord.customer_id 
AND so.OrderID = ord.order_id
AND so.Sales = ord.sales

LEFT JOIN MyDatabase.dbo.customers AS cus
ON so.CustomerID = cus.id
AND so.OrderID = so.OrderID

LEFT JOIN SalesDB.Sales.Products AS pro
ON so.ProductID = pro.ProductID

LEFT JOIN SalesDB.Sales.Employees AS emp
ON so.SalesPersonID = emp.EmployeeID


-- Master Table
SELECT 
	*
FROM SalesDB.Sales.Orders AS so

-- LEFT JOIN TABLES
SELECT id, first_name
FROM MyDatabase.dbo.customers AS cus

SELECT order_id, customer_id, sales
FROM MyDatabase.dbo.orders AS ord

SELECT ProductID, Product, Price
FROM SalesDB.Sales.Products AS pro

SELECT EmployeeID, FirstName, LastName
FROM SalesDB.Sales.Employees AS emp


SELECT 
	OrderID,Sales
FROM SalesDB.Sales.Orders AS so

SELECT *
FROM SalesDB.Sales.OrdersArchive

SELECT *
FROM SalesDB.Sales.Customers

/* Baraa Version 
Using SalesDB, Retrieve a list of all orders, along with
the related customer, product, and employee details
ProductID,
CustomerID,
SalesPersonID
*/

-- [Master Table] that everything will connect to:
-- Master Table Order: Get Data o.[OrderID],o.[Sales]
SELECT * FROM Sales.Orders AS o;

-- [LEFT JOIN Tables]:
-- Connect to table using o.[CustomerID] = c.[CustomerID]: 
-- Get Data c.[FirstName] AS CustomerFirstName,c.[LastName] AS CustomerLastName
SELECT * FROM Sales.Customers AS c;

-- Connect to table using o.[ProductID] = p.[ProductID]: 
-- Get Data p.[Product] AS ProductName, p.[Price]
SELECT * FROM Sales.Products AS p;

-- Connect to table using o.[SalesPersonID] = e.[EmployeeID]: 
-- Get Data e.[FirstName] AS SalePersonFirstName,e.[LastName] AS SalePersonLastName
SELECT * FROM Sales.Employees AS e;

-- 
SELECT * FROM Sales.OrdersArchive;

-----------------------------------------------
USE SalesDB
SELECT 
o.OrderID,
o.Sales,
c.FirstName AS CustomerFirstName,
c.LastName AS CustomerLastName,
p.Product AS ProductName,
p.Price,
e.FirstName AS SalesPersonFirstName,
e.LastName AS SalesPersonLastLast
FROM Sales.Orders AS o
LEFT JOIN sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS P
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID
-----------------------------------------------



