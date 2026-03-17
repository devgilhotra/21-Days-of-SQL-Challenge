/*
SQL Window Aggregate Functions - These functions perform aggregate calculations 
on a set of rows while keeping each row in the result.

Common Window Aggregate Functions:
1) SUM()
2) AVG()
3) COUNT()
4) MAX()
5) MIN()

Syntax:
FUNCTION_NAME(column) OVER (
    PARTITION BY column
    ORDER BY column
)
*/

USE MyDatabase


/*
1) SUM() - Running Total
*/

-- Calculate running total of salary

SELECT emp_id, emp_name, salary,
SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM employees



/*
2) SUM() with PARTITION BY
*/

-- Total salary per department

SELECT emp_id, emp_name, department, salary,
SUM(salary) OVER (PARTITION BY department) AS dept_total_salary
FROM employees



/*
3) AVG() - Average Salary
*/

-- Average salary across all employees

SELECT emp_id, emp_name, salary,
AVG(salary) OVER () AS avg_salary
FROM employees



/*
4) AVG() with PARTITION BY
*/

-- Average salary per department

SELECT emp_id, emp_name, department, salary,
AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
FROM employees



/*
5) COUNT() - Count Rows
*/

-- Count total employees

SELECT emp_id, emp_name,
COUNT(*) OVER () AS total_employees
FROM employees



/*
6) COUNT() with PARTITION BY
*/

-- Count employees per department

SELECT emp_id, emp_name, department,
COUNT(*) OVER (PARTITION BY department) AS dept_count
FROM employees



/*
7) MAX() - Maximum Value
*/

-- Highest salary overall

SELECT emp_id, emp_name, salary,
MAX(salary) OVER () AS max_salary
FROM employees



/*
8) MAX() with PARTITION BY
*/

-- Highest salary per department

SELECT emp_id, emp_name, department, salary,
MAX(salary) OVER (PARTITION BY department) AS dept_max_salary
FROM employees



/*
9) MIN() - Minimum Value
*/

-- Lowest salary overall

SELECT emp_id, emp_name, salary,
MIN(salary) OVER () AS min_salary
FROM employees



/*
10) MIN() with PARTITION BY
*/

-- Lowest salary per department

SELECT emp_id, emp_name, department, salary,
MIN(salary) OVER (PARTITION BY department) AS dept_min_salary
FROM employees



/*
11) ORDER BY inside Window Function
*/

-- Running average salary

SELECT emp_id, emp_name, salary,
AVG(salary) OVER (ORDER BY emp_id) AS running_avg
FROM employees



/*
12) Combination Example
*/

-- Compare salary with department average

SELECT emp_id, emp_name, department, salary,
AVG(salary) OVER (PARTITION BY department) AS dept_avg,
salary - AVG(salary) OVER (PARTITION BY department) AS diff_from_avg
FROM employees