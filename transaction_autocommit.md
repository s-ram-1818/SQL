

## 🧩 What is Auto Commit?

In SQL (especially MySQL), **Auto Commit mode** determines whether each SQL statement is automatically committed after execution.

- When **Auto Commit = ON (default)** → Each statement is saved automatically.
- When **Auto Commit = OFF** → You must manually use `COMMIT` or `ROLLBACK` to save or undo changes.

---

## 🔹 Check Current Auto Commit Status

```sql
SELECT @@autocommit;
````

* Returns **1** → Auto Commit is **ON**
* Returns **0** → Auto Commit is **OFF**

---

## 🔹 Turn Auto Commit OFF

```sql
SET autocommit = 0;
```

➡️ From this point onward, **changes are not saved automatically**.
You must use `COMMIT` to save or `ROLLBACK` to undo.

---

## 🔹 Example 1 – Auto Commit OFF with COMMIT

```sql
-- Turn off auto commit
SET autocommit = 0;

-- Start a manual transaction
START TRANSACTION;

UPDATE employees SET salary = salary + 1000 WHERE emp_id = 1;

-- Changes are temporary (not saved yet)
COMMIT;  -- ✅ Permanently save the change
```

---

## 🔹 Example 2 – Auto Commit OFF with ROLLBACK

```sql
SET autocommit = 0;
START TRANSACTION;

UPDATE employees SET salary = salary + 1000 WHERE emp_id = 1;

-- If you realize a mistake
ROLLBACK;  -- ❌ Undo the above update
```

✅ **Result:** The salary change will not be applied — transaction is rolled back.

---

## 🔹 Example 3 – Without START TRANSACTION (still works)

Even without explicitly writing `START TRANSACTION`, if `autocommit = 0`,
SQL treats each query batch as part of an open transaction.

```sql
SET autocommit = 0;

UPDATE employees SET salary = salary + 500 WHERE emp_id = 2;

ROLLBACK;  -- Undo the update
```

---

## 🔹 Turn Auto Commit ON Again

After finishing manual transactions, you can re-enable auto commit.

```sql
SET autocommit = 1;
```

---

## 🧭 Summary Table

| Command                | Description                                    |
| ---------------------- | ---------------------------------------------- |
| `SET autocommit = 0;`  | Turns off auto commit (manual mode)            |
| `SET autocommit = 1;`  | Turns on auto commit (default)                 |
| `START TRANSACTION;`   | Begins a transaction explicitly                |
| `COMMIT;`              | Saves all changes permanently                  |
| `ROLLBACK;`            | Cancels all changes made after the last commit |
| `SELECT @@autocommit;` | Checks current auto commit status              |

---

## ✅ Use Case Example

```sql
SET autocommit = 0;
START TRANSACTION;

UPDATE accounts SET balance = balance - 1000 WHERE id = 1;
UPDATE accounts SET balance = balance + 1000 WHERE id = 2;

-- Suppose second query fails
ROLLBACK;  -- Undo both updates

-- If both succeed
COMMIT;
```

👉 Ensures money transfer is **all-or-nothing**, maintaining data integrity.

---

## 🔸 Quick Tip

When `autocommit` is off:

* You are in **manual transaction mode**.
* Always use `COMMIT` after successful operations.
* Always use `ROLLBACK` when something goes wrong.
