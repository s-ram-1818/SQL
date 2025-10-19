

## 🔹 1. Add a new column
```sql
ALTER TABLE employees ADD age INT;
````

Add multiple columns:

```sql
ALTER TABLE employees ADD (department VARCHAR(50), salary DECIMAL(10,2));
```

---

## 🔹 2. Modify an existing column

Change data type or size:

```sql
ALTER TABLE employees MODIFY age SMALLINT;
```

For SQL Server / PostgreSQL:

```sql
ALTER TABLE employees ALTER COLUMN age TYPE SMALLINT;
```

---

## 🔹 3. Rename a column

MySQL:

```sql
ALTER TABLE employees CHANGE COLUMN name full_name VARCHAR(100);
```

SQL Server / PostgreSQL:

```sql
EXEC sp_rename 'employees.name', 'full_name', 'COLUMN';
```

---

## 🔹 4. Drop (delete) a column

```sql
ALTER TABLE employees DROP COLUMN department;
```

---

## 🔹 5. Rename a table

MySQL:

```sql
RENAME TABLE employees TO staff;
```

SQL Server:

```sql
EXEC sp_rename 'employees', 'staff';
```

PostgreSQL:

```sql
ALTER TABLE employees RENAME TO staff;
```

---

## 🔹 6. Add a primary key

```sql
ALTER TABLE employees ADD PRIMARY KEY (id);
```

---

## 🔹 7. Drop a primary key

```sql
ALTER TABLE employees DROP PRIMARY KEY;
```

---

## 🔹 8. Add a foreign key

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(id);
```

---

## 🔹 9. Drop a foreign key

MySQL:

```sql
ALTER TABLE orders DROP FOREIGN KEY fk_customer;
```

SQL Server / PostgreSQL:

```sql
ALTER TABLE orders DROP CONSTRAINT fk_customer;
```

---

## 🔹 10. Add a unique constraint

```sql
ALTER TABLE employees ADD CONSTRAINT unique_email UNIQUE (email);
```

---

## 🔹 11. Drop a unique constraint

```sql
ALTER TABLE employees DROP CONSTRAINT unique_email;
```

MySQL alternative:

```sql
ALTER TABLE employees DROP INDEX unique_email;
```

---

## 🔹 12. Add a check constraint

```sql
ALTER TABLE employees
ADD CONSTRAINT chk_salary CHECK (salary > 0);
```

---

## 🔹 13. Drop a check constraint

```sql
ALTER TABLE employees DROP CONSTRAINT chk_salary;
```

---

## 🔹 14. Add a default constraint

SQL Server:

```sql
ALTER TABLE employees
ADD CONSTRAINT df_country DEFAULT 'India' FOR country;
```

MySQL / PostgreSQL:

```sql
ALTER TABLE employees
ALTER COLUMN country SET DEFAULT 'India';
```

---

## 🔹 15. Drop a default constraint

SQL Server:

```sql
ALTER TABLE employees DROP CONSTRAINT df_country;
```

MySQL / PostgreSQL:

```sql
ALTER TABLE employees
ALTER COLUMN country DROP DEFAULT;
```

---

## 🔹 16. Set or drop column NOT NULL

Set NOT NULL:

```sql
ALTER TABLE employees MODIFY email VARCHAR(100) NOT NULL;
```

Drop NOT NULL:

```sql
ALTER TABLE employees MODIFY email VARCHAR(100) NULL;
```

---

## 🔹 17. Rename constraint

SQL Server:

```sql
EXEC sp_rename 'old_constraint_name', 'new_constraint_name', 'OBJECT';
```

PostgreSQL:

```sql
ALTER TABLE employees RENAME CONSTRAINT old_constraint_name TO new_constraint_name;
```

---

## 🔹 18. Change column position (MySQL only)

```sql
ALTER TABLE employees MODIFY salary DECIMAL(10,2) AFTER name;
```

---

## 🔹 19. Add or remove AUTO_INCREMENT

Add:

```sql
ALTER TABLE employees MODIFY id INT AUTO_INCREMENT;
```

Remove:

```sql
ALTER TABLE employees MODIFY id INT;
```

---

## 🔹 20. Combine multiple alterations in one query

```sql
ALTER TABLE employees
ADD phone VARCHAR(15),
MODIFY email VARCHAR(150) NOT NULL,
DROP COLUMN address;
```

---

✅ **Tip:** Always check table structure after altering:

```sql
DESCRIBE employees;
```

Or in SQL Server:

```sql
EXEC sp_columns employees;
```

