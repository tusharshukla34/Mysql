use practice;

show tables;
desc ab;

select * from company;

create table store(sid int primary key, name varchar(45) not null,address varchar(90));

insert into store(sid,name,address) values (1,'v-mart','Near press complex MP nagar Bhopal');

select * from store;


rename table store to stores;


create table warehouse(sid int, wid int primary key, wname varchar(89) not null,
foreign key(sid) references stores(sid));

desc warehouse;


alter table warehouse drop foreign key warehouse_ibfk_1;
alter table warehouse drop key sid;


create view ab as (select * from books);

create algorithm = temptable view bas (name,emp_id) as (select name,emp_id from company where country = 'china');


select * from bas;

drop view ab;
drop view bas;



