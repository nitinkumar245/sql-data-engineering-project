USE sql_final_project;


INSERT INTO departments (dept_id, dept_name)
VALUES
(10, "IT"),
(20, "HR"),
(30, "Finance"),
(40, "Marketing"),
(50, "Operations");


INSERT INTO employees
(emp_id, emp_name, dept_id, salary, join_date, city)
VALUES
(101, "Nitin", 10, 85000, "2022-03-15", "Delhi"),
(102, "Rahul", 10, 72000, "2023-06-10", "Delhi"),
(103, "Aman", 20, 55000, "2021-08-20", "Noida"),
(104, "Priya", 20, 68000, "2022-11-05", "Delhi"),
(105, "Neha", 30, 90000, "2020-01-12", "Gurgaon"),
(106, "Rohit", 30, 75000, "2023-04-18", "Delhi"),
(107, "Simran", 40, 62000, "2024-02-25", "Noida"),
(108, "Karan", 40, 70000, "2022-09-30", "Delhi"),
(109, "Anjali", 50, 58000, "2024-07-14", "Gurgaon"),
(110, "Vikas", 50, 65000, "2021-12-01", "Delhi");


INSERT INTO projects
(project_id, project_name, budget)
VALUES
(1, "Data Warehouse", 500000),
(2, "ETL Pipeline", 350000),
(3, "HR Portal", 200000),
(4, "Marketing Analytics", 300000),
(5, "Finance Dashboard", 450000);


INSERT INTO employee_projects
(emp_id, project_id, assigned_date)
VALUES
(101, 1, "2024-01-10"),
(101, 2, "2024-03-15"),
(102, 2, "2024-03-20"),
(103, 3, "2024-02-01"),
(104, 3, "2024-02-05"),
(105, 5, "2024-01-15"),
(106, 5, "2024-02-10"),
(107, 4, "2024-04-01"),
(108, 4, "2024-04-05"),
(109, 1, "2024-05-01"),
(110, 2, "2024-05-10");