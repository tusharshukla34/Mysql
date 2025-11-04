create database preparation;
use preparation;

create table sales (sale_id int not null unique , product_id int auto_increment primary key,
quantity_sold int not null, sale_date date not null, total_price decimal(6,2) not null);


insert into sales(sale_id,product_id,quantity_sold,sale_date,total_price) values
(1,101,5,'2024-01-01',2500.00),
(2,102,3,'2024-01-02',900.00),
(3,103,2,'2024-01-02',60.00),
(4,104,4,'2024-01-03',80.00),
(5,105,6,'2024-01-03',90.00);

create table products(product_id int,product_name varchar(40),category varchar(40),unit_price decimal(5,2),
foreign key(product_id) references sales(product_id));


insert into products(product_id,product_name,category,unit_price) values
(101,'Laptop','Electronics',500.00),
(102,'Smart phone','Electronics',300.00),
(103,'Headphone','Electronics',30.00),
(104,'Keyboard','Electronics',20.00),
(105,'Mouse','Electronics',15.00);


select * from sales;
select * from products;


-- 1.	Retrieve all columns from the Sales table.

select * from sales;

-- 2.	Filter the Sales table to show only sales with a total_price greater than $100.

select * from sales where total_price > 100;

-- 3.	Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.

select sale_id,total_price from sales where sale_date = '2024-01-03';

-- 4.Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as 'YYYY-MM-DD'.

select sale_id,date_format(sale_date ,'%y-%m-%d') as formated_sale_date from sales;

-- 5.Calculate the total revenue generated from sales of products in the 'Electronics' category.

select sum(s.total_price) as Total_revenue from sales s join products p on s.product_id = p.product_id where p.category = 'Electronics';

-- 6.Retrieve the product_name and total_price from the Sales table, calculating the total_price as quantity_sold multiplied by unit_price.

select p.product_name,sum(s.quantity_sold * p.unit_price) as total_price from sales s join products p on s.product_id = p.product_id
group by product_name;

-- 7.Find the Products Not Sold from Products table

select * from products p left join sales s on s.product_id = p.product_id where s.product_id is null;

-- 8.Calculate the total revenue generated from sales for each product category.

select p.category ,sum(s.quantity_sold * p.unit_price) as total_rev_by_category from products p join sales s
 on s.product_id = p.product_id group by p.category;

-- 9.Count the number of sales made in each month.

select date_format(sale_date , '%y-%m') as month, count(sale_id) as total_sales_in_month from sales group by month;

-- 10.Rank products based on total sales revenue.

select p.product_name,s.total_price, rank() over(order by s.total_price desc) as Sales_ranking
 from sales s join products p on s.product_id = p.product_id;

-- 11. Create a function name as vsales to display the product whose name end with letter ‘e’.

Delimiter //
create procedure vsales()
begin
select * from products where product_name like '%e';
end //
Delimiter ;

call vsales();

-- 12. Create a query that lists the product names along with their corresponding sales count.

select p.product_name, count(sale_id) as Total_sales from sales s join products p on s.product_id = p.product_id 
group by p.product_name;

-- 13. Write a query to find all sales where the total price is greater than the average total price of all sales.



-- 14. Add a check constraint to the quantity_sold column in the Sales table to ensure that the quantity sold is always greater than zero.



-- 15. Write a query that calculates the total revenue generated from each category of products for the year 2024.

