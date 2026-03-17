/*
SQL Window Ranking Functions - These functions assign ranks or row numbers 
to rows within a result set.

Types of Ranking Functions:
1) ROW_NUMBER()
2) RANK()
3) DENSE_RANK()
4) NTILE()

Syntax:
FUNCTION_NAME() OVER (
    PARTITION BY column
    ORDER BY column
)
*/

USE MyDatabase


/*
1) ROW_NUMBER()
Assigns a unique number to each row
*/

-- Rank employees by salary (no duplicates)

SELECT emp_id, emp_name, department, salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees



/*
2) RANK()
Same rank for ties, skips next rank
*/

-- Rank employees by salary

SELECT emp_id, emp_name, department, salary,
RANK() OVER (ORDER BY salary DESC) AS rank_num
FROM employees



/*
3) DENSE_RANK()
Same rank for ties, no gaps in ranking
*/

-- Rank employees by salary

SELECT emp_id, emp_name, department, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_num
FROM employees



/*
Difference between RANK and DENSE_RANK:

Example:
Salary: 50000, 50000, 40000

RANK       → 1, 1, 3
DENSE_RANK → 1, 1, 2
*/



/*
4) PARTITION BY with Ranking
*/

-- Rank employees within each department

SELECT emp_id, emp_name, department, salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_row_num
FROM employees



-- Department-wise rank

SELECT emp_id, emp_name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees



/*
5) NTILE()
Divides rows into equal groups (buckets)
*/

-- Divide employees into 3 salary groups

SELECT emp_id, emp_name, salary,
NTILE(3) OVER (ORDER BY salary DESC) AS salary_group
FROM employees



/*
6) Practical Example
*/

-- Top 2 highest paid employees in each department

SELECT *
FROM (
    SELECT emp_id, emp_name, department, salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 2



/*
7) Combination Example
*/

-- Compare all ranking functions together

SELECT emp_id, emp_name, salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
RANK() OVER (ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_num
FROM employees