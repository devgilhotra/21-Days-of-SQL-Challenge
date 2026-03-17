/*
SQL Window Value Functions - These functions return values from other rows 
relative to the current row.

Types of Value Functions:
1) LAG()
2) LEAD()
3) FIRST_VALUE()
4) LAST_VALUE()

Syntax:
FUNCTION_NAME(column) OVER (
    PARTITION BY column
    ORDER BY column
)
*/

USE MyDatabase


/*
1) LAG()
Returns value from previous row
*/

-- Get previous salary

SELECT emp_id, emp_name, salary,
LAG(salary) OVER (ORDER BY emp_id) AS prev_salary
FROM employees



/*
2) LEAD()
Returns value from next row
*/

-- Get next salary

SELECT emp_id, emp_name, salary,
LEAD(salary) OVER (ORDER BY emp_id) AS next_salary
FROM employees



/*
3) LAG() with PARTITION BY
*/

-- Previous salary within each department

SELECT emp_id, emp_name, department, salary,
LAG(salary) OVER (PARTITION BY department ORDER BY salary) AS prev_dept_salary
FROM employees



/*
4) LEAD() with PARTITION BY
*/

-- Next salary within each department

SELECT emp_id, emp_name, department, salary,
LEAD(salary) OVER (PARTITION BY department ORDER BY salary) AS next_dept_salary
FROM employees



/*
5) FIRST_VALUE()
Returns first value in the window
*/

-- Lowest salary in each department

SELECT emp_id, emp_name, department, salary,
FIRST_VALUE(salary) OVER (PARTITION BY department ORDER BY salary) AS lowest_salary
FROM employees



/*
6) LAST_VALUE()
Returns last value in the window
NOTE: Requires proper frame clause
*/

-- Highest salary in each department

SELECT emp_id, emp_name, department, salary,
LAST_VALUE(salary) OVER (
    PARTITION BY department 
    ORDER BY salary 
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS highest_salary
FROM employees



/*
7) Practical Example
*/

-- Salary difference from previous employee

SELECT emp_id, emp_name, salary,
salary - LAG(salary) OVER (ORDER BY emp_id) AS salary_diff
FROM employees



/*
8) Combination Example
*/

-- Compare current salary with first and last salary in department

SELECT emp_id, emp_name, department, salary,
FIRST_VALUE(salary) OVER (PARTITION BY department ORDER BY salary) AS min_salary,
LAST_VALUE(salary) OVER (
    PARTITION BY department 
    ORDER BY salary 
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS max_salary
FROM employees