-- working with null values in sql

-- NULL is an unkown value or unkown, means it is empty value
-- It is not equal to zero


-- display the full name of customers in a single field by merging their first and last names, and add 10 bonus to each customer's score 

SELECT
CustomerID,
FirstName,
LastName,
COALESCE (LastName, '') LastName2,
FirstName + ' ' + LastName AS FullName,
Score
From Sales.Customers


SELECT
CustomerID,
FirstName,
LastName,
FirstName + ' ' + COALESCE (LastName, '') AS FullName,
Score,
COALESCE (Score, 0) + 10 AS ScoreWithBonus
From Sales.Customers



-- Sort the customers from lowest to highest scores, with nulls appearing last 

SELECT
CustomerID,
Score
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score 


-- NULLIF = Compares two expressions returns: 
-- NULL, if they are equal
-- First Value, if they are not equal 



-- Find the sales price for each order by dividing sales by quantity 

SELECT
OrderID,
Sales,
Quantity,
Sales / NULLIF (Quantity, 0) AS Price
FROM Sales.Orders



-- IS NULL = Returns TRUE if the value IS NULL 

-- IS NOT NULL = Returns TRUE if the value IS NOT NULL, otherwise it returns FALSE  


-- List all customers who have scores

SELECT *
FROM Sales.Customers
WHERE Score IS NOT NULL
