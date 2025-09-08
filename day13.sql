create database joins;
use joins;

create table table1(id int); 
create table table2(id int);
insert into table1(id) values(1),(2),(2),(3),(4),(5),(null),(null);
insert into table2(id) values(1),(1),(2),(2),(2),(3),(null);

#inner join
select * from table1 inner join table2 on 
table1.id = table2.id;

#left join
select * from table1 left join	table2 on
table1.id = table2.id;

#right join
select * from table1 right join table2 on
table1.id = table2.id;

#cross join
select * from table1 cross join table2;
