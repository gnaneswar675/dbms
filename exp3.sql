-- Exercise – 3: Queries using Aggregate functions, GROUP BY, HAVING, and Views

-- Create table: product
CREATE TABLE product (
    pno INT PRIMARY KEY,
    pname VARCHAR(30),
    price FLOAT,
    quantity INT
);

-- Insert data into product
INSERT INTO product VALUES (1, 'dairy milk', 60, 2);
INSERT INTO product VALUES (2, 'good day', 25, 4);
INSERT INTO product VALUES (3, 'boost', 10, 6);
INSERT INTO product VALUES (4, 'maggi', 5, 10);
INSERT INTO product VALUES (5, 'book', 20, 20);

-- View all records from product
SELECT * FROM product;

-- COUNT function
SELECT COUNT(price) FROM product;       -- Output: 5
SELECT COUNT(quantity) FROM product;    -- Output: 5

-- SUM function
SELECT SUM(price) FROM product;         -- Output: 120
SELECT SUM(quantity) FROM product;      -- Output: 42

-- AVG function
SELECT AVG(price) FROM product;         -- Output: 24
SELECT AVG(quantity) FROM product;      -- Output: 8.4

-- MAX function
SELECT MAX(price) FROM product;         -- Output: 60
SELECT MAX(quantity) FROM product;      -- Output: 20

-- MIN function
SELECT MIN(price) FROM product;         -- Output: 5
SELECT MIN(quantity) FROM product;      -- Output: 2


-- GROUP BY clause
-- Create table: employ
CREATE TABLE employ (
    sid INT,
    name VARCHAR(20),
    dept VARCHAR(10),
    sal FLOAT
);

-- Insert data into employ
INSERT INTO employ VALUES (1, 'ayisha', 'ece', 6000);
INSERT INTO employ VALUES (2, 'sindhu', 'it', 50000);
INSERT INTO employ VALUES (3, 'sai', 'it', 80000);
INSERT INTO employ VALUES (4, 'lalli', 'ece', 8000);

-- View all records from employ
SELECT * FROM employ;

-- Group by department with total salary
SELECT dept, SUM(sal) FROM employ
GROUP BY dept;

-- HAVING clause: departments with total salary > 25000
SELECT dept, SUM(sal) FROM employ
GROUP BY dept
HAVING SUM(sal) > 25000;
