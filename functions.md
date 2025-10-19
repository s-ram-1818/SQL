

## 🧮 Function Categories

| Category | Description | Examples |
|-----------|--------------|-----------|
| **Aggregate Functions** | Perform calculations on a set of rows | `SUM()`, `AVG()`, `COUNT()` |
| **String Functions** | Work with text values | `CONCAT()`, `LENGTH()`, `LOWER()` |
| **Date & Time Functions** | Manipulate date/time values | `NOW()`, `DATE_ADD()`, `YEAR()` |
| **Numeric Functions** | Perform mathematical operations | `ROUND()`, `ABS()`, `POWER()` |
| **Conversion Functions** | Convert data types or formats | `CAST()`, `CONVERT()` |
| **System Functions** | Return system/user info | `USER()`, `DATABASE()` |

---

## 🔹 1. Aggregate Functions

### ➤ `COUNT()`
Counts number of rows.
```sql
SELECT COUNT(*) FROM employees;
SELECT COUNT(DISTINCT department) FROM employees;
````

### ➤ `SUM()`

Adds all numeric values.

```sql
SELECT SUM(salary) FROM employees;
```

### ➤ `AVG()`

Calculates average value.

```sql
SELECT AVG(salary) FROM employees;
```

### ➤ `MIN()` and `MAX()`

Returns smallest and largest value.

```sql
SELECT MIN(salary), MAX(salary) FROM employees;
```

---

## 🔹 2. String Functions

### ➤ `CONCAT()`

Joins two or more strings.

```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
```

### ➤ `LENGTH()` / `LEN()`

Returns length of string.

```sql
SELECT LENGTH(name) FROM employees; -- MySQL
SELECT LEN(name) FROM employees;     -- SQL Server
```

### ➤ `LOWER()` / `UPPER()`

Converts text to lowercase or uppercase.

```sql
SELECT LOWER(name), UPPER(name) FROM employees;
```

### ➤ `SUBSTRING()` / `SUBSTR()`

Extracts a portion of text.

```sql
SELECT SUBSTRING(name, 1, 3) FROM employees;
```

### ➤ `REPLACE()`

Replaces text inside a string.

```sql
SELECT REPLACE(name, 'a', '@') FROM employees;
```

### ➤ `TRIM()`, `LTRIM()`, `RTRIM()`

Removes spaces.

```sql
SELECT TRIM('   Ram   ');  -- Output: 'Ram'
```

---

## 🔹 3. Date and Time Functions

### ➤ `NOW()` / `CURRENT_TIMESTAMP`

Returns current date and time.

```sql
SELECT NOW();
```

### ➤ `CURDATE()` / `CURRENT_DATE`

Returns current date only.

```sql
SELECT CURDATE();
```

### ➤ `CURTIME()` / `CURRENT_TIME`

Returns current time only.

```sql
SELECT CURTIME();
```

### ➤ `YEAR()`, `MONTH()`, `DAY()`

Extract parts of a date.

```sql
SELECT YEAR(birth_date), MONTH(birth_date), DAY(birth_date) FROM employees;
```

### ➤ `DATEDIFF()`

Difference between two dates.

```sql
SELECT DATEDIFF('2025-12-31', '2025-01-01'); -- Output: 364
```

### ➤ `DATE_ADD()` / `DATE_SUB()`

Add or subtract time from a date.

```sql
SELECT DATE_ADD(NOW(), INTERVAL 7 DAY);
SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH);
```

---

## 🔹 4. Numeric Functions

### ➤ `ABS()`

Returns absolute (positive) value.

```sql
SELECT ABS(-15); -- Output: 15
```

### ➤ `ROUND()`

Rounds a number to given decimals.

```sql
SELECT ROUND(12.3456, 2); -- Output: 12.35
```

### ➤ `CEIL()` / `FLOOR()`

Ceil → next highest integer
Floor → next lowest integer

```sql
SELECT CEIL(4.2), FLOOR(4.8);
```

### ➤ `POWER()` / `SQRT()`

```sql
SELECT POWER(3, 2), SQRT(16);
```

### ➤ `MOD()` / `%`

Remainder of division.

```sql
SELECT MOD(10, 3);  -- Output: 1
```

---

## 🔹 5. Conversion Functions

### ➤ `CAST()`

Converts one data type to another.

```sql
SELECT CAST('2025-01-01' AS DATE);
SELECT CAST(123.45 AS INT);
```

### ➤ `CONVERT()`

SQL Server equivalent of CAST.

```sql
SELECT CONVERT(INT, 45.67);
```

---

## 🔹 6. Conditional Functions

### ➤ `IF()`

Returns one value if condition true, another if false.

```sql
SELECT name, IF(salary > 50000, 'High', 'Low') AS category FROM employees;
```

### ➤ `CASE`

Multiple condition handling.

```sql
SELECT name,
CASE
    WHEN salary > 80000 THEN 'Excellent'
    WHEN salary > 50000 THEN 'Good'
    ELSE 'Average'
END AS performance
FROM employees;
```

---

## 🔹 7. System Functions

### ➤ `USER()`, `DATABASE()`, `VERSION()`

```sql
SELECT USER();
SELECT DATABASE();
SELECT VERSION();
```

---

## 🔹 8. Grouping Functions

Use `GROUP BY` with aggregate functions.

```sql
SELECT department, AVG(salary)
FROM employees
GROUP BY department;
```

Filter grouped data:

```sql
SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;
```

---

## 🧭 Quick Summary Table

| Category        | Example Functions                                           |
| --------------- | ----------------------------------------------------------- |
| **Aggregate**   | `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`               |
| **String**      | `CONCAT()`, `LENGTH()`, `LOWER()`, `UPPER()`, `SUBSTRING()` |
| **Date/Time**   | `NOW()`, `CURDATE()`, `DATEDIFF()`, `DATE_ADD()`            |
| **Numeric**     | `ROUND()`, `ABS()`, `POWER()`, `MOD()`                      |
| **Conversion**  | `CAST()`, `CONVERT()`                                       |
| **Conditional** | `IF()`, `CASE`                                              |
| **System**      | `USER()`, `DATABASE()`, `VERSION()`                         |

---

✅ **Tip:**
Always use **`AS` alias** to make results more readable:

```sql
SELECT COUNT(*) AS total_employees FROM employees;


---

Would you like me to combine this **SQL Functions.md** with your previous **ALTER** and **CONSTRAINTS** markdowns into one full **SQL Notes.md** master file (with index and sections)?
```
