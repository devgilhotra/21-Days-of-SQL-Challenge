/*
Generate a report showing the total sales for each category:
High - if the sales higher than 50
Medium - if the sales between 20 and 50
Low - if the sales equal or lower than 20
*/

SELECT 
Category,
SUM(Sales) AS TotalSales
FROM(
	SELECT
	OrderID,
	Sales,
	CASE 
		WHEN Sales > 50 THEN 'High'
		WHEN Sales > 20 AND Sales < 50 THEN 'Medium'
		ELSE 'Low'
	END Category
	FROM Sales.Orders
)t
GROUP BY Category
ORDER BY TotalSales DESC


-- Mappping = Transform the values from one place to another 

-- Retrieve employee details with gender displayed as full text 

SELECT
EmployeeID,
FirstName,
LastName,
Gender,
CASE
	WHEN Gender = 'F' THEN 'Female'
	WHEN Gender = 'M' THEN 'Male'
	ELSE 'Not Available'
END GenderFullText
FROM Sales.Employees


-- Retrieve customers details with abbrevated country code 

SELECT
	CustomerID,
	FirstName,
	LastName,
	Country,
	CASE
	WHEN Country = 'Germany' THEN 'DE'
	WHEN Country = 'USA' THEN 'US'
	ELSE 'n/a'
END CountryAbbr
FROM Sales.Customers;


SELECT DISTINCT Country 
FROM Sales.Customers;


SELECT
	CustomerID,
	FirstName,
	LastName,
	Country,
	CASE Country
	WHEN 'Germany' THEN 'DE'
	WHEN 'USA' THEN 'US'
	ELSE 'n/a'
END CountryAbbr2
FROM Sales.Customers;


-- Find the average scores of customers and treat null at 0
-- Additionally provide details such CustomerID and LastName 

SELECT
CustomerID,
LastName,
Score,
CASE
	WHEN Score IS NULL THEN 0
	ELSE Score
END ScoreClass,

AVG(CASE
		WHEN Score IS NULL THEN 0
		ELSE Score 
	END) OVER () AvgCustomerClean,

AVG(Score) OVER () AvgCustomer
FROM Sales.Customers