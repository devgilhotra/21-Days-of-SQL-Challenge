# Day 5 – SQL SET Operators

This file contains my **Day 4 practice from the 21 Days SQL Challenge**.
In this session, I learned how to combine results from multiple queries using **SQL SET Operators**.

SET operators are useful when working with **multiple tables containing similar structures**, allowing us to merge, compare, or filter datasets efficiently.

---

# Topics Covered

* UNION
* UNION ALL
* EXCEPT
* INTERSECT
* Rules for using SET Operators
* Real-world use cases in data analysis

---

# Rules for Using SET Operators

Before using SET operators, the following conditions must be satisfied:

1. The **number of columns** in each query must be the same.
2. The **data types** of corresponding columns must be compatible.
3. The **order of columns** must be identical in both queries.
4. Only **one ORDER BY clause** can be used and it must appear at the end.
5. Column names in the final result are taken from the **first query**.
6. SET operators can be used with queries that contain clauses like:

   * `WHERE`
   * `JOIN`
   * `GROUP BY`
   * `HAVING`
7. Even if the query runs without error, **incorrect column selection can produce incorrect results**.

---

# UNION

**Definition**

`UNION` combines results from multiple queries and **removes duplicate rows**.

### Example

Combine customer and employee names into one result set.

```sql
SELECT FirstName, LastName
FROM Sales.Customers

UNION

SELECT FirstName, LastName
FROM Sales.Employees
```

This returns **unique rows only**.

---

# UNION ALL

**Definition**

`UNION ALL` returns **all rows from both queries**, including duplicates.

### Example

```sql
SELECT FirstName, LastName
FROM Sales.Employees

UNION ALL

SELECT FirstName, LastName
FROM Sales.Customers
```

### Performance Note

* `UNION ALL` is generally **faster than UNION**
* Use it when **duplicate removal is not required**

---

# EXCEPT

**Definition**

`EXCEPT` returns rows from the **first query that do not exist in the second query**.

It automatically **removes duplicates**.

### Example

Find employees who are **not customers**.

```sql
SELECT FirstName, LastName
FROM Sales.Employees

EXCEPT

SELECT FirstName, LastName
FROM Sales.Customers
```

Important:
The **order of queries matters** when using EXCEPT.

---

# INTERSECT

**Definition**

`INTERSECT` returns **only the rows that exist in both queries**.

### Example

Find employees who are **also customers**.

```sql
SELECT FirstName, LastName
FROM Sales.Employees

INTERSECT

SELECT FirstName, LastName
FROM Sales.Customers
```

---

# Real World Use Case

SET operators are frequently used in **data analysis and reporting**.

Common scenarios include:

* Combining datasets from multiple tables
* Comparing datasets
* Detecting missing or inconsistent records
* Merging archived data with current data

---

# Practical Example – Combining Orders Tables

In some databases, **historical data is stored separately** to improve performance.

Example tables:

* `Sales.Orders`
* `Sales.OrdersArchive`

Using `UNION`, we can combine both tables into a **single report**.

```sql
SELECT 'Orders' AS SourceTable,
OrderId, ProductID, CustomerID, SalesPersonID,
OrderDate, ShipDate, OrderStatus,
ShipAddress, BillAddress, Quantity, Sales, CreationTime
FROM Sales.Orders

UNION

SELECT 'OrdersArchive' AS SourceTable,
OrderId, ProductID, CustomerID, SalesPersonID,
OrderDate, ShipDate, OrderStatus,
ShipAddress, BillAddress, Quantity, Sales, CreationTime
FROM Sales.OrdersArchive
ORDER BY OrderID
```

This allows analysts to view **current and historical orders together**.

---

# Additional Use Case – Data Validation

The `EXCEPT` operator can also be used for:

**Delta Detection**

Comparing two datasets to identify differences.

Example scenarios:

* Data completeness checks
* Comparing production vs backup database
* Identifying missing records

---

# Key Takeaways

| Operator  | Purpose                                              |
| --------- | ---------------------------------------------------- |
| UNION     | Combine results and remove duplicates                |
| UNION ALL | Combine results including duplicates                 |
| EXCEPT    | Return rows present in first query but not in second |
| INTERSECT | Return rows common in both queries                   |

---

# Repository Goal

This file is part of my **21 Days SQL Learning Challenge**, where I practice SQL daily and upload my progress to GitHub.

Objective:

* Build strong SQL fundamentals
* Practice real-world queries
* Create a public portfolio for recruiters

---
