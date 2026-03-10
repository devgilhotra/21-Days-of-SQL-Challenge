USE SalesDB

-- How many orders were placed each year? 

SELECT
YEAR(OrderDate),
COUNT(*) NrOfOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)


-- How many orders were placed each month>

SELECT
DATENAME (month, OrderDate) AS OrderDate,
COUNT(*) NrOfOrders
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate)



-- DATA FILTERING

-- Show all orders that were placed during the month of feburary. 

SELECT
* 
FROM Sales.orders
WHERE MONTH (OrderDate) = 2



-- CASTING = Changing the data type from one type to another type 

-- FORMAT = formats a date or time value 

SELECT
OrderID,
OrderDate,
FORMAT (CreationTime, 'dd') dd,
FORMAT (CreationTime, 'ddd') ddd,
FORMAT (CreationTime, 'dddd') dddd,
FORMAT (CreationTime, 'MM') MM,
FORMAT (CreationTime, 'MMM') MMM,
FORMAT (CreationTime, 'MMMM') MMMM,
FORMAT (CreationTime, 'MM-dd-yyyy') USA_FORMAT,
FORMAT (CreationTime, 'dd-mm-yyyy') USA_FORMAT 
FROM Sales.Orders





-- show creation time using the folowing format: 
-- DAY Wed Jan Q1 2025 12:34:56 PM

SELECT
OrderID,
CreationTime,
'Day' + FORMAT(CreationTime, 'ddd-mmm') + 
' Q'+ DATENAME(quarter, CreationTime) + '  ' + 
FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS CustomerFormat 
FROM Sales.Orders




SELECT 
FORMAT (OrderDate, 'MMM yy') OrderDate,
COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT (OrderDate, 'MMM yy')



-- convert string to integer

SELECT
CONVERT (INT, '123') AS [String to Int CONVERT],
CONVERT (DATE, '2025-08-20') AS [String to Date CONVERT],



SELECT
CreationTime,
CONVERT (DATE, CreationTime) AS [Datetime to Date CONVERT],
CONVERT (VARCHAR, CreationTime, 32) AS [USA std. style:32],
CONVERT (VARCHAR, CreationTime, 34) AS [EURO std. style:34]
FROM Sales.Orders




-- DATEADD = Adds or subtracts a specific time interval to/from a date. 

SELECT
OrderID,
OrderDate, 
DATEADD(day, -10, OrderDate) AS TenDaysBefore, 
DATEADD(month, 3, OrderDate) AS ThreeMonthsLater,
DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders



-- DATEDIFF() = Find the difference between two dates 

SELECT
EmployeeID,
BirthDate,
DATEDIFF(year, BirthDate, GETDATE()) Age
FROM Sales.Employees


-- Find the average shipping duration in days for each month

SELECT 
MONTH(OrderDate) AS OrderDate,
AVG(DATEDIFF(day, OrderDate, ShipDate)) AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate)




-- Find the number of days between each order and previous order  

SELECT
OrderID,
OrderDate CurrentOrderDate,
LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate)NrOfDays
FROM Sales.Orders


-- ISDATE() = Checks if a value is a date 
-- Returns 1 if rhe string value is a valid date 

SELECT 
ISDATE('123') DateCheck1, 
ISDATE('2025-08-20') DateCheck2, 
ISDATE('20-08-2025') DateCheck3, 
ISDATE('2025') DateCheck4, 
ISDATE('08') DateCheck5 


SELECT
	OrderDate,a
	ISDATE(OrderDate),
	CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
		ELSE '9999-01-01'
	END NewOrderDate
FROM
(
	SELECT '2025-08-20' AS OrderDate UNION
	SELECT '2025-08-21' UNION
	SELECT '2025-08-23' UNION
	SELECT '2025-08'
)t