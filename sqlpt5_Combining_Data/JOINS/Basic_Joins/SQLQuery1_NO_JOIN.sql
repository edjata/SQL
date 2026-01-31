/* 
No JOIN
(A:**DATA**) (B:**DATA**)					
	- Two Results: All (A TABLE) & (B TABLE) ROWS
		* Returns Data from Tables without Combining Them
	- Syntax:
		SELECT *
		FROM TABLE_A;
		SELECT *
		FROM TABLE_B;
*/

USE MyDatabase

SELECT *
FROM customers;

SELECT *
FROM orders;