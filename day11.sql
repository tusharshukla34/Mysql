use dummy;

# Sequential  # order by 

# categorical data
select  * from customers order by customername;

# numerical data
select customernumber,city,postalcode,creditlimit from customers order by creditlimit;

#limit #offset

select * from customers order by creditlimit desc limit 1 offset 4;
select * from customers order by creditlimit desc limit 4 offset 2;

#update

update customers set phone = 123456 where customernumber = 103;
