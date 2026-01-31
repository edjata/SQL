-- using the default columns from db
INSERT INTO customers 
VALUES 
		(15, 'Max', 'Germany', 475)

-- Query data to see the table
SELECT * FROM customers 


-- 2nd row only id and name
INSERT INTO customers (id, first_name)
VALUES 
		(18, 'Pat')

-- Query data to see the table
SELECT * FROM customers 


