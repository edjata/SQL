-- How to choose between JOIN TYPES

/* 

----------------------------------------------------
----------------------------------------------------
***************************************************************
***************************************************************
* [NOTE]: [JOIN TABLES]
***************************************************************
***************************************************************
----------------------------------------------------
----------------------------------------------------
How to combine 2 tables, 'A' and 'B'?:

  (LEFT TABLE)[TABLE_A]		[TABLE_B](RIGHT TABLE)
***************************************************************
					(Combine?)

What do you want to combine?
***************************************************************

	['ROWS']-->(SET Operator) 
			or 
	['COLUMNS'] --> (JOINs)

***************************************************************

['COLUMNS'] --> (JOINs)	[TABLE_A COLS & ROWS|TABLE_B COLS & ROWS]
						[COL1| COL2| COL3	|COL1| COL2| COL3	]
						[COL1| COL2| COL3	|COL1| COL2| COL3	]
						[COL1| COL2| COL3	|COL1| COL2| COL3	]
TYPES:
	INNER JOIN		(~~(DATA)~~)
	FULL JOIN		(DATA(DATA)DATA)
	LEFT JOIN		(DATA(DATA)~~)
	RIGHT JOIN		(~~(DATA)DATA)

** {KEY COLUMNS} BETWEEN TWO TABLES TO COMBINE
***************************************************************

['ROWS'] -->(SET Operator)
						[TABLE_A COLS & ROWS]
						[COL1| COL2| COL3]
						[COL1| COL2| COL3]
						[COL1| COL2| COL3]
						[TABLE_B COLS & ROWS]
						[COL1| COL2| COL3]
						[COL1| COL2| COL3]
						[COL1| COL2| COL3]
TYPES:
	UNION 			(DATA(DATA)DATA)
	UNION ALL		(DATA) (DATA)
	EXCEPT 			(DATA(DATA)~~)
	INTERSECT		(~~(DATA)~~)

** {SAME NUMBER OF COLUMNS} 
----------------------------------------------------
----------------------------------------------------

* NOTE: HOW TO COMBINE TABLES USING SQL JOINS

----------------------------------------------------
----------------------------------------------------
WHAT IS SQL JOINS?
***************************************************************

{QUERY TABLES} --> Connect them using MATCHING {KEY}

Connected with CUSTOMER [id]{KEY}
-----------------------------
[TABLE A:LEFT]	[TABLE B:RIGHT]
[first_name	|id][id|country	]
-----------------------------
[Maria		|1 ][1 |Germany	]
[John		|2 ][2 |USA		]
[Georg		|3 ][4 |Germany	]
[Martin		|4 ][5 |USA		]
-----------------------------

Combined 
-----------------------------
[id][first_name][country]
-----------------------------
[1][Maria	][Germany	]
[2][John	][USA		]
[4][Martin	][Germany	]
-----------------------------

----------------------------------------------------
----------------------------------------------------

* NOTE: WHEN TO USE SQL JOINS

----------------------------------------------------
----------------------------------------------------
Why we need joins?

[1] Recombine Data:
		'Customer Data' FOUND:
			* IN MULTIPLE TABLES
				Table 1.) [customers]	{id}
				Table 2.) [addresses]	{customers_id}
				Table 3.) [orders]		{customers_id}
				Table 4.) [reviews]		{customers_id}
		
		'SEE COMPLETE BIG PICTURE ABOUT CUSTOMER DATA':
			
			COMBINED RESULTS: All customer details in one table
				[customers] [addresses] [orders] [reviews]
				
				CONNECT USING SQL JOINS:
					[customers]--(DATA(DATA)~~)--[addresses] 
					[customers]--(DATA(DATA)~~)--[orders]  
					[customers]--(DATA(DATA)~~)--[reviews]

USE CASES: used to re-combine Data
	A.) INNER JOIN
	B.) LEFT JOIN
	C.) FULL JOIN
***************************************************************
[2] Data Enrichment "Getting Extra Data":

	QUERYING CUSTOMER TABLE:
		[CUSTOMERS TABLE] <-- MASTER TABLE

	GET EXTRA DATA FROM ZIP CODE TABLE:
		[ZIP CODES TABLE] <-- REFERENCE TABLE

	* ADD ZIP CODES TO CUSTOMER TABLE
		JOIN TABLES
			[CUSTOMERS TABLE]--(DATA(DATA)~~)--[ZIP CODES TABLE]

	* Enhanced Customers
		[CUSTOMERS TABLE][ZIP CODES: Extra Info]

USE CASES: Getting Extra Data
	A.) LEFT JOIN
***************************************************************
[3] Check for Existence: of DATA in another table "Filtering":

		[CUSTOMERS TABLE] <-- Data has to be checked
		[ORDERS TABLE] <-- Lookup Table

		* CHECK IF CUSTOMER PLACED ORDER
			JOIN TABLES
				[CUSTOMERS TABLE]--(DATA(DATA)~~)--[ORDER TABLE]

		* Existence of order or no order. show, not combine
			[CUSTOMERS TABLE: list ONLY customers ORDERS]
			[CUSTOMERS TABLE: list ONLY customers with no ORDERS]

USE CASES: used to check for existence
	A.) INNER JOIN
	B.) LEFT JOIN + WHERE (ONLY)
	C.) FULL JOIN + Where
	D.) LEFT ANTI JOIN + Where
	E.) FULL ANTI JOIN + Where
----------------------------------------------------
----------------------------------------------------

* NOTE: JOIN TYPES

----------------------------------------------------
----------------------------------------------------

************************************
|| KEY: ~~ NO DATA HERE. **DATA** ||
************************************

******************************
NOTE: THE SIDE OF THE TABLE IS IMPORTANT:

(LEFT TABLE)	(RIGHT TABLE)
(TABLE_A)		(TABLE_B)

******************************

Three possiblilties when COMBINING:
	1.) Matching Data: (between table A & B) OVER LAP:
			( ~~ (**DATA**) ~~ )
	2.) ALL Data:(ALL data from table A & matching data from B)
			(**DATA** (**DATA**) ~~ )
	3.) Unmatching DATA: (ONLY data from table A & No matching dataB)
			(**DATA** ( ~~ ) ~~ )

***************************************************************
BASICS:

(A:**DATA**) (B:**DATA**)					:No Join

( ~~ ( A:**DATA**:B ) ~~ )					:Inner Join

(A:**DATA** ( A:**DATA**:B ) ~~ )			:Left Join

( ~~ ( A:**DATA**:B ) B:**DATA**)			:Right Join

(A:**DATA** ( A:**DATA**:B ) B:**DATA**)	:Full Join

***************************************************************
ADVANCED

(A:**DATA**( ~~ ) ~~ )					:Left Anti Join

( ~~ ( ~~ ) B:**DATA**)					:Right Anti Join

(A:**DATA** ( ) B:**DATA**)				:Full Anti Join

(A:**DATA** ) <=> ( B:**DATA**)			:Cross Join


***************************************************************
***************************************************************
***************************************************************
***************************************************************
________
|BASICS|:
--------
***************************************************************
***************************************************************
***************************************************************
***************************************************************

[No Join]:
---------
(A:**DATA**) (B:**DATA**)
	- Two Results: All (A TABLE) & (B TABLE) ROWS
		* Returns Data from Tables without Combining Them
	
	- Syntax:
		SELECT *
		FROM TABLE_A;
		SELECT *
		FROM TABLE_B;
		
		**********************
		USE MyDatabase
		SELECT *
		FROM customers;

		SELECT *
		FROM orders;
		**********************

***********************************
***********************************

[Inner Join]:
------------
( ~~ ( A:**DATA**:B ) ~~ )					
	- Only Matching DATA: ( ~~ ( A:**DATA**:B ) ~~ ) 
		* Returns only matching rows from both A & B tables
		** NOTE: Table Order doesn't matter
	
	- Syntax:
		SELECT *
		FROM TABLE_A
		[TYPE:DEFAULT= INNER] INNER JOIN TABLE_B;
		ON <condition: How to match rows> 
			TABLE_A.key = TABLE_B.key
		
		**********************
		--Get all customers along with their orders, only for customers who placed order
		USE MyDatabase

		SELECT * 
		FROM customers
		INNER JOIN orders
		ON id = customer_id
		
		-- or

		SELECT * 
		FROM MyDatabase.dbo.customers
		INNER JOIN MyDatabase.dbo.orders
		ON customers.id = orders.customer_id

		-- Or 

		USE MyDatabase
		SELECT *
		FROM customers
		INNER JOIN orders
		ON customers.id = orders.customer_id

		----------------------------------
		-- Select specific columns
		USE MyDatabase
		SELECT 
		id, 
		first_name,
		country, 
		order_date, 
		order_id
		FROM customers
		INNER JOIN orders
		ON customers.id = orders.customer_id

		-------------------------------------
		
		-- Select specific columns and table where data is coming from	
		SELECT 
		Cus.id, 
		Cus.first_name,
		Cus.country, 
		O.order_date, 
		O.order_id
		FROM MyDatabase.dbo.customers AS Cus
		INNER JOIN MyDatabase.dbo.orders AS O
		ON Cus.id = O.customer_id

		-------------------------------------
		-- Same results, if table order changes
		SELECT 
		Cus.id, 
		Cus.first_name,
		Cus.country, 
		O.order_date, 
		O.order_id
		FROM MyDatabase.dbo.orders AS O 
		INNER JOIN MyDatabase.dbo.customers AS Cus
		ON Cus.id = O.customer_id

***********************************
***********************************

[Left Join]:
-----------
(A:**DATA** ( A:**DATA**:B ) ~~ )		
	- All Rows (A TABLE) & Only Matching ROWS (B TABLE)
		* A table is Primary Data & B table is Secondary Data
		* Order is important
	- Syntax:
		SELECT *
		FROM A 
		LEFT JOIN B
		ON A.key = B.key
	------------------------------------
	/*
	Get all customers along with their orders,
	including those without orders.
	*/

	SELECT *
	FROM MyDatabase.dbo.customers AS Cus
	LEFT JOIN MyDatabase.dbo.orders AS O
	ON Cus.id = O.customer_id

***********************************
***********************************

[Right Join]:
------------
( ~~ ( A:**DATA**:B ) B:**DATA**)			
	-  Only Matching Rows (A TABLE) & (B TABLE) All ROWS
		* B table is Primary Data & A table is Secondary Data
		* Order is important
	- Syntax:
		SELECT *
		FROM A
		RIGHT JOIN B
		ON A.key = B.key
		---------------------------------------------------
		--Get all customers along w/their orders, including orders without matching customers (RIGHT JOIN)
		USE MyDatabase

		SELECT 
			c.id,
			c.first_name,
			c.country,
			o.order_date,
			o.order_id
		FROM customers AS C
		RIGHT JOIN orders AS O
		ON C.id = O.customer_id

		--** (POPULATE) Get all customers along w/their orders, including orders without matching customers (LEFT JOIN) SAME RESULTS
		-- SAME RESULTS (B:**DATA** ( B:**DATA**:A ) ~~ )
		USE MyDatabase
		SELECT 
			c.id,
			c.first_name,
			c.country,
			o.order_date,
			o.order_id
		FROM orders AS O 
		LEFT JOIN customers AS C
		ON C.id = O.customer_id



***********************************
***********************************

[Full Join]:
-----------
(A:**DATA** ( A:**DATA**:B ) B:**DATA**)	
	- All rows from both tables: (A TABLE), (A & B) & (B TABLE) ROWS
		* Table ORDER DOESN'T MATTER
	- Syntax:
		SELECT *
		FROM TABLE_A
		FULL JOIN TABLE_B
		ON <condition: A.Key = B.Key >
		
		or
		
		SELECT *
		FROM TABLE_B
		FULL JOIN TABLE_A
		ON <condition: A.Key = B.Key >


***************************************************************
***************************************************************
***************************************************************
***************************************************************
__________
|ADVANCED|
----------
***************************************************************
***************************************************************
***************************************************************
***************************************************************


(A:**DATA**( ~~ ) ~~ )					:Left Anti Join

( ~~ ( ~~ ) B:**DATA**)					:Right Anti Join

(A:**DATA** ( ) B:**DATA**)				:Full Anti Join

(A:**DATA** ) <=> ( B:**DATA**)			:Cross Join



----------------------------------------------------
----------------------------------------------------

[LEFT ANTI JOIN]:
-----------------
(A:**DATA**( ~~ ) ~~ )	
	- Return rows from Left that has No MATCH IN RIGHT TABLE. Nothing intercepting 
	- left is primary & right just lookup (filter)
	* Only unmatching Left TABLE rows
	* Order Matters
	- Syntax:
		SELECT *
		FROM A
		LEFT JOIN B
		ON A.Key = B.Key
		WHERE B.Key IS NULL


	*********************************
	USE MyDatabase

	SELECT *
	FROM customers AS c
	LEFT JOIN orders AS o
	ON c.id = o.customer_id
	WHERE o.customer_id IS NULL

----------------------------------------------------
----------------------------------------------------

[RIGHT ANTI JOIN]:
-----------------
( ~~ ( ~~ ) B:**DATA**)		
	- 
	* Table ORDER DOES MATTER
	- Syntax:
		SELECT *
		FROM A
		RIGHT JOIN B
		ON A.Key = B.Key
		WHERE A.Key IS NULL
		*********************************

		SELECT *
		FROM MyDatabase.dbo.customers AS c
		RIGHT JOIN MyDatabase.dbo.orders AS o
		ON c.id = o.customer_id
		WHERE c.id IS NULL

		*********************************

		-- SAME AS ABOVE BY USING LEFT JOIN
		USE MyDatabase

		SELECT *
		FROM orders AS o 
		LEFT JOIN customers AS c
		ON c.id = o.customer_id
		WHERE c.id IS NULL

----------------------------------------------------
----------------------------------------------------

[FULL ANTI JOIN]:
-----------------
(A:**DATA** ( ) B:**DATA**)	
	- Return Only the Rows that Don't Match in either Tables
	- Only unmatching rows from both Left & Right tables
	* Table ORDER DOESN'T MATTER
	- Syntax:
		SELECT *
		FROM A
		FULL JOIN B
		ON A.key = B.key
		WHERE B.key IS NULL
		OR A.key IS NULL

		*********************************
	-- Find customers without orders & orders without customers
		USE MyDatabase

		SELECT *
		FROM customers AS c
		FULL JOIN orders AS o
		ON c.id = o.customer_id
		WHERE o.customer_id IS NULL
		OR c.id IS NULL

		*********************************
	-- OR SAME THING DIFFERENT ORDER

		SELECT *
		FROM orders AS o
		FULL JOIN customers AS c 
		ON c.id = o.customer_id
		WHERE c.id IS NULL 
		OR o.customer_id IS NULL
----------------------------------------------------
----------------------------------------------------

-- [CROSS JOIN]:
-----------------
(A:**DATA** ) <=> ( B:**DATA**)		
	- Combine every row from left with every row from right
	- ** ALL POSSIBLE COMBINATIONS - Cartersian JOIN
	* Table ORDER DOESN'T MATTER
	- Syntax:
		SELECT *
		FROM A
		CROSS JOIN B

		NOTE: No Condition Needed
	****************************************
-- Generate all possible combinations of customers & orders
	USE MyDatabase

	SELECT *
	FROM customers
	CROSS JOIN orders

----------------------------------------------------
----------------------------------------------------


***************************************************************
***************************************************************
***************************************************************
***************************************************************
_____________________________________
|HOW to Choose Between JOIN TYPES???|
-------------------------------------
***************************************************************
***************************************************************
***************************************************************
***************************************************************
WHEN QUERYING, WANT TO SEE:

** [ONLY MATCHING]
	1.) IF [* Only Matching Data between 2 Tables]
		[USE]: INNER JOIN	( ~~ ( A:**DATA**:B ) ~~ )

** [ALL ROWS]
	2.) IF ALL ROWS [* One Side More IMPORTANT?] "Master Table"
		** [USE]: LEFT JOIN (  A:**DATA** ( A:**DATA**:B ) ~~ )
		[USE]: RIGHT JOIN (  ~~ ( A:**DATA**:B ) B:**DATA** )

	3.) IF ALL ROWS [* BOTH SIDES IMPORTANT!] 
		[USE] FULL JOIN (  A:**DATA** ( A:**DATA**:B ) B:**DATA** )

** [ONLY UNMATCHING]
	4.) IF [Only Unmatching Data between 2 Tables]
		[* One Side More IMPORTANT]
			[USE]: LEFT ANTI JOIN	( A:**DATA** ( ~~ ) ~~ ) + WHERE
			[USE]: RIGHT ANTI JOIN	( ~~ ( ~~ ) B:**DATA**  ) + WHERE

	5.) IF ALL ROWS [BOTH SIDES IMPORTANT!] 
		[* BOTH SIDES IMPORTANT!]
			[USE] FULL JOIN (  A:**DATA** ( ~~ ) B:**DATA** )
































