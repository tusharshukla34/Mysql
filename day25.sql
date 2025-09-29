use dummy;

create table emp(emp_id int primary key auto_increment , dept varchar(30) not null, salary int not null);
insert into emp(dept,salary)
values("HR",70000),("HR",39500),("IT",12000),("HR",567000),("Finance",34500),("IT",12340),("Finance",67000),("HR",10000);

# group by
select sum(salary) as total , dept from emp group by dept;

select avg(salary) as avg_salary , dept from emp group by dept;

# having
select sum(salary) as total , dept from emp group by dept having total > 400000 ;


# difference between where and having
select * from emp where dept = "hr";
select * from emp having dept = "hr";

select sum(salary) as total, dept from emp where salary > 400000 group by dept having total > 200700;