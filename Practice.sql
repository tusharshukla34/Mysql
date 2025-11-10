use dummy;

show tables;


-- use these two tables for practice

select * from pcustomer;
select * from porders;

SET sql_safe_updates = 0;

update porders set status ='On hold' where ordernumber = 10100;
alter table porders change orderDate orderdates date;

alter table porders modify column orderDates varchar(78);
describe porders;

alter table porders rename column orderdates to orderdate;


create table abc (id int primary key,
name varchar(78) not null);


create table abs(ids int,name varchar(67),
primary key(ids));

create table abss(id int,idss int auto_increment primary key,
foreign key(id) references abc(id));

desc abc;
desc abs;
desc abss;

alter table abss drop foreign key abss_ibfk_1;
alter table abss drop key id;

alter table abss drop primary key;

alter table abss modify idss int;




create view absdds as(select * from porders where ordernumber is null);

select * from absdds;


create algorithm = temptable view absii (ordernumber ,orderdate) as
(select ordernumber,orderdate from porders where orderdate = '2025-11-12' );


select * from absii;


drop view absdds;
drop view absii;


