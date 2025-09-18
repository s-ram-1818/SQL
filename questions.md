# SQL Joins Interview Guide

This guide covers SQL joins interview questions, structured answers, examples, and tips for interviews.

---

## 1. Difference between INNER JOIN and LEFT JOIN

**Definition:**

* **INNER JOIN**: Returns only rows with matching values in both tables.
* **LEFT JOIN**: Returns all rows from the left table and matched rows from the right. If no match, right table columns are NULL.

**Example:**

```sql
-- INNER JOIN
SELECT e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

-- LEFT JOIN
SELECT e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;
```

**Key Difference:**

* INNER JOIN = intersection
* LEFT JOIN = all left rows + matches (NULL for non-matches)

**Tip:** Use a Venn diagram mentally to explain in interviews.

---

## 2. SELF JOIN

**Definition:**
A self join is a join where a table is joined with itself. Useful for comparing rows within the same table.

**Example:**

```sql
SELECT e1.emp_name AS Employee, e2.emp_name AS Manager
FROM Employees e1
JOIN Employees e2
ON e1.manager_id = e2.emp_id;
```

**Use Case:**

* Finding employees and their managers stored in the same table.
* Comparing rows within the same table.

**Tip:** Always use aliases to differentiate the table references.

---

## 3. Difference between UNION and JOIN

**Definition:**

* **JOIN**: Combines columns from tables based on related columns (horizontal merge).
* **UNION**: Combines results of SELECT queries into a single set (vertical stack). Columns must match in number and type.

**Example:**

```sql
-- JOIN
SELECT e.emp_name, d.dept_name
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id;

-- UNION
SELECT emp_name FROM Employees
UNION
SELECT manager_name FROM Managers;
```

**Tip:** Mention horizontal vs vertical combination in interviews.

---

## 4. CROSS JOIN

**Definition:**
Returns the Cartesian product of two tables. Every row from the first table pairs with all rows from the second table.

**Example:**

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
CROSS JOIN Departments d;
```

**Result:**

| emp\_name | dept\_name |
| --------- | ---------- |
| Ram       | HR         |
| Ram       | IT         |
| Suresh    | HR         |
| Suresh    | IT         |

**Tip:** Useful for generating all combinations.

---

## 5. FULL OUTER JOIN

**Definition:**
Returns all rows from both tables. Matches are shown; non-matches have NULL.

**SQL Example:**

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
FULL OUTER JOIN Departments d
ON e.dept_id = d.dept_id;
```

**Result:**

| emp\_name | dept\_name |
| --------- | ---------- |
| Ram       | HR         |
| Suresh    | NULL       |
| NULL      | IT         |

**MySQL Note:** Use UNION of LEFT JOIN and RIGHT JOIN if FULL OUTER JOIN is not supported:

```sql
SELECT e.emp_name, d.dept_name FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name FROM Employees e
RIGHT JOIN Departments d ON e.dept_id = d.dept_id;
```

---

## 6. Find employees without a department

**Simple Approach:**

```sql
SELECT emp_name, dept_id
FROM Employees
WHERE dept_id IS NULL;
```

**Better Approach (handles invalid dept\_id):**

```sql
SELECT e.emp_name, e.dept_id
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
```

**Tip:** Use LEFT JOIN + NULL check to cover both NULL and invalid foreign keys.

---

## 7. LEFT JOIN with Customers and Orders

**Query:**

```sql
SELECT c.customer_name, o.order_id, o.amount
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;
```

**Result:**

| customer\_name | order\_id | amount |
| -------------- | --------- | ------ |
| Ram            | 1         | 500    |
| Suresh         | 2         | 300    |
| Amit           | NULL      | NULL   |

**Tip:** Explain why LEFT JOIN is used to include customers without orders.

---

## 8. NATURAL JOIN vs USING

**Definition:**

* **NATURAL JOIN:** Automatically joins tables using all columns with the same name.
* **USING:** Joins tables on explicitly specified column(s).

**Example:**

```sql
-- NATURAL JOIN
SELECT emp_name, dept_name
FROM Employees
NATURAL JOIN Departments;

-- USING
SELECT emp_name, dept_name
FROM Employees
JOIN Departments USING (dept_id);
```

**Output:**

| emp\_name | dept\_name |
| --------- | ---------- |
| Ram       | HR         |
| Suresh    | IT         |

---

# Tips for SQL Join Interviews

* Always explain **why** you chose a specific join.
* Give examples or mental diagrams if asked.
* Use **COALESCE** with LEFT JOIN + aggregates.
* Be careful with **NULL** comparisons (`IS NULL` vs `=`).
* Prefer explicit joins (`USING` or `ON`) over NATURAL JOIN in production.
* Show awareness of database-specific differences (like MySQL lacking FULL OUTER JOIN).
