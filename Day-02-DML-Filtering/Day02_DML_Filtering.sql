-- =========================================
-- DAY 2 : SQL DML COMMANDS & DATA FILTERING
-- 21 Days SQL Challenge
-- =========================================

-- DML Commands - Data Manipulation Language

-- =========================================
-- INSERT COMMAND
-- =========================================

-- To INSERT DATA into table we use INSERT command:
-- INSERT INTO table_name (column1, column2,...)
-- VALUES (value1, value2,...)

-- If no column are specified SQL expects values for all columns 
-- RULE --> Match the number of columns and values
-- We can insert multiple values

INSERT INTO customers (id, first_name, country, score)
VALUES 
	(6, 'Anna', 'USA', NULL),
	(7, 'Sam', NULL, 100)

SELECT * FROM customers

-- RULE --> columns and values must be in the same order

INSERT INTO customers (id, first_name, country, score)
VALUES 
	(8, 'USA', 'Max', NULL)

SELECT * FROM customers

INSERT INTO customers
VALUES 
	(9, 'Andreas', 'Germany', NULL)

SELECT * FROM customers

-- NOTE --> columns not included in INSERT become NULL (unless a default or constraint exists)

-- Insert only id and first_name
INSERT INTO customers (id, first_name)
VALUES
	(10, 'Sahra')

SELECT * FROM customers

-- INSERT using SELECT command
-- means taking data from previously created table and filling this data to new empty table
-- moving data from one table (source table) to other table (destination table)

-- INSERT data from 'customers' table into 'persons'?
-- CREATE TABLE persons FIRST 
CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
)

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

ALTER Table persons 
DROP COLUMN email


SELECT * FROM persons

-- NOW CPYING THE DATA
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers


SELECT * FROM persons

  -- =========================================
-- UPDATE COMMAND
-- =========================================
  

-- UPDATE command for updating / change the content of existing row
-- UPDATE table_name
-- SET column1 = value1,
--	   column2 = value2
-- WHERE condition

-- Change the score of customer with ID 6 to 0
UPDATE customers
SET score = 0
WHERE id = 6

SELECT * FROM customers


-- Change the score of customer with ID 10 to 0 and update the country to 'UK'
UPDATE customers
SET score = 0, country = 'UK'
WHERE id = 10


SELECT * FROM customers


-- Update all customers with a NULL score by setting their score to 0
UPDATE customers
SET score = 0 
WHERE score IS NULL

SELECT * 
FROM customers
WHERE score IS NULL

-- =========================================
-- DELETE COMMAND
-- =========================================

-- DELETE command --> Removing the rows
-- DELETE FROM table_name
-- WHERE condition

-- Delete all customers with an ID greater than 5
DELETE FROM customers
WHERE id > 5


SELECT * 
FROM customers


-- Delete all data from the persons table
-- instead of using this we use TRUNCATE DELETE FROM persons 

-- TRUNCATE command --> clears the whole table at once without checking or logging
TRUNCATE TABLE persons

-- SELECT * FROM perons

-- =========================================
-- FILTERING DATA USING WHERE
-- =========================================


-- FILTERING DATA
-- USING WHERE OPERATOR: 
-- Comparison Operator: =, <>, =!, >, >=, <, <=
-- Logical Opertaor: AND, OR, NOT
-- Range Operator: BETWEEN
-- Membership Operator: IN, NOT IN
-- Search Operator: LIKE


-- 1) Comparison Operators: compare two things
-- expression (operator) expression


-- Retrieve all customers from Germany?
SELECT * 
FROM customers
WHERE country = 'Germany'


-- Retrieve all customers who are not from Germany?
SELECT *
FROM customers
WHERE country != 'Germany'

SELECT *
FROM customers
WHERE country <> 'Germany'


-- Retrieve all customers with a score gretaer than 500
SELECT * 
FROM customers
WHERE score > 500


-- Retrieve all customers with a score 500 or more
SELECT * 
FROM customers
WHERE score >= 500



-- Retrieve all customers with a score less than 500
SELECT * 
FROM customers
WHERE score < 500


-- Retrieve all customers with a score 500 or less
SELECT * 
FROM customers
WHERE score <= 500


-- Logical Operator:
-- AND --> All conditions in WHERE clause must be TRUE

-- Retrieve all customers who are from USA and have a score greater than 500
SELECT * 
FROM customers
WHERE country = 'USA' AND score > 500


-- OR Operator --> At least one condition must be TRUE

-- Retrieve all customers who are either from USA or have a score greater than 500
SELECT * 
FROM customers
WHERE country = 'USA' OR score > 500


-- NOT Operator --> (Rerevse) Excludes matching values

-- Retrieve all customers with a score NOT less than 500
SELECT * 
FROM customers
WHERE NOT score < 500


-- Range Operators --> Check if a value is within a range

-- for range we need lower and upper boundary
-- in between upper and lower boundary it is true else outside the boundary it is false


-- Retrieve all customers whose score falls in the range between 100 and 500
SELECT * 
FROM customers
WHERE score BETWEEN 100 AND 500


SELECT * 
FROM customers
WHERE score >= 100 AND score <= 500


-- IN Operator --> Check if a value exists in a list

-- Retrieve all customers from either Germany or USA
SELECT * 
FROM customers
WHERE country = 'Germany' OR country = 'USA'


SELECT * 
FROM customers
WHERE country IN ('Germany', 'USA')


-- LIKE Operator --> Search for a specific pattern in text

-- M% means M should first character and % can be any character
-- %in it means last character should be in irrescpective of what is written before this
-- %r% it means there is anything written before and after r it should be in between of characters
-- __b% means there should be something in first and second position and third should be b and after that it can be something


SELECT *
FROM customers
WHERE  first_name LIKE 'M%'



-- Find all customers whose first name ends with 'n'
SELECT *
FROM customers
WHERE  first_name LIKE '%n'




-- Find all customers whose first name contains 'r'
SELECT *
FROM customers
WHERE  first_name LIKE '%r%'




-- Find all customers whose first name has 'r' in third position
SELECT *
FROM customers
WHERE  first_name LIKE '__r%'
