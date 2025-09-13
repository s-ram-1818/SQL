
````markdown
# SQL Joins – Interview Cheat Sheet

## Sample Tables

**Employees:**
```sql
emp_id | emp_name | dept_id
1      | Alice    | 101
2      | Bob      | 102
3      | Charlie  | 103
4      | David    | NULL
````

**Departments:**

```sql
dept_id | dept_name
101     | HR
102     | IT
104     | Finance
```

---

## 1. INNER JOIN

**Definition:** Returns only rows with matching values in both tables.

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;
```

**Output:**

```sql
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT
```

---

## 2. LEFT JOIN (LEFT OUTER JOIN)

**Definition:** Returns all rows from the left table + matching rows from right table; NULL if no match.

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;
```

**Output:**

```sql
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT
3      | Charlie  | NULL
4      | David    | NULL
```

---

## 3. RIGHT JOIN (RIGHT OUTER JOIN)

**Definition:** Returns all rows from the right table + matching rows from left table; NULL if no match.

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;
```

**Output:**

```sql
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT
NULL   | NULL     | Finance
```

---

## 4. FULL OUTER JOIN

**Definition:** Returns all rows when there is a match in either left or right table. (Use UNION in MySQL)

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d ON e.dept_id = d.dept_id;
```

**Output:**

```sql
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT
3      | Charlie  | NULL
4      | David    | NULL
NULL   | NULL     | Finance
```

---

## 5. CROSS JOIN

**Definition:** Returns Cartesian product of two tables (all combinations).

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
CROSS JOIN Departments d;
```

**Output (partial):**

```sql
emp_name | dept_name
Alice    | HR
Alice    | IT
Alice    | Finance
Bob      | HR
Bob      | IT
Bob      | Finance
Charlie  | HR
Charlie  | IT
Charlie  | Finance
David    | HR
David    | IT
David    | Finance
```

---

## 6. SELF JOIN

**Definition:** Joins a table with itself, useful for hierarchical data (e.g., employees and their managers).

**Sample Employees Table with manager\_id:**

```sql
emp_id | emp_name  | manager_id
1      | Alice     | NULL
2      | Bob       | 1
3      | Charlie   | 1
4      | David     | 2
5      | Eva       | 2
```

**SQL Example: Find Employees and Their Managers**

```sql
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id = m.emp_id;
```

**Output:**

```sql
Employee | Manager
Alice    | NULL
Bob      | Alice
Charlie  | Alice
David    | Bob
Eva      | Bob
```

---

## 7. NATURAL JOIN

**Definition:** Automatically joins tables on columns with the same name.

```sql
SELECT *
FROM Employees
NATURAL JOIN Departments;
```

**Output:**

```sql
emp_id | emp_name | dept_id | dept_name
1      | Alice    | 101     | HR
2      | Bob      | 102     | IT
```

---

## 8. JOIN USING

**Definition:** Join tables using a specific column with same name.

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
JOIN Departments d
USING (dept_id);
```

**Output:**

```sql
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT
```

---

## Summary Table

| Join Type       | Description                                  |
| --------------- | -------------------------------------------- |
| INNER JOIN      | Only matching rows                           |
| LEFT JOIN       | All left + matching right                    |
| RIGHT JOIN      | All right + matching left                    |
| FULL OUTER JOIN | All rows from both sides                     |
| CROSS JOIN      | Cartesian product                            |
| SELF JOIN       | Join table with itself (hierarchical)        |
| NATURAL JOIN    | Join on columns with same name automatically |
| JOIN ... USING  | Join on specific column with same name       |

```

---



Do you want me to do that?
```
