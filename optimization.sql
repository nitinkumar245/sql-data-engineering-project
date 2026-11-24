USE sql_final_project;


-- =========================
-- INDEXES
-- =========================

CREATE INDEX idx_employee_salary
ON employees(salary);

CREATE INDEX idx_employee_join_date
ON employees(join_date);

SHOW INDEX FROM employees;


CREATE INDEX idx_dept_salary
ON employees(dept_id, salary);




-- Composite index examples

SELECT *
FROM employees
WHERE dept_id = 10;


SELECT *
FROM employees
WHERE dept_id = 10
AND salary > 70000;


-- =========================
-- EXPLAIN
-- =========================

EXPLAIN
SELECT *
FROM employees
WHERE salary > 70000;


EXPLAIN
SELECT *
FROM employees
WHERE dept_id = 10
AND salary > 70000;


-- Function on indexed/date column

EXPLAIN
SELECT
    emp_name,
    salary
FROM employees
WHERE YEAR(join_date) = 2022;


-- Date range version

EXPLAIN
SELECT
    emp_name,
    salary
FROM employees
WHERE join_date >= "2022-01-01"
AND join_date < "2023-01-01";


-- =========================
-- JOIN + EXPLAIN
-- =========================

EXPLAIN
SELECT
    d.dept_name,
    AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY avg_salary DESC;