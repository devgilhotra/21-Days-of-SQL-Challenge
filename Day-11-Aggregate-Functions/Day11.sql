/*
aggregate functions perform calculations on a set of values and return a single summarized value.
They are often used with the GROUP BY clause to group rows before aggregation.

Common SQL Aggregate Functions


Function	Description	Example
COUNT()	Counts the number of rows (or non-NULL values in a column).	
SUM()	Returns the total sum of numeric values.	
AVG()	Returns the average value of numeric data.	
MIN()	Returns the smallest value.	
MAX()	Returns the largest value.
*/

SELECT * FROM orders

-- FInd the total number of orders

SELECT
COUNT(*) AS total_nr_ofders
FROM orders


-- Find the total sales of all orders

SELECT
COUNT(*) AS total_nr_ofders,
SUM(Sales) AS total_sales
FROM orders


-- Find the average sales of all orders

SELECT
COUNT(*) AS total_nr_ofders,
SUM(Sales) AS total_sales,
AVG(Sales) AS avg_sales
FROM orders

-- Find the highest sales of all orders

SELECT
COUNT(*) AS total_nr_orders,
MAX(Sales) AS highest_sales
FROM orders

-- Find the lowest sales of all orders

SELECT
COUNT(*) AS total_nr_orders,
SUM(Sales) AS total_sales,
AVG(Sales) AS average_sales,
MIN(Sales) AS lowest_sales,
MAX(Sales) AS highest_sales
FROM orders
GROUP BY customer_id

