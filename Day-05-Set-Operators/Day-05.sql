/*
SET Operators - for combining rows of two tables

Rules - 
1) SET Operator can be used almost in all clause WHERE, JOIN, GROUP BY, HAVING

2) Only one ORDER BY is used in SET Operator at the end of query.

3) Number of columns in each query must be same

4) Data types of columns in each query must be compatible

5) The order of columns in each query must be the same

6) The column names in the result set are determined by the column names specified in the first query

7) Even if all rules are met and SQL shows no errors the result may be incorrect

8) Incorrect column selection leeds to inaccurate results

*/

USE SalesDB;

SELECT
FirstName,
LastName
FROM Sales.Customers

UNION 

SELECT
FirstName,
LastName
FROM Sales.Employees


-- UNION = Returns all distinct rows from both queries, remove duplicate rows from the result

-- Combine the data from employees and customers into one table.
SELECT 
FirstName,
LastName
FROM Sales.Employees

UNION

SELECT 
FirstName,
LastName
FROM Sales.Customers



-- UNION ALL = Returns all rows from both queries, including duplicates rows from the result


/*
Difference Between UNION ALL vs UNION?
UNION ALL is genrally faster than UNION
If there are no duplicates, use UNION ALL
*/

-- Cobine the data from employees and customers into one table, including duplicates
SELECT 
FirstName,
LastName
FROM Sales.Employees

UNION ALL

SELECT 
FirstName,
LastName
FROM Sales.Customers


/*
EXCEPT - Returns all distinct rows from the first query that are not found in the second query
It is the only one where the order of queries affects the final result
Remove the duplicates from the results
*/

-- Find the employees who are not customers at the same time

SELECT 
FirstName,
LastName
FROM Sales.Employees

EXCEPT

SELECT 
FirstName,
LastName
FROM Sales.Customers


-- Intersection = Returns only the rows that are common in both queries

-- Find the employees who are also customers

SELECT 
FirstName,
LastName
FROM Sales.Employees

INTERSECT

SELECT 
FirstName,
LastName
FROM Sales.Customers


/*
How set operator used in data analysis, projects?

The use cases are as follows:
1) Combine similar information before analyzing the data 
2) Sometimes Database developers divide the data into multiple tables to optimize performance and archive old data 
*/

-- Orders are stored in seperate tables (Orders and Ordersarchive) combine all orders into one report without duplicates

Select TOP (1000)
'Orders' AS SourceTable,
OrderId, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress ,BillAddress, Quantity, Sales, CreationTime
FROM Sales.Orders

UNION

Select
'OrdersArchive' AS SourceTable,
OrderId, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress ,BillAddress, Quantity, Sales, CreationTime
FROM Sales.OrdersArchive
ORDER BY OrderID


/*
EXCEPT USE CASES -- DELTA DETECTION

DATA COMPLETENESS CHECK -- EXCEPT operator can be used to compare table to detect discrepancies between databases 
*/

