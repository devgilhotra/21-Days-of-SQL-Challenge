-- Joining Data using Joins
-- Column we use Joins
-- Rows we use SET Operators (columns should be same in both the table)

-- Types of Sets --> UNION, UNION ALL, EXCEPT, INTERSET


/*SQL Joins Used when-->
1) To Recombine Data --> Data spread into customer as Address, Reviews, Orders, Customers. I want to see these all in one Table as a one complete big picture.
2) Data Enrichment --> Geting Extra Data from another (refernce table) to master table. Ex- Getting Zip Codes from another table and combinig it to customer tables
3) Check for Existence of your Data in another table. By doing the filtering
*/


-- Types of Joins --> Inner, Left, Right, Full Join

/*
								Basic Joins
Left and Right two circles are present based on following scenarios choose what you want to apply
1) Both circle having Data but seperated from eachother --> No Join
2) Matching Data means combination of common of both tables --> Inner Join
3) All Data from left circle also left circle area present in right circle --> Left Join
4) All Data from Right circle also right circle area present in left circle  --> Right Join
5) Unmatched Data means All Data from left circle but should not be present in table b
6) Combination Data from both the circle that is left and right circle --> Full Join
*/



/* 
					Advance Joins
1) Data only of left circle present in left circle means if left circle data is present in right circle, it should not be taken only left circle portion is taken --> Left Anti Join
2) Data only of right circle present in right circle means if right circle data is present in left circle, it should not be taken only right circle portion is taken --> Right Anti Join
3) Data combination of both circle present in there areas not common on inter linked data is taken --> Full Anti Join
4) produces the Cartesian product of two or more tables, combining every row from the first table with every row from the second table --> Cross Join
note for 4th --> If the first table has rows and the second table has rows, the result set will contain rows
*/


/* No Join --> Returns Data from tables without combining them, seeing two results
SELECT * FROM table A;
SELECT * FROM table B;
*/

-- Retrieve all data from customers and orders as separate results
SELECT * 
FROM customers;

SELECT * 
FROM orders;


/*
Inner Join - Returns only matching rows from both tables
SELECT * 
FROM A
(type) JOIN A
Default type is INNER JOIN
ON (condition) like A.key=B.key
*/


-- Get all customers along with their orders, but only for customers who have placed an order.
SELECT * 
FROM orders

SELECT * 
FROM customers
-- firtly we find common in both table and here it is id
SELECT * 
FROM customers
INNER JOIN orders 
ON id = customer_id


SELECT 
	id,
	first_name,
	order_id,
	sales
FROM customers
INNER JOIN orders 
ON id = customer_id



SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id



/*
Left Join --> Returns All rows from left and only matching from Right
All Rows from table A and only matching of table A in table B

SELECT *
FROM A
LEFT JOIN B
ON A.key = B.key
*/

-- Get all customers along with their orders including those without orders
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id


/*
RIGHT JOIN --> Returna All rows from right table and only matching from left table.
SELECT *
FROM A
RIGHT JOIN B
ON A.key = B.key
*/


-- Get all customers along with their orders, including orders without matching customers
SELECT 
	id,
	first_name,
	order_id,
	sales
FROM customers
RIGHT JOIN orders
ON id = customer_id



-- Get all customers along with their orders, including orders without matching customers (using left join)
/*
SELECT *
FROM B
LEFT JOIN A
ON A.key = B.key
*/

SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id


/*
FULL JOIN --> Returns All Rows from Both Tables

SELECT * 
FROM A 
FULL JOIN B 
ON A.key = B.key
*/

-- Get all customers and all orders, even if there is no match
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS C
FULL JOIN orders AS o
ON c.id = o.customer_id