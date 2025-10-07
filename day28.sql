create database subquery;
use subquery;

CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
dept_id INT,
salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(100)
);

CREATE TABLE Projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(100),
dept_id INT
);

CREATE TABLE Timesheets (
timesheet_id INT PRIMARY KEY,
emp_id INT,
project_id INT,
hours_worked INT
);


INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

INSERT INTO Employees (emp_id, emp_name, dept_id, salary) VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 2, 60000),
(103, 'Charlie', 3, 75000),
(104, 'David', 3, 70000),
(105, 'Eve', 2, 55000),
(106, 'Frank', 4, 45000),
(107, 'Grace', 3, 80000),
(108, 'Heidi', 4, 47000),
(109, 'Ivan', 3, 72000),
(110, 'John', 1, 49000);

INSERT INTO Projects (project_id, project_name, dept_id) VALUES
(201, 'Payroll System', 2),
(202, 'Website Redesign', 4),
(203, 'AI Model', 3),
(204, 'HR Onboarding', 1),
(205, 'Marketing Analytics', 4);

INSERT INTO Timesheets (timesheet_id, emp_id, project_id, hours_worked) VALUES
(1, 101, 204, 10),
(2, 102, 201, 15),
(3, 103, 203, 25),
(4, 104, 203, 20),
(5, 105, 201, 30),
(6, 106, 202, 12),
(7, 108, 205, 18),
(8, 109, 203, 22),
(9, 107, 203, 28),
(10, 101, 204, 5),
(11, 104, 201, 8),
(12, 102, 203, 12);

show tables;

-- 1. Find the names of employees who earn more than the average salary of all employees.

select emp_name from employees where salary > (select avg(salary) from employees);


-- 2. List departments whose average employee salary is more than 50,000.

select * from employees e join departments d using(dept_id)
where salary > (select avg(salary) from employees where salary > 50000);

-- 3. Display the employee(s) with the highest salary.

select * from employees where salary = (select max(salary) from employees);

-- 4. Show names of employees who work in the same department as ‘John’.

select * from employees where dept_id = (select dept_id from employees where emp_name like 'john');

