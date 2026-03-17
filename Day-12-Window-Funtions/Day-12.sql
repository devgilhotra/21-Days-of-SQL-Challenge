/*
SQL Window Functions - Window function performs calculations across a set of rows related to the current row

Types of Window Functions --
1) Ranking Functions
2) Aggregate Window Functions
3) Value Functions

Window Functions Syntax --
FUNCTION_NAME() OVER (
    PARTITION BY column
    ORDER BY column
)
*/

USE MyDatabase


/*
1) Ranking Functions:
ROW_NUMBER, RANK, DENSE_RANK
*/

-- ROW_NUMBER = assigns a unique number to each row

SELECT emp_id, emp_name, department, salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees


-- RANK = assigns rank, same rank for ties, skips next rank

SELECT emp_id, emp_name, department, salary,
RANK() OVER (ORDER BY salary DESC) AS rank_num
FROM employees


-- DENSE_RANK = assigns rank, same rank for ties, no skipping

SELECT emp_id, emp_name, department, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_num
FROM employees



/*
PARTITION BY = divides data into groups
*/

-- Rank employees within each department

SELECT emp_id, emp_name, department, salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_row_num
FROM employees



/*
2) Aggregate Window Functions:
SUM, AVG, COUNT
*/

-- Running total of salary

SELECT emp_id, emp_name, salary,
SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM employees


-- Average salary by department

SELECT emp_id, emp_name, department, salary,
AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employees


-- Count employees in each department

SELECT emp_id, emp_name, department,
COUNT(*) OVER (PARTITION BY department) AS dept_count
FROM employees



/*
3) Value Functions:
LAG, LEAD
*/

-- LAG = get previous row value

SELECT emp_id, emp_name, salary,
LAG(salary) OVER (ORDER BY emp_id) AS prev_salary
FROM employees


-- LEAD = get next row value

SELECT emp_id, emp_name, salary,
LEAD(salary) OVER (ORDER BY emp_id) AS next_salary
FROM employees



/*
Extra:
*/

-- Highest salary in each department

SELECT emp_id, emp_name, department, salary,
MAX(salary) OVER (PARTITION BY department) AS max_salary
FROM employees


-- Lowest salary in each department

SELECT emp_id, emp_name, department, salary,
MIN(salary) OVER (PARTITION BY department) AS min_salary
FROM employees