USE sql_final_project;


-- =========================
-- COMMIT
-- =========================

START TRANSACTION;

INSERT INTO employee_projects
(emp_id, project_id, assigned_date)
VALUES
(102, 1, CURDATE());

COMMIT;

SELECT *
FROM employee_projects
WHERE emp_id = 102;


-- =========================
-- ROLLBACK
-- =========================

START TRANSACTION;

INSERT INTO employee_projects
(emp_id, project_id, assigned_date)
VALUES
(103, 1, CURDATE());

ROLLBACK;

SELECT *
FROM employee_projects
WHERE emp_id = 103
AND project_id = 1;


-- =========================
-- SAVEPOINT
-- =========================

START TRANSACTION;

INSERT INTO employee_projects
(emp_id, project_id, assigned_date)
VALUES
(104, 1, CURDATE());

SAVEPOINT before_second_assignment;

INSERT INTO employee_projects
(emp_id, project_id, assigned_date)
VALUES
(104, 2, CURDATE());

ROLLBACK TO before_second_assignment;

COMMIT;

SELECT *
FROM employee_projects
WHERE emp_id = 104;