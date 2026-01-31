-- ALTER: Make changes to table

-- Add a new column called email to the persons table
ALTER TABLE persons
ADD home_phone VARCHAR(15) NOT NULL
-- new columns appended at the end of table by default
ADD email VARCHAR(50) NOT NULL


-- highlight to view
SELECT * FROM persons