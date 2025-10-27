create database cte;
use cte;

# cte syntax
with customer_details as 
(select customername,state,country from customers where country like 'usa')
select customername from customer_details where state like 'ca';

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    joining_year INT
);

INSERT INTO employees (emp_id, emp_name, department, salary, joining_year) VALUES
(1, 'Alice', 'HR', 50000, 2020),
(2, 'Bob', 'IT', 60000, 2019),
(3, 'Carol', 'IT', 70000, 2021),
(4, 'David', 'Finance', 65000, 2018),
(5, 'Eva', 'HR', 55000, 2022),
(6, 'Frank', 'Finance', 60000, 2017),
(7, 'Grace', 'IT', 80000, 2016),
(8, 'Helen', 'HR', 52000, 2019),
(9, 'Ian', 'Finance', 58000, 2020),
(10, 'Jack', 'IT', 62000, 2022);

select * from employees;



-- Write a CTE to find the average salary per department.

with avg_sal as 
(select department,avg(salary) as avg_salary from employees group by department)
select avg_salary,department from avg_sal;

-- Using a CTE, list employees whose salary is greater than their department's average.

with list_dep as
(select emp_name,salary,department,avg(salary) as avg_salary from employees group by department, having salary > avg_salary)
select * from list_dep; 

-- Write a CTE that selects all employees who joined after the year 2020.

with emp as
(select emp_name from employees where joining_year >2020)
select * from emp;

-- Use a CTE to get the highest salary in each department.

with hig as
(select department, max(salary) from employees group by department)
select * from hig;

-- Write a CTE to get total salary expenditure per department, and then select only those departments where total expenditure is more than 150000.

with sal as
(select department, sum(salary) total_sal from employees group by department)
select * from sal where total_sal > 150000;

-- Using a CTE, get a list of employees along with the count of employees in their department.


with list_em as
(select emp_name,department, count(emp_id) over (partition by department) as count_emp from employees)
 select emp_name,department,count_emp  from list_em  ;


-- Create a CTE to list employees who earn below the overall average salary.

with avg_sal as 
(select avg(salary) as overall_avg_sal from employees)
select emp_name,salary from employees cross join avg_sal where salary < avg_sal.overall_avg_sal;



-- Write a query using CTE to rank employees by salary in each department.

with rank_sal as
(select emp_name,department,salary, rank() over (partition by department order by salary) as sal_rank from employees)
select * from rank_sal;

-- Use a CTE to calculate cumulative salary (running total) of employees ordered by joining year.

with cumulative as
(select emp_name,salary,joining_year, sum(salary) over (order by joining_year) running_total from employees)
select * from cumulative;

-- Create a CTE that returns departments with more than 2 employees.

with emp_count as 
(select department , count(emp_id) as empc from employees group by department)
select * from emp_count where empc > 2;

