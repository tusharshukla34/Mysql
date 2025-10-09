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

-- 5. Find all employees who earn less than the maximum salary in their department.

select * from employees e1 where salary < (select max(salary) from employees e2 where e1.dept_id = e2.dept_id);

-- 6. Show department names where no employee has a salary above 60,000.

select * from departments where dept_id not in (select dept_id from employees where salary > 60000);

-- 7. Display employee names who work on the same project(s) as employee ID 101.

select distinct e.emp_name,t.project_id from employees e join timesheets t using(emp_id) where e.emp_id in
 (select t.emp_id from timesheets t Where emp_id = 101); 

-- 8. Find the department name of the employee who earns the minimum salary.

select * from departments d join employees e using(dept_id) where salary = (select min(salary) from employees);

-- 9. Show the name of the project with the most hours worked (by all employees).

select * from projects where project_id = 
(select project_id from timesheets group by project_id order by sum(hours_worked) desc limit 1 );

SELECT p.project_name, SUM(t.hours_worked) AS total_hours
FROM projects p
JOIN timesheets t USING(project_id)
GROUP BY p.project_name;


-- 10. List employees who did not log any hours in the Timesheets table.

select * from employees where emp_id not in (select emp_id from timesheets);

# Subqueries in FROM Clause (Derived Tables)

-- 11. Display departments and their average salaries, but only for departments having more than 2 employees.


 select avg(salary) as avg_salary, dept_id from employees group by dept_id having dept_id in 
 (select dept_id from employees group by dept_id having count(emp_id) > 2); 
 
 
select dept_id,count(emp_id) as number_of_emp, avg(salary) as avg_salary from employees group by dept_id having number_of_emp > 2;

select dept_id,count(emp_id) as count_emp from employees group by dept_id;


-- 12. Show each department and the total hours worked by its employees on all projects.



select e.dept_id, sum(t.hours_worked) from employees e join timesheets t using(emp_id) group by e.dept_id;


# Subqueries with IN, NOT IN, EXISTS, NOT EXISTS
-- 13. List all employees who are not assigned to any project (i.e., not in Timesheets table).
-- 14. Find departments where at least one employee has worked more than 40 hours on any project.
-- 15. Show all projects that have never been worked on (no hours logged in Timesheets).
-- 16. Display employees who work in departments that do not have any assigned projects.
-- 17. List employees who are the only person in their department.
-- 18. Show employees who have worked on all projects (use NOT EXISTS with anti-join logic).


# Correlated Subqueries
-- 19. List employees whose salary is above the average salary of their respective department.
-- 20. Find projects where the total hours worked by all employees is more than the average total hours worked across all projects.