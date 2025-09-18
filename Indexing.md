
# SQL Indexing - Interview Ready Notes

## 1. Definition
An **index in SQL** is a **database object** that improves the **speed of data retrieval** operations on a table.  
It works like a **book index**, allowing the database to quickly locate rows **without scanning the entire table**.

---

## 2. Why Indexing is Used
- To **speed up SELECT queries**.
- Reduce **disk I/O operations** by finding data efficiently.
- Improve performance of queries with **WHERE**, **JOIN**, **GROUP BY**, and **ORDER BY**.
- Especially useful for **large datasets**.

⚠️ **Trade-off:**  
Indexes **slow down write operations** (`INSERT`, `UPDATE`, `DELETE`) because they must also update the index data.

---

## 3. How Indexing Works
- **Without an index:** Database performs a **Full Table Scan (O(n))**, checking each row.
- **With an index:** Database uses a **B-tree** or **Hash** structure to **directly locate the data (O(log n))**.

**Analogy:** Like using a **book index** to jump to a topic instead of reading every page.

---

## 4. Syntax
```sql
-- Create a simple index
CREATE INDEX index_name
ON table_name(column_name);

-- Create a unique index (no duplicate values allowed)
CREATE UNIQUE INDEX index_name
ON table_name(column_name);

-- Drop an index
DROP INDEX index_name;
```

---

## 5. Example
### Table: Employees
| EmpID | Name    | Department | Salary |
|-------|---------|------------|--------|
| 1     | Ram     | IT         | 50000  |
| 2     | Priya   | HR         | 60000  |
| 3     | Arjun   | IT         | 70000  |
| 4     | Sneha   | Finance    | 55000  |

### Query without Index
```sql
SELECT * FROM Employees WHERE Department = 'IT';
```
- **Full Table Scan:** Checks every row → **Slow for large data**.

### Create Index
```sql
CREATE INDEX idx_department
ON Employees(Department);
```

### Query with Index
```sql
SELECT * FROM Employees WHERE Department = 'IT';
```
- Uses **index** to quickly find rows where Department = 'IT' → **Much faster**.

---

## 6. Clustered vs Non-Clustered Index

### Clustered Index
> A **Clustered Index** **physically sorts** and stores the rows of a table **based on the indexed column**.

- Only **one clustered index per table**.
- Automatically created on **Primary Key** by default.

**Example:**
```sql
CREATE CLUSTERED INDEX idx_empid
ON Employees(EmpID);
```

### Non-Clustered Index
> A **Non-Clustered Index** **does NOT change the physical order** of the table.  
> It creates a **separate index structure** that **stores pointers (row locators)** to the actual table rows.

- A table can have **multiple non-clustered indexes**.

**Example:**
```sql
CREATE NONCLUSTERED INDEX idx_department
ON Employees(Department);
```

---

## 7. Key Differences

| Aspect | Clustered Index | Non-Clustered Index |
|--------|----------------|----------------------|
| **Physical Storage** | Rearranges table data to match index | Does not rearrange table data, separate structure |
| **Number per Table** | Only **1** | **Multiple allowed** |
| **Performance** | Faster for **range queries** | Slightly slower, needs extra lookup |
| **Storage Space** | No extra space needed | Requires additional storage |
| **Default Creation** | Created on **Primary Key** automatically | Must be created manually |
| **Use Case** | Searching unique or primary columns | Filtering/searching on non-unique columns |

---

## 8. Analogy
- **Clustered Index:** Like a **dictionary**, words are **physically arranged** alphabetically.
- **Non-Clustered Index:** Like a **book index**, which points to the **page numbers** where the word appears.

---

## 9. Summary Table

| Topic | Clustered Index | Non-Clustered Index |
|-------|----------------|----------------------|
| **Definition** | Sorts table data physically | Creates separate structure with pointers |
| **Count per Table** | 1 | Multiple |
| **Default On** | Primary Key | None |
| **Use Case** | Range queries, sorting | Filtering, searching non-unique columns |
| **Storage Space** | No extra space | Needs extra space |

---

## 10. Quick Interview Answer
> A **Clustered Index** physically **orders the table data**, making searches very fast, especially for **range queries**.  
> A **Non-Clustered Index** is a **separate structure** that contains pointers to the actual data, allowing multiple indexes per table.  
> Example: Primary Key automatically gets a clustered index, while you might add a non-clustered index to columns like `Department` for fast lookups.
