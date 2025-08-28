create database cybrom2;
use cybrom2;
create table info(id int primary key auto_increment,name varchar(30) not null,dob date not null,
age int not null check(age>18),city varchar(30) not null default "bhopal",project varchar(30) not null unique );
insert into info(name,dob,age,city,project)
values ("A","2025-09-05",34,"indore","ACF"),
("B","2025-09-05",34,"pune","AjCF");
select * from info;

create table info2(id int auto_increment,name varchar(30) not null,dob date not null,
age int not null check(age>18),city varchar(30) not null default "bhopal",
project varchar(30) not null unique , primary key (id,name,project));

insert into info2(name,dob,age,city,project)
values ("A","2025-09-05",34,"indore","ACF"),
("B","2025-09-05",34,"pune","AjCF");
select * from info2;
describe info2;


# data querify with clause
select name from info2;
select * from info2 where id = 2;
select * from info2 where age = 34;
select * from info2 where age >= 34;
select * from info2 where age < 34;
select * from info2 where age > 34;
select * from info2 where age <> 34;


