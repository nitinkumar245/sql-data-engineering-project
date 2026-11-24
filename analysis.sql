USE sql_final_project;


-- =========================
-- BASIC ANALYSIS
-- =========================

SELECT emp_name, salary
FROM employees;

SELECT emp_name, salary
FROM employees
WHERE salary > 70000;

SELECT emp_name, city
FROM employees
WHERE city = "Delhi";

SELECT emp_name, salary
FROM employees
ORDER BY salary DESC;

SELECT emp_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

SELECT AVG(salary) AS average_salary
FROM employees;

SELECT
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary
FROM employees;

SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id;

SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id;

SELECT 
    DISTINCT dept_id
FROM employees;


-- =========================
-- DEPARTMENT ANALYSIS
-- =========================

SELECT
    d.dept_name,
    e.dept_id,
    COUNT(e.emp_id) AS employee_count,
    AVG(e.salary) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name, d.dept_id;


-- =========================
-- JOIN ANALYSIS
-- =========================

SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id;


SELECT
    d.dept_name,
    AVG(e.salary) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING average_salary > 70000;


SELECT
    e.emp_name,
    d.dept_name,
    d.dept_id,
    e.salary
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.dept_id = e.dept_id
);


SELECT
    e.emp_name,
    e.salary,
    d.dept_name
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
);


SELECT
    e.emp_name,
    d.dept_name,
    e.city
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.city = "Delhi";


SELECT
    d.dept_name,
    MAX(e.salary) AS max_salary
FROM departments d
JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;


SELECT
    d.dept_name,
    MIN(e.salary) AS min_salary
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;


SELECT
    d.dept_name,
    COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING employee_count > 1;


SELECT
    d.dept_name,
    e.emp_name,
    e.salary
FROM departments d
JOIN employees e
    ON d.dept_id = e.dept_id
ORDER BY e.salary DESC;


SELECT
    d.dept_name,
    SUM(e.salary) AS total_expense
FROM departments d
JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;


SELECT
    d.dept_name,
    SUM(e.salary) AS total_expense
FROM departments d
JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY total_expense DESC
LIMIT 1;


-- =========================
-- PROJECT ANALYSIS
-- =========================

SELECT
    e.emp_name,
    p.project_name
FROM employees e
JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
JOIN projects p
    ON ep.project_id = p.project_id;


SELECT
    p.project_name,
    COUNT(ep.emp_id) AS employee_count
FROM projects p
LEFT JOIN employee_projects ep
    ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name;


SELECT
    p.project_name,
    p.budget,
    COUNT(ep.emp_id) AS employee_count
FROM projects p
LEFT JOIN employee_projects ep
    ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name, p.budget;


SELECT
    e.emp_name,
    COUNT(ep.project_id) AS project_count
FROM employees e
LEFT JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING project_count >= 2;


SELECT
    e.emp_name
FROM employees e
LEFT JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
WHERE ep.project_id IS NULL;


SELECT
    d.dept_name,
    e.emp_name,
    p.project_name
FROM departments d
JOIN employees e
    ON d.dept_id = e.dept_id
JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
JOIN projects p
    ON ep.project_id = p.project_id
ORDER BY d.dept_name, e.emp_name;


-- =========================
-- SUBQUERIES
-- =========================

SELECT
    emp_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


SELECT
    e.emp_name,
    e.dept_id,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e.dept_id = e2.dept_id
);


SELECT
    emp_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


SELECT
    emp_name,
    dept_id,
    salary
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM employees
    GROUP BY dept_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);


SELECT
    e.emp_name
FROM employees e
WHERE e.emp_id IN (
    SELECT ep.emp_id
    FROM employee_projects ep
    JOIN projects p
        ON ep.project_id = p.project_id
    WHERE p.project_name = "Data Warehouse"
);


-- =========================
-- EXISTS
-- =========================

SELECT
    e.emp_name
FROM employees e
WHERE EXISTS (
    SELECT *
    FROM employee_projects ep
    WHERE ep.emp_id = e.emp_id
);


SELECT
    e.emp_name
FROM employees e
WHERE NOT EXISTS (
    SELECT *
    FROM employee_projects ep
    WHERE ep.emp_id = e.emp_id
);


-- =========================
-- CTE
-- =========================

WITH dept_salary AS (
    SELECT
        dept_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT
    d.dept_name,
    ds.avg_salary
FROM dept_salary ds
JOIN departments d
    ON ds.dept_id = d.dept_id
WHERE ds.avg_salary > 65000;


WITH dept_count AS (
    SELECT
        dept_id,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY dept_id
)
SELECT
    d.dept_name,
    dc.employee_count
FROM dept_count dc
JOIN departments d
    ON dc.dept_id = d.dept_id;


WITH dept_salary AS (
    SELECT
        dept_id,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY dept_id
)
SELECT
    d.dept_name,
    ds.total_salary
FROM dept_salary ds
JOIN departments d
    ON ds.dept_id = d.dept_id
ORDER BY ds.total_salary DESC;


-- =========================
-- WINDOW FUNCTIONS
-- =========================

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


SELECT
    emp_name,
    dept_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;


SELECT
    emp_name,
    dept_id,
    salary,
    RANK() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


SELECT
    emp_name,
    dept_id,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


WITH ranked_employees AS (
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees
)
SELECT
    emp_name,
    salary,
    dept_id
FROM ranked_employees
WHERE dept_rank = 1;


SELECT
    emp_name,
    salary,
    LAG(salary) OVER (
        ORDER BY salary DESC
    ) AS previous_salary
FROM employees;


SELECT
    emp_name,
    salary,
    LAG(salary) OVER (
        ORDER BY salary DESC
    ) AS previous_salary,
    salary -
    LAG(salary) OVER (
        ORDER BY salary DESC
    ) AS salary_difference
FROM employees;


SELECT
    emp_name,
    salary,
    dept_id,
    LAG(salary) OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS previous_salary
FROM employees;


SELECT
    emp_name,
    salary,
    dept_id,
    LEAD(salary) OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS next_salary
FROM employees;


SELECT
    e.emp_name,
    d.dept_name,
    e.salary,
    RANK() OVER (
        PARTITION BY e.dept_id
        ORDER BY e.salary DESC
    ) AS salary_rank,
    LAG(e.salary) OVER (
        PARTITION BY e.dept_id
        ORDER BY e.salary DESC
    ) AS previous_salary
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id;


-- =========================
-- FINAL ANALYTICAL QUERY
-- =========================

SELECT
    d.dept_name,
    e.emp_name,
    p.project_name,
    e.salary,
    RANK() OVER (
        PARTITION BY e.dept_id
        ORDER BY e.salary DESC
    ) AS dept_salary_rank
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
JOIN projects p
    ON ep.project_id = p.project_id
ORDER BY d.dept_name, dept_salary_rank;