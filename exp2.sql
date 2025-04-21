# Experiment No. 2 – SQL Queries using ANY, ALL, IN, EXISTS, NOT EXISTS, UNION, INTERSECT, Constraints

## 1. Table Creation
```sql
CREATE TABLE Students (
    RollNumber INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Marks INT CHECK (Marks >= 0),
    Rank INT UNIQUE CHECK (Rank > 0)
);
```

## 2. Data Insertion
```sql
INSERT ALL
INTO Students (RollNumber, StudentName, Marks, Rank) VALUES (1, 'Alice', 450, 1)
INTO Students (RollNumber, StudentName, Marks, Rank) VALUES (2, 'Bob', 420, 2)
INTO Students (RollNumber, StudentName, Marks, Rank) VALUES (3, 'Charlie', 410, 3)
INTO Students (RollNumber, StudentName, Marks, Rank) VALUES (4, 'David', 400, 4)
INTO Students (RollNumber, StudentName, Marks, Rank) VALUES (5, 'Eve', 390, 5)
SELECT 1 FROM DUAL;
```

## 3. Output Table After Insertion
| RollNumber | StudentName | Marks | Rank |
|------------|--------------|--------|------|
| 1          | Alice        | 450    | 1    |
| 2          | Bob          | 420    | 2    |
| 3          | Charlie      | 410    | 3    |
| 4          | David        | 400    | 4    |
| 5          | Eve          | 390    | 5    |

---

## 4. Student with 4th Rank
```sql
SELECT RollNumber, StudentName
FROM Students
WHERE Rank = 4;
```
**Output:**
| RollNumber | StudentName |
|------------|-------------|
| 4          | David       |

---

## 5. `ANY` Clause
```sql
SELECT RollNumber, StudentName
FROM Students
WHERE Rank > ANY (
    SELECT Rank FROM Students WHERE Rank <= 4
);
```
**Output:**
| RollNumber | StudentName |
|------------|-------------|
| 2          | Bob         |
| 3          | Charlie     |
| 4          | David       |
| 5          | Eve         |

---

## 6. `ALL` Clause
```sql
SELECT RollNumber, StudentName
FROM Students
WHERE Marks > ALL (
    SELECT Marks FROM Students WHERE Rank > 3
);
```
**Output:**
| RollNumber | StudentName |
|------------|-------------|
| 1          | Alice       |
| 2          | Bob         |
| 3          | Charlie     |

---

## 7. `IN` Clause
```sql
SELECT RollNumber, StudentName
FROM Students
WHERE Rank IN (1, 2, 3);
```
**Output:**
| RollNumber | StudentName |
|------------|-------------|
| 1          | Alice       |
| 2          | Bob         |
| 3          | Charlie     |

---

## 8. `EXISTS` Clause
```sql
SELECT RollNumber, StudentName
FROM Students s
WHERE EXISTS (
    SELECT 1 FROM Students WHERE Rank > 3
);
```
**Output:**
_All students (subquery returns TRUE)_
| RollNumber | StudentName |
|------------|-------------|
| 1          | Alice       |
| 2          | Bob         |
| 3          | Charlie     |
| 4          | David       |
| 5          | Eve         |

---

## 9. `NOT EXISTS` Clause
```sql
SELECT RollNumber, StudentName
FROM Students s
WHERE NOT EXISTS (
    SELECT 1 FROM Students s2
    WHERE s.Rank = s2.Rank AND s.RollNumber != s2.RollNumber
);
```
**Output:**
_All students (ranks are unique)_
| RollNumber | StudentName |
|------------|-------------|
| 1          | Alice       |
| 2          | Bob         |
| 3          | Charlie     |
| 4          | David       |
| 5          | Eve         |

---

## 10. `UNION` Clause
```sql
SELECT RollNumber, StudentName
FROM Students
WHERE Rank <= 3
UNION
SELECT RollNumber, StudentName
FROM Students
WHERE Marks <= 400;
```
**Output:**
| RollNumber | StudentName |
|------------|-------------|
| 1          | Alice       |
| 2          | Bob         |
| 3          | Charlie     |
| 4          | David       |
| 5          | Eve         |

---

## 11. `INTERSECT` Clause
```sql
SELECT RollNumber, StudentName
FROM Students
WHERE Rank <= 3
INTERSECT
SELECT RollNumber, StudentName
FROM Students
WHERE Marks > 400;
```
**Output:**
| RollNumber | StudentName |
|------------|-------------|
| 1          | Alice       |
| 2          | Bob         |
| 3          | Charlie     |
