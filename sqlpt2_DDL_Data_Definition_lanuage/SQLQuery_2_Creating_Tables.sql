-- CREATE - Creating Tables

/* Create a new table called persons
   with columns: id, person_name, birth_date, and phone */
CREATE TABLE persons (
    
-- [Name][Data Type][Constraint]
    id INT NOT NULL,
-- [Name][Data Type][Constraint]
    person_name VARCHAR(50) NOT NULL,
-- [Name][Data Type][NULL Allowed]
    birth_date DATE,
-- [Name][Data Type][Constraint]
    phone VARCHAR(15) NOT NULL,
-- [Constraint][internal db][PK Constraint]
    CONSTRAINT pk_persons PRIMARY KEY (id)
)

USE MyDatabase
SELECT * FROM persons

-- New Table
CREATE TABLE rich_people(
id INT NOT NULL,
first_name VARCHAR(100) NOT NULL,
middle_name VARCHAR(100),
last_name VARCHAR(100) NOT NULL,
date_of_birth DATE,
phone VARCHAR(15),
country VARCHAR(100),
CONSTRAINT pk_persons PRIMARY KEY (id)
)

CREATE TABLE business(
id INT NOT NULL,
company_name VARCHAR(100) NOT NULL,
company_address VARCHAR(100) NOT NULL,
company_city VARCHAR(50) NOT NULL,
company_state VARCHAR(25) NOT NULL,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY (id)
)



