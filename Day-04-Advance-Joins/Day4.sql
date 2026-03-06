-- Advanced Join Types

/* Left Anti Join --> Returns row froom left side table that has no match in right table

SELECT *
FROM A
LEFT JOIN B
ON A.key = B.key
WHERE B.key IS NULL

THIS QUERY IS WRITTEN BECAUSE THERE IS NO SUCH SYNTAX FOR THIS JOIN SO, WE WILL BE USING WHERE B.key IS NULL
*/

-- Get all customers who haven't placed any order
SELECT * 
FROM customers

SELECT *
FROM orders


SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL



/* Right Anti Join --> Returns row froom right side table that has no match in left table

SELECT *
FROM A
RIGHT JOIN B
ON A.key = B.key
WHERE A.key IS NULL

THIS QUERY IS WRITTEN BECAUSE THERE IS NO SUCH SYNTAX FOR THIS JOIN SO, WE WILL BE USING WHERE A.key IS NULL
*/

-- Get all orders without matching customers
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL


-- Get all orders without matching customers (using left join)
SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL




/*
Full Anti Join --> Returns only rows tha does not match in other table
Only unmatching data

SELECT *
FROM A
FULL JOIN B
ON A.key = B.key
WHERE
	B.key IS NULL
OR
	A.key IS NULL
*/


-- find customers without orders and orders without customers
SELECT *
FROM orders AS o
FULL JOIN customers AS c 
ON c.id = o.customer_id
WHERE
	c.id IS NULL
OR
	o.customer_id IS NULL


-- Get all customers along with their orders, but only for customers who have placed an order (without using inner join)
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL


/*
Cross Join --> Combine every row from left with every row from right
all possible combination
cartesian join
everything of A and everything of B


SELECT *
FROM A
CROSS JOIN B
*/


-- Generate all possible combinations of customers and orders
SELECT *
FROM customers
CROSS JOIN orders



/* 
How to choose between JOIN TYPES?

Only Matching Data Between two tables --> Inner Join

Everything that is All Data Between two tables from one side (master table) --> Left Join

Everything that is All Data Between two tables from both side  --> Full Join


Only unmatching data between two tables from one side (master table) --> Left Anti Join 


Only unmatching data between two tables from both side --> Full Anti Join 

*/


-- Using Sales Database, Retrieve a list of all orders, along with the related customer, product and employee details. For each order, display: Order ID, Customer's name, Product name, Sales amount, Product price, Salesperson's name

USE SalesDB

SELECT * FROM Sales.Orders

SELECT 
	o.OrderID,
	o.Sales
FROM Sales.Orders AS o


SELECT * FROM Sales.Customers

SELECT * FROM Sales.Employees

SELECT * FROM Sales.OrdersArchive

SELECT * FROM Sales.Products



SELECT 
	o.OrderID,
	o.Sales,
	c.FirstName AS CustomerFirstName,
	c.LastName AS CustomerLastName,
	p.Product AS ProductName,
	p.Price,
	e.FirstName AS EmployeeFirstName,
	e.LastName AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.salesPersonID = e.EmployeeID




