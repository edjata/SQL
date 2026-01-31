-- Adding a new column 'New Customer' and assigning it a name AS customer_type
SELECT
id,
first_name,
'New Customer' AS customer_type
FROM customers