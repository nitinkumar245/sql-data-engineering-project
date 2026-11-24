# SQL Employee & Project Analytics

A practical MySQL project built to demonstrate SQL skills through a realistic
Employee, Department, and Project management database.

The project covers SQL fundamentals, advanced SQL, business analysis,
transactions, indexing, query execution plans, and query optimization.

---

## 📌 Project Overview

This project simulates a company database where employees belong to
departments and can be assigned to multiple projects.

The database is designed to perform business-oriented analysis such as:

- Employee salary analysis
- Department-wise salary analysis
- Employee and project analysis
- Project allocation analysis
- Salary ranking
- Employee performance comparisons
- Transaction handling
- Query performance analysis

---

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench

---

## 🗄️ Database Structure

Database name:

sql_final_project


The project contains four main tables:

departments
     │
     │ 1 : N
     ▼
employees
     │
     │ 1 : N
     ▼
employee_projects
     │
     │ N : 1
     ▼
projects


📋 Tables
1. departments

Stores company department information.

Column	Type	Description
dept_id	INT	Primary key
dept_name	VARCHAR(50)	Department name
2. employees

Stores employee information.

Column	Type	Description
emp_id	INT	Primary key
emp_name	VARCHAR(100)	Employee name
dept_id	INT not null	Department reference
salary	DECIMAL(10,2)	Employee salary
join_date	DATE	Joining date
city	VARCHAR(50)	Employee city

dept_id is a foreign key referencing departments.

3. projects

Stores project information.

Column	Type	Description
project_id	INT	Primary key
project_name	VARCHAR(100)	Project name
budget	DECIMAL(12,2)	Project budget
4. employee_projects

A bridge table connecting employees and projects.

Column	Type	Description
emp_id	INT not null	Employee reference
project_id	INT not null	Project reference
assigned_date	DATE	Project assignment date

The table uses:

PRIMARY KEY (emp_id, project_id)

This allows an employee to work on multiple projects and a project to
have multiple employees.

🔑 SQL Concepts Demonstrated
SQL Fundamentals
SELECT
WHERE
DISTINCT
ORDER BY
LIMIT
Aggregate Functions
GROUP BY
HAVING
JOINs
INNER JOIN
LEFT JOIN
Multi-table JOIN
Employee → Department → Project analysis
Subqueries
Scalar subqueries
Nested queries
IN
EXISTS
NOT EXISTS
Correlated subqueries
CTEs
WITH
Single CTE
CTE with JOIN
CTE-based business analysis
Window Functions
ROW_NUMBER()
RANK()
DENSE_RANK()
PARTITION BY
LAG()
LEAD()
Transactions
START TRANSACTION
COMMIT
ROLLBACK
SAVEPOINT
ROLLBACK TO SAVEPOINT
ACID concepts
Query Optimization
CREATE INDEX
Composite Index
EXPLAIN
possible_keys
key
type
rows
filtered
Index-friendly query rewriting
📊 Business Analysis Performed

The project answers business questions such as:

What is the average company salary?
What is the average salary of each department?
Which employees earn above the company average?
Which employees earn above their department average?
Who is the highest-paid employee?
Which department has the highest salary expense?
How many employees work in each project?
Which employees work on multiple projects?
Which employees are not assigned to any project?
Who is the highest-paid employee in each department?
How does an employee's salary compare with the previous employee?
How are employees ranked within their departments?


⚡ Transactions  -- these are for just demonstration script.

Transactions were implemented to demonstrate safe modification of project
assignments.

Examples include:

START TRANSACTION;

INSERT INTO employee_projects
(emp_id, project_id, assigned_date)
VALUES
(102, 1, CURDATE());

COMMIT;

Rollback example:

START TRANSACTION;

INSERT INTO employee_projects
(emp_id, project_id, assigned_date)
VALUES
(103, 1, CURDATE());

ROLLBACK;

Savepoint example:

START TRANSACTION;

SAVEPOINT before_second_assignment;

ROLLBACK TO before_second_assignment;

COMMIT;
🚀 Indexing & Optimization

Indexes were created to improve filtering and lookup operations.

Example:

CREATE INDEX idx_employee_salary
ON employees(salary);

Composite index:

CREATE INDEX idx_dept_salary
ON employees(dept_id, salary);

Query execution plans were inspected using:

EXPLAIN
SELECT *
FROM employees
WHERE dept_id = 10
  AND salary > 70000;

The project also demonstrates rewriting queries to make them more
index-friendly.

Example:

Instead of:

WHERE YEAR(join_date) = 2022

a date range can be used:

WHERE join_date >= '2022-01-01'
  AND join_date < '2023-01-01'



📁 Project Structure
sql-final-project/
│
├── README.md
├── schema.sql
├── data.sql
├── analysis.sql
├── optimization.sql
└── transactions.sql
└── verification.sql
└── screenshots/



🎯 Project Objective

The main objective of this project is to demonstrate practical SQL skills
using a realistic relational database.

The project focuses on writing analytical queries, understanding table
relationships, handling transactions, using advanced SQL features, and
analyzing query performance.

✅ Project Status

Completed.

The project covers:

Database Design
Data Modeling
Business Analysis
JOINs
Subqueries
CTEs
Window Functions
Transactions
Indexing
EXPLAIN
Query Optimization