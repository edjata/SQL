-- Delete all customers with ID greater than 10
DELETE FROM 
-- full path to db customer table
 MyDatabase.dbo.customers
 WHERE id > 10


 --HIGHLIGHT TO VIEW RUN FIRST
 SELECT * 
 FROM customers