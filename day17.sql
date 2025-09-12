use dummy;


select * from payments;
select * from orderdetails;
select * from orders;
select * from customers;

select c.customernumber,c.customername,p.amount,o.status,o.ordernumber, od.quantityordered * od.priceeach from customers c
inner join payments p using(customernumber) inner join orders o using(customernumber) inner join orderdetails od using(ordernumber);


select c.customernumber,c.customername,p.amount,o.status,o.ordernumber, (od.quantityordered * od.priceeach) as total from customers c
inner join payments p using(customernumber) inner join orders o using(customernumber) inner join orderdetails od using(ordernumber);


select * from customers c left join orders o
on c.customernumber = o.customernumber;

# behave like inner join
select * from customers c join orders o on
c.customernumber = o.customernumber;

