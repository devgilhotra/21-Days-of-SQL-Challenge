/*
SQL Functions - Function is a built-in code that accepts an input value, processess it and returns an output value

Types of function -- 
1) Single-Row Functions  - One value in and return one value out
2) Multi-Row Functions  - Multi value input and one single value output
3) Nested Functions - used inside another functions

1) Single-row functions: 
a) String Function
b) Number Function
c) Date & Time Function
d) Null Function
e) Case Statement

2) Multi-Row functions:
a) Aggregate functions (basics)
b) Window functions (advanced)
*/

-- 1) String Functions --> manipulation = concat, upper, lower, trim, replace.
-- for calculation = len 
-- for string extraction = left, right and substring

-- CONCAT = combines multiple strings into one value.

-- show a list of customers first name together with their country into one column 

USE MyDatabase

select first_name, country,
concat (first_name, ' ', country) AS name_country 
from customers


-- LOWER = converts all charcaters to lower case 

-- convert the first name to lower case
select first_name,
lower (first_name) AS lower_case
from customers

-- UPPER = converts all characters to upper case 

-- convert the first name to upper case
select first_name,
upper (first_name) AS upper_case
from customers


-- TRIM = Removes leading and trailing spaces (last and end extra spaces / white space / empty space)  

-- find the customers whose first name contains leading or trailing spaces 
select first_name
from customers
where first_name != trim(first_name)


-- LEN = calculate the total number of characters in a letter 
select first_name,
len(first_name) AS len_name,
len(trim(first_name)) AS len_trim_name
from customers


-- REPLACE - replace a specific character with a new character 

-- Remove dash from phone number

SELECT
'123-456-789',
replace ('123-456-789', '-', '/') AS clean_phone


-- Replace file extension from txt to csv 

SELECT
'report.txt' AS old_filename,
replace ('report.txt', 'txt', 'csv') AS new_filename


-- calculate the length of each customer's first name 

SELECT first_name,
len(first_name) AS len_name
FROM customers



-- 3) String Extraction = Left & Right

-- Left = extracts specific number of characters from the start of a string value 
-- LEFT (VALUE, No.ofcharactters) for first side characters 

-- Retrieve the first two charcaters of first name 

SELECT first_name,
LEFT (first_name, 2) AS first_2_characters
from customers


-- Right = extracts specific number of characters from the end of a string value 
-- RIGHT (VALUE, No.ofcharactters) for last side characters 

-- Retrieve the last two charcaters of first name 

SELECT first_name,
RIGHT (first_name, 2) AS lasst_2_characters
from customers


-- Substring = extracts a part of string at a specified position 
-- SUBSTRING(value, starting position, length of character to be extracted)

-- After the 2nd character extract 2 characters 

SELECT first_name,
SUBSTRING (first_name, 2, 2)
from customers


-- After the 2nd character extract all characters 

SELECT first_name,
SUBSTRING (first_name, 2, len(first_name)) AS sub_name
from customers



/*
Numeric functions = Round, ABS
*/

-- ROUND = Round of the number to the given decimal place 

SELECT 
3.516,
ROUND(3.516, 0) AS round_2,
ROUND(3.516, 1) AS round_1,
ROUND(3.516, 2) AS round_0;


--- ABS = (absolute), return the absolute positive value of a number, removing any negative sign. 

SELECT 
-10,
ABS(-10) AS ABS_NUMIS,
ABS(10) AS ABS_NUMIS


/*
Data & Time Function:

Date = Year-Month-Date

Time = Hours:Months:Seconds

TIMESTAMP = Year-Month-Date Hours:Months:Seconds

*/

USE SalesDB


SELECT 
OrderID,
OrderDate,
ShipDate,
CreationTime
FROM Sales.Orders;


-- Date & Time values

SELECT
OrderID,
CreationTime,
'2026-03-08' HardCoded
FROM Sales.Orders


-- GETDATE() = Returns the current date and time and current execution the time 
SELECT
OrderID,
CreationTime,
GETDATE() Today
FROM Sales.Orders


