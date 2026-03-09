USE SalesDB;
/* DATE AND TIME FUNCTIONS = extract the part of date like extracting year, month, date or changing the format or using the slash /

1) Part Extraction = DAY, MONTH, YEAR, DATEPART, DATENAME, DATETRUNC, EMONTH 
2) Format & Casting = FORMAT, CONVERT, CAST 
3) Calculations = DATEADD, DATEDIFF
4) Validation = ISDATE 

*/

-- From column table
SELECT
OrderID,
OrderDate,
Shipdate,
CreationTime
FROM Sales.Orders

-- Hardcoded
SELECT
OrderID,
OrderDate,
Shipdate,
CreationTime,
'2026-03-03' HardCoded
FROM Sales.Orders


-- GetDate() - Return the current date and time at the movement when the query is executed

SELECT
OrderID,
CreationTime,
GETDATE() Today
FROM Sales.Orders


/* 1) Part Extraction = DAY, MONTH, YEAR, DATEPART, DATENAME, DATETRUNC, EMONTH 

Day() = returns the day from a date 
Month() = returns the month from a date 
Year() = returns the year from a date 

*/


SELECT
OrderID,
CreationTime,
YEAR(CreationTime) YEAR,
MONTH(CreationTime) MONTH,
DAY (CreationTime) DAY
FROM Sales.Orders


-- DATEPART() = Returns a specific part of a date as a number 
-- syntax = datepart(part, date) part that we want to extract and date we want to extract from

SELECT
OrderId,
CreationTime,
DATEPART(year, CreationTime) Year_dp, 
DATEPART(month, CreationTime) Month_dp, 
DATEPART(day, CreationTime) Day_dp, 
DATEPART(hour, CreationTime) Hours_dp, 
DATEPART(minute, CreationTime) Minutes_dp,
DATEPART(quarter, CreationTime) Quaters_dp,
DATEPART(weekday, CreationTime) Weekday_dp,
DATEPART(week, CreationTime) Week_dp 
From Sales.Orders


-- DATENAME () = Returns the name of a specifix part of a date as string  

SELECT
OrderID,
CreationTime,
DATENAME (month, CreationTime) Month_dn,
DATENAME (weekday, CreationTime) weekday_dn,
DATENAME (day, CreationTime) day_dn, 
DATENAME (year, CreationTime) year_dn
FROM Sales.Orders


-- DATETRUNC () = Truncates the date to specific part  

SELECT
OrderID,
CreationTime,
DATETRUNC (minute, CreationTime) minute_dt, 
DATETRUNC (hour, CreationTime) hour_dt, 
DATETRUNC (day, CreationTime) day_dt,
DATETRUNC (year, CreationTime) year_dt
From Sales.Orders



SELECT
CreationTime,
COUNT(*)
FROM Sales.Orders
GROUP BY CreationTime


SELECT
DATETRUNC(year, CreationTime) Creation, 
COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(year, CreationTime)  



-- EOMONTH() - Returns the last day of a month  

SELECT
OrderID,
CreationTime,
EOMONTH (CreationTime) EndOfMonth 
FROM Sales.Orders


SELECT
OrderID,
CreationTime,
EOMONTH (CreationTime) EndOfMonth,
CAST (DATETRUNC(month, CreationTime) AS DATE) StartOfMonth 
FROM Sales.Orders

