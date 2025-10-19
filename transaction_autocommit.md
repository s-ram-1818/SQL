
## 🔹 What is a Transaction?

A **Transaction** in SQL is a sequence of one or more SQL statements that are executed as a **single logical unit of work**.

- A transaction ensures **data consistency**, **accuracy**, and **integrity**.
- If **all operations succeed**, changes are **committed** (saved).
- If **any operation fails**, all changes are **rolled back** (undone).

---

## 🔹 ACID Properties of a Transaction

| Property | Description |
|-----------|--------------|
| **A – Atomicity** | Ensures all operations in a transaction complete successfully or none do. |
| **C – Consistency** | Ensures database remains in a valid state before and after the transaction. |
| **I – Isolation** | Ensures transactions occur independently without interference. |
| **D – Durability** | Once committed, data changes are permanent even in case of a failure. |

---

## 🔹 Transaction Control Commands (TCL)

| Command | Description |
|----------|--------------|
| **START TRANSACTION** / **BEGIN TRANSACTION** | Begins a new transaction. |
| **COMMIT** | Saves all changes made during the transaction. |
| **ROLLBACK** | Cancels all changes made during the transaction. |
| **SAVEPOINT** | Creates a point within a transaction to rollback to. |
| **RELEASE SAVEPOINT** | Deletes a savepoint. |
| **SET TRANSACTION** | Sets characteristics (e.g., isolation level). |

---

## 🔹 Example: Transaction in MySQL

```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 101;
UPDATE accounts SET balance = balance + 500 WHERE account_id = 102;

-- If both succeed
COMMIT;

-- If any fails
ROLLBACK;
````

✅ **Explanation:**

* If the first update succeeds but the second fails, `ROLLBACK` undoes the first update — ensuring **Atomicity**.

---

## 🔹 Example: Using SAVEPOINT

```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 101;
SAVEPOINT step1;

UPDATE accounts SET balance = balance + 500 WHERE account_id = 102;
ROLLBACK TO step1;  -- Undo second update only

COMMIT;  -- Commit remaining successful operations
```

---

## 🔹 Example: Transaction in SQL Server

```sql
BEGIN TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 101;
UPDATE accounts SET balance = balance + 500 WHERE account_id = 102;

IF @@ERROR <> 0
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;
```

---

## 🔹 Example: Transaction in PostgreSQL

```sql
BEGIN;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 101;
UPDATE accounts SET balance = balance + 500 WHERE account_id = 102;

COMMIT;
-- or
ROLLBACK;
```

---

## 🔹 AUTO COMMIT Mode

* By **default**, most databases (like MySQL) run in **Auto Commit mode**.
* This means every individual SQL statement is **committed automatically** after execution.

### ➤ Check Auto Commit Status (MySQL)

```sql
SELECT @@autocommit;
```

### ➤ Turn OFF Auto Commit

```sql
SET autocommit = 0;
```

### ➤ Turn ON Auto Commit

```sql
SET autocommit = 1;
```

---

## 🔹 Example: Auto Commit vs Manual Transaction

### ✅ Auto Commit (Default)

```sql
UPDATE employees SET salary = salary + 1000 WHERE emp_id = 1;
-- Changes are immediately saved (committed)
```

### ✅ Manual Transaction

```sql
SET autocommit = 0;

START TRANSACTION;
UPDATE employees SET salary = salary + 1000 WHERE emp_id = 1;
ROLLBACK; -- Undo changes
COMMIT;   -- Save changes
```

---

## 🔹 Transaction Isolation Levels

| Isolation Level      | Description                                  |
| -------------------- | -------------------------------------------- |
| **READ UNCOMMITTED** | Can read uncommitted (dirty) data.           |
| **READ COMMITTED**   | Only committed data is visible.              |
| **REPEATABLE READ**  | Prevents non-repeatable reads.               |
| **SERIALIZABLE**     | Strictest level; ensures complete isolation. |

### Example:

```sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
```

---

## 🧭 Summary

| Command                       | Purpose                 |
| ----------------------------- | ----------------------- |
| `START TRANSACTION` / `BEGIN` | Start a new transaction |
| `COMMIT`                      | Save all changes        |
| `ROLLBACK`                    | Undo all changes        |
| `SAVEPOINT`                   | Create rollback point   |
| `ROLLBACK TO SAVEPOINT`       | Rollback partially      |
| `SET autocommit = 0`          | Disable auto commit     |
| `SET autocommit = 1`          | Enable auto commit      |

---

✅ **Tip:**
Use transactions in scenarios like:

* Money transfer systems 💰
* Inventory updates 🏷️
* Multi-table modifications 🧩
  To ensure **data accuracy** and **consistency**.

```
]
