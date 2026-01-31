/*
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

*/

-- Generate all possible combinations of customers & orders
USE MyDatabase

SELECT *
FROM customers
CROSS JOIN orders



