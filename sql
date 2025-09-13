SQL Joins Explained with Examples

Sample Tables:

Employees:
emp_id | emp_name | dept_id
1      | Alice    | 101
2      | Bob      | 102
3      | Charlie  | 103
4      | David    | NULL

Departments:
dept_id | dept_name
101     | HR
102     | IT
104     | Finance

1. INNER JOIN
Returns only rows that have matching values in both tables.

SQL:
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

Output:
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT

2. LEFT JOIN
Returns all rows from the left table, and matching rows from the right table. If no match, NULL is returned.

SQL:
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;

Output:
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT
3      | Charlie  | NULL
4      | David    | NULL

3. RIGHT JOIN
Returns all rows from the right table, and matching rows from the left table. If no match, NULL is returned.

SQL:
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;

Output:
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT
NULL   | NULL     | Finance

4. FULL OUTER JOIN
Returns all rows when there is a match in either left or right table. (Simulated using UNION in MySQL)

SQL:
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d ON e.dept_id = d.dept_id;

Output:
emp_id | emp_name | dept_name
1      | Alice    | HR
2      | Bob      | IT
3      | Charlie  | NULL
4      | David    | NULL
NULL   | NULL     | Finance

5. CROSS JOIN
Returns Cartesian product of both tables.

SQL:
SELECT e.emp_name, d.dept_name
FROM Employees e
CROSS JOIN Departments d;

Output:
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

6. SELF JOIN
Joins a table with itself. Example: finding employees in the same department.

SQL:
SELECT e1.emp_name AS Employee, e2.emp_name AS Colleague, e1.dept_id
FROM Employees e1
JOIN Employees e2
ON e1.dept_id = e2.dept_id
AND e1.emp_id <> e2.emp_id;

Output:
(No output here because only one employee per department in this dataset)

Summary of Joins:

Join Type        | Description
-----------------|--------------------------------------
INNER JOIN       | Only matching rows
LEFT JOIN        | All left + matching right
RIGHT JOIN       | All right + matching left
FULL OUTER JOIN  | All rows from both sides
CROSS JOIN       | Cartesian product
SELF JOIN        | Join table with itself
