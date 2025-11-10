use dummy;

show tables;


-- use these two tables for practice

select * from pcustomer;
select * from porders;

SET sql_safe_updates = 0;

update porders set status ='On hold' where ordernumber = 10100;
alter table porders change orderDate orderdates date;
