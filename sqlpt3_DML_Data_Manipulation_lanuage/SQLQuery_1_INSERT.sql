-- DML COMMANDS Data Manipulation Lanuage

--Modify Data

-- INSERT: add new rows to table or append to table

-- Method 1: Manually Entry (VALUES) [INSERT VALUES] into [Target Table]
/* 
INSERT SYNTAX:

NOTE: if no columns are specified SQL expects values for all columns

INSERT INTO table_name (column1, column2, column3,...)
VALUES (value1, value2, value3,...)
	  ,(value1, value2, value3,...) <-- Multiple inserts ok
** RULE: NUMBER OF [COLUMNS] AND [VALUES] MUST MATCH


*/

-- INSERT INTO
INSERT INTO customers (id, first_name, country, score)
VALUES 
		(11, 'Micky', 'UK', NULL),
		(12, 'Sara', NULL, 375),
		(13, 'tammy', 'UK', 100),
		(14, 'Mac', 'UK', 675)

-- Query data to see the table
SELECT * FROM customers 



-- METHOD 2: 
INSERT INTO customers
VALUES
	(15, 'Tammy','USA', 875)
	

INSERT INTO customers
VALUES
	(17, 'Nammy','USA', 875)

INSERT INTO customers
VALUES
	(16, 'Mammy','USA', 875)

SELECT * FROM customers