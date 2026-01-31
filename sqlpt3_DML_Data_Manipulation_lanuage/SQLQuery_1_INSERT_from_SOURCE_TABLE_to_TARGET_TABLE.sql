/* 
Copy data from source table: ['customers' table] 
into target table: ['persons' table]

INSERT INTO target table from source table
*/

-- Put data into table here--> [target table] -->(INSERT using SELECT)
INSERT INTO persons (id, person_name, birth_date, phone)

-- Get data from table here--> [source table] - collect where data is coming from
SELECT 
id,
first_name,
NULL AS DOB,
'Unknown' AS phone_number
FROM customers
WHERE score > 0

-- HIGHLIGHT TO VIEW
SELECT * FROM persons