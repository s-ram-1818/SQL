

## 🔹 1. PRIMARY KEY
- Ensures each row is **unique and not NULL**.  
- A table can have **only one primary key**.

```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);
````

**OR (using ALTER):**

```sql
ALTER TABLE students ADD PRIMARY KEY (id);
```

---

## 🔹 2. FOREIGN KEY

* Maintains **referential integrity** between two tables.
* Links a column to the **primary key of another table**.

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);
```

**OR (using ALTER):**

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id) REFERENCES students(id);
```

---

## 🔹 3. UNIQUE

* Ensures **all values in a column are unique**, but allows **one NULL** (depending on DBMS).

```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

**OR (using ALTER):**

```sql
ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);
```

---

## 🔹 4. NOT NULL

* Ensures a column **cannot have NULL values**.

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL
);
```

**OR (using ALTER):**

```sql
ALTER TABLE employees MODIFY emp_name VARCHAR(100) NOT NULL;
```

---

## 🔹 5. CHECK

* Ensures that **all values in a column satisfy a specific condition**.

```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    price DECIMAL(10,2),
    CHECK (price > 0)
);
```

**OR (using ALTER):**

```sql
ALTER TABLE products
ADD CONSTRAINT chk_price CHECK (price > 0);
```

---

## 🔹 6. DEFAULT

* Assigns a **default value** when no value is provided during insert.

```sql
CREATE TABLE customers (
    id INT PRIMARY KEY,
    country VARCHAR(50) DEFAULT 'India'
);
```

**OR (using ALTER):**

```sql
ALTER TABLE customers
ALTER COLUMN country SET DEFAULT 'India';
```

---

## 🔹 7. AUTO_INCREMENT (MySQL specific)

* Automatically **increments numeric primary key values**.

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
```

---

## 🔹 8. COMPOSITE KEY

* Combines **two or more columns** to create a unique identifier.

```sql
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);
```

---

## 🔹 9. NAMED CONSTRAINTS

You can name constraints for easier reference (especially when dropping them).

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    email VARCHAR(100),
    CONSTRAINT unique_email UNIQUE (email),
    CONSTRAINT chk_age CHECK (emp_id > 0)
);
```

---

## 🔹 10. DROP CONSTRAINTS

To remove an existing constraint:

```sql
ALTER TABLE employees DROP CONSTRAINT unique_email;
ALTER TABLE employees DROP CONSTRAINT chk_age;
```

For MySQL unique keys:

```sql
ALTER TABLE employees DROP INDEX unique_email;
```

---

## 🔹 11. SHOW CONSTRAINTS

Check constraints on a table:

MySQL:

```sql
SHOW CREATE TABLE employees;
```

SQL Server:

```sql
EXEC sp_helpconstraint 'employees';
```

PostgreSQL:

```sql
\d employees
```

---

## 🧭 Summary Table

| Constraint Type    | Ensures               | Allows NULL | Multiple per table? | Example                   |
| ------------------ | --------------------- | ----------- | ------------------- | ------------------------- |
| **PRIMARY KEY**    | Uniqueness + Not Null | ❌ No        | ❌ One               | `PRIMARY KEY(id)`         |
| **FOREIGN KEY**    | Referential integrity | ✅ Yes       | ✅ Yes               | `FOREIGN KEY(student_id)` |
| **UNIQUE**         | Uniqueness            | ✅ Yes (1)   | ✅ Yes               | `UNIQUE(email)`           |
| **NOT NULL**       | Non-empty values      | ❌ No        | ✅ Yes               | `NOT NULL`                |
| **CHECK**          | Condition validation  | ✅ Yes       | ✅ Yes               | `CHECK (age >= 18)`       |
| **DEFAULT**        | Default value         | ✅ Yes       | ✅ Yes               | `DEFAULT 'India'`         |
| **AUTO_INCREMENT** | Auto numbering        | ❌ No        | ✅ Yes               | `AUTO_INCREMENT`          |

---

✅ **Tip:** Always name your constraints — it makes dropping or modifying them much easier.

Example:

```sql
ALTER TABLE employees ADD CONSTRAINT chk_salary CHECK (salary > 1000);
ALTER TABLE employees DROP CONSTRAINT chk_salary;
```

