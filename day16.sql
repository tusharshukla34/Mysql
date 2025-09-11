use dummy;
select * from customers;
select * from orders;
select * from orderdetails;
select * from payments;
show tables;

# joining multiple tables
select c.customernumber,c.customername,c.city,o.ordernumber,o.status,p.amount from 
customers as c inner join orders as o on c.customernumber = o.customernumber
inner join payments p on o.customernumber = p.customernumber; 

# using      
select * from customers inner join orders using(customernumber);