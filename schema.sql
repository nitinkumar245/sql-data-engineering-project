CREATE DATABASE sql_final_project;

USE sql_final_project;


CREATE TABLE departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);


CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    salary DECIMAL(10,2),
    join_date DATE,
    city VARCHAR(50),
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);


CREATE TABLE projects(
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2)
);


CREATE TABLE employee_projects(
    emp_id INT NOT NULL,
    project_id INT NOT NULL,
    assigned_date DATE,
    PRIMARY KEY(emp_id, project_id),
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY(project_id) REFERENCES projects(project_id)
);