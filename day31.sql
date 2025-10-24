use windowfun;
drop table employees;
create table employees(Emp_ID int primary key,Emp_Name varchar(30), Salary float ,Dept varchar(50) not null, Experience int not null);

insert into employees(Emp_ID ,Emp_Name, Salary, Dept, Experience)
values(1, 'Alice', 60000 ,'HR', 5),
(2, 'Bob', 85000 ,'IT', 10),
(3 ,'Charlie', 40000 ,'Finance', 3),
(4 ,'David', 75000, 'IT', 8),
(5 ,'Emma', 30000 ,'Finance', 2);


select * from employees;

-- 1. Categorize Employees Based on Salary
-- Question: Classify employees into High Salary, Medium Salary, and Low Salary.

select emp_name,salary,
case when salary > 80000 then "High salary"
when salary between 50000 and 80000 then "medium salary"
else "low salary"
end as salary_catagory
from employees;


--  2. Assign Performance Levels Based on Experience
-- Question: Categorize employees as "Beginner", "Intermediate", or "Expert".

select emp_name,experience,
case when experience >= 8 then 'expert'
when experience between 4 and 8 then 'intermediate'
else 'beginner'
end as expertice
from employees;

--  3. Convert Department Codes to Full Names
-- Question: Replace department names with "Human Resources", "Information Technology", and "Financial Services".


select emp_name,dept, 
case when dept = 'hr' then  "human resource"
when dept = 'it' then "Information technology"
when dept = 'finance' then  "Financial service"
else 'Na'
end as New_dept
from employees;



-- 4. Calculate Bonus Based on Salary
-- Question: If an employee earns:
-- •	> $80,000, they get 15% bonus.
-- •	$50,000 - $80,000, they get 10% bonus.
-- •	< $50,000, they get 5% bonus.

select emp_name,salary,dept,
case when salary > 80000 then 80000*0.15
 when salary between 50000 and 80000 then 80000*0.10
 when salary < 80000 then 80000*0.05
 else 'na'
 end as bonus
 from employees;
 
 
--   5. Determine Tax Brackets
-- Question: Classify employees into different tax slabs.

select emp_name,dept,salary,
case when salary > 80000 then "20%"
 when salary between 50000 and 80000 then '10%'
 when salary < 80000 then '5%'
 else 'na'
 end as tax
 from employees;

-- 6. Identify Employees with No Department
-- Question: Show "Department Not Assigned" if the department is NULL.

select emp_name,dept, 
case when dept is not null then  "have a dept"
else null
end as emp_have_dept
from employees;


--  7. Classify Students Based on Marks
-- Table: Students

create table student(ID int,Name varchar(30),Marks int);

insert into student(Id,name,marks)
values(1,'Alex',90),
(2,'Brian',70),
(3,'Chris',45);

select * ,
case when marks >= 90 then "A"
when marks between 60 and 90 then "B"
else 'C'
end as grade
from student;







