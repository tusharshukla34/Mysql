use dummy;
show tables;
select * from employees;
 select * from customers;
 select * from orders;
 select * from payments;
 select * from orderdetails;
 select * from products;


-- 1 Retrieve the customers whose creditLimit is above the average credit limit of all customers.

select customername,creditlimit from customers where creditlimit > (select avg(creditlimit) from customers);

-- 2️ Find the customer(s) with the highest credit limit using a subquery.

select customername , customernumber, creditlimit from customers where creditlimit = (select max(creditlimit) from customers);

-- 3 Get the customers who have placed at least one order (assuming orders table has a customerNumber foreign key).

select c.customername , c.customernumber from customers c join orders o on c.customernumber = o.customernumber;


select c.customername , c.customernumber from customers c where customernumber in 
(select o.customernumber from orders o);


-- 4 Find the customers who haven't made any payments (assuming payments table exists).

select c.customername , c.customernumber, c.creditlimit from customers c left join orders o on c.customernumber = o.customernumber 
where o.customernumber is null ;

select c.customername , c.customernumber, c.creditlimit from customers c left join payments p on c.customernumber = p.customernumber 
where p.customernumber is null ;

select c.customername , c.customernumber from customers c where customernumber not in 
(select o.customernumber from orders o);

-- 5 Get the customers whose credit limit is higher than any customer's credit limit from "New York".

select customername, creditlimit from customers where creditlimit > (select max(creditlimit) from customers where country = 'usa') ;


-- 6 Find the customer(s) who placed the most orders.

select c.customername , count(o.customernumber) as total_order from customers c join orders o on c.customernumber = o.customernumber
 group by c.customername order by total_order desc; 
 
 select c.customername , sum(od.quantityordered)  as total_order from customers c join orders o on c.customernumber = o.customernumber
  join  orderdetails od on o.ordernumber = od.ordernumber group by c.customername order by total_order desc; 

-- 7 Retrieve customers who have never placed an order.

select * from customers c left join orders o on c.customernumber = o.customernumber where ordernumber is null;

select * from customers where customernumber not in (select customernumber from orders);

-- 8 Find customers who have placed orders but have never made a payment.

select * from customers c  join orders o on c.customernumber = o.customernumber join payments p on o.customernumber = p.customernumber
where ordernumber is null;

select * from customers c  join orders o on c.customernumber = o.customernumber where o.ordernumber not in
(select ordernumber from payments);

-- 9 Get the customers who made the highest total payment.

select c.customernumber, sum(p.amount)as payments from customers c  join orders o on c.customernumber = o.customernumber join payments p on o.customernumber = p.customernumber
group by c.customernumber order by payments desc ;

select c.customernumber from customers c  join orders o on c.customernumber = o.customernumber join payments p on o.customernumber = p.customernumber
where p.amount = (select sum(p.amount) as payments from payments order by payments desc limit 1 );

-- 10 Find products that have never been ordered

select p.productname,p.productcode from products p left join orderdetails od on p.productcode = od.productcode
 where od.productcode is null;

-- 11 Retrieve the most expensive product(s).

select p.productname,p.productcode,od.priceeach from products p left join orderdetails od on p.productcode = od.productcode
 order by od.priceeach desc limit 1;
 
 select p.productname,p.productcode,p.msrp from products p order by msrp desc limit 1 ;

-- 12 Retrieve the total revenue from each product category and list only categories where revenue is above the average revenue.

select p.productname, sum(od.quantityordered * od.priceeach) as total_revenue , avg(od.quantityordered * od.priceeach) as avg_rev from products p
 join orderdetails od on p.productcode = od.productcode group by p.productname having total_revenue > avg_rev ;


select p.productname, sum(od.quantityordered * od.priceeach) as total_revenue from products p
 join orderdetails od on p.productcode = od.productcode group by p.productname having total_revenue >
 (select  avg(quantityordered * priceeach) from orderdetails );