--Switching to different databse:
USE MYDatabase

--Using single line and multi line comments:
-- This is a single line comment
/*This is 
multi-line
comment*/

--Retriving all customer data from customer table:
SELECT * 
FROM Customers

-- Retrieve All Order Data:
SELECT *
FROM orders


--Selecting Few Columns that we need instead of every column:
Select
	first_name,
	country,
	score
FROM customers




-- Retrieve customers with a score not equal to 0:
-- Using Where Clause  filters your data based on condition
SELECT *
FROM customers
Where score != 0


-- Retrieve customers from Germany:
SELECT *
FROM customers
Where country = 'Germany'

-- ORDER BY  Sort your data (ASC, DESC):
-- Retrieve all customers and sort the results by the highest score first:
SELECT * 
from customers
ORDER BY score DESC

-- Retrieve all customers and sort the results by the country and then by the highest score first:
SELECT * 
from customers
ORDER BY 
	country ASC,
	score DESC



--Group By  Combines rows with the same value aggregates a column by another column
-- Find the total score of each country
SELECT
	country,
	SUM(score)
FROM customers
Group By country


-- AS (ALIAS) shorthand name (Label) assigned to a column or table in a query:
-- Naming total_score for SUM(score) column:
SELECT
	country,
	SUM(score) AS total_score
FROM customers
Group By country


-- find the total score and total number of customers for each country:
select
	country,
	SUM(score) AS total_score,    
	COUNT(id) AS total_coustomer
FROM customers
GROUP BY country


-- Having  filters data after aggregation can be used only with Group By:
SELECT 
	country,
	SUM(score)
FROM customers
WHERE score > 400
GROUP BY country
HAVING Sum(score) > 800


-- Find the average score for eah country considering only customers with a score not equal to 0 and return only those countries with an average score greater than 430:
SELECT
	country,
	AVG(score) AS averaage_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430


-- DISTINCT  returns only unique value
-- Return unique list of all countries
SELECT distinct
	country
from customers


-- Retrieve only 3 customers:
SELECT TOP 3 *
from customers


-- Retrieve only 3 customers with highest salary:
SELECT TOP 3 *
from customers
ORDER BY score DESC



-- Retrieve the lowest 2 customers based on the score:
SELECT TOP 2 *
from customers
ORDER BY score ASC


-- Get the 2 most recent orders:
SELECT TOP 2 * 
FROM orders
ORDER BY order_id DESC


-- DDL Commands  Data Definition Language 
-- (CREATE, ALTER, DROP)

-- 1. CREATE
-- CREATE a new table called persons with columns: id, person_name, birth_date and phone:

/*
CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
)
*/

--viewing the created table:
SELECT * FROM persons


-- 2. ALTER – Adding a new column to the table
-- Add a new column called email to the persons table.
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL


-- 3. DROP – Deleting the specific column from the existing table.
-- Drop the existing column phone from the table
ALTER TABLE persons
DROP COLUMN phone


-- 4. DROP – Deleting the whole table from database completely.
-- Delete the persons table from the database

DROP TABLE persons


