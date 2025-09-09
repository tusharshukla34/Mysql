use dummy;
select * from customers;
select * from orders;


# to fetch customer who atleast placed 1 order
select * from customers inner join orders on
customers.customernumber = orders.customernumber;


# ambigious error
select customernumber,customername,city,country,orderdate,status
from customers inner join orders on
customers.customernumber = orders.customernumber;

# remove the error
select customers.customernumber,customers.customername,customers.city,customers.country,orders.orderdate,orders.status
from customers inner join orders on
customers.customernumber = orders.customernumber;

# Aliasing
select c.customernumber,c.customername,c.city,c.country,c.state,
o.ordernumber,o.status from customers as c inner join orders as o on   # not neccesary to write -- 'as'
c.customernumber = o.customernumber;