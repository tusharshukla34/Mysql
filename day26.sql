create database group_by;
use group_by;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (customer_id, customer_name, country, city) VALUES
(1, 'Aryan Sharma', 'India', 'Mumbai'),
(2, 'Priya Patel', 'India', 'Delhi'),
(3, 'John Smith', 'USA', 'New York'),
(4, 'Emily Davis', 'USA', 'Chicago'),
(5, 'Carlos Lopez', 'Mexico', 'Monterrey'),
(6, 'Sophia Lee', 'UK', 'London'),
(7, 'Liam Brown', 'UK', 'Manchester'),
(8, 'Mia Chen', 'China', 'Beijing'),
(9, 'David Kim', 'South Korea', 'Seoul'),
(10, 'Olivia Wilson', 'Australia', 'Sydney');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 70000.00),
(102, 'Smartphone', 'Electronics', 40000.00),
(103, 'Tablet', 'Electronics', 25000.00),
(104, 'Headphones', 'Accessories', 3000.00),
(105, 'Office Chair', 'Furniture', 8000.00),
(106, 'Desk Lamp', 'Furniture', 2500.00),
(107, 'T-Shirt', 'Clothing', 1200.00),
(108, 'Shoes', 'Clothing', 3500.00);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1001, 1, '2025-01-05', 140000.00),
(1002, 2, '2025-01-15', 41000.00),
(1003, 3, '2025-02-10', 78000.00),
(1004, 4, '2025-02-18', 58000.00),
(1005, 5, '2025-03-02', 30000.00),
(1006, 6, '2025-03-12', 55000.00),
(1007, 7, '2025-04-01', 24000.00),
(1008, 8, '2025-04-18', 15000.00),
(1009, 9, '2025-05-10', 22000.00),
(1010, 10, '2025-05-20', 64000.00);

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 101, 2, 70000.00),
(2, 1002, 104, 2, 3000.00),
(3, 1002, 107, 5, 1200.00),
(4, 1003, 102, 1, 40000.00),
(5, 1003, 103, 1, 25000.00),
(6, 1003, 104, 4, 3000.00),
(7, 1004, 105, 5, 8000.00),
(8, 1004, 106, 2, 2500.00),
(9, 1005, 108, 3, 3500.00),
(10, 1005, 107, 10, 1200.00),
(11, 1006, 103, 2, 25000.00),
(12, 1006, 104, 1, 3000.00),
(13, 1006, 106, 2, 2500.00),
(14, 1007, 107, 8, 1200.00),
(15, 1007, 108, 2, 3500.00),
(16, 1008, 104, 5, 3000.00),
(17, 1008, 106, 2, 2500.00),
(18, 1009, 108, 4, 3500.00),
(19, 1010, 101, 1, 70000.00),
(20, 1010, 104, 2, 3000.00);


-- 1. Show each customer and the total number of orders they have placed.

select count(od.order_id) as total_orders , c.customer_name from customers c join orders o on c.customer_id = o.customer_id join 
order_details od on o.order_id = od.order_id group by c.customer_name;



-- 2. Show each customer and their total purchase amount.

select sum(o.total_amount) as total_amount , c.customer_name from customers c join orders o on c.customer_id = o.customer_id 
group by c.customer_name;

-- 3. Count the number of orders placed per country. 

select c.country, count(o.order_id) as total_orders from customers c join orders o on c.customer_id = o.customer_id 
group by c.country;

-- 4. Show total sales grouped by country.

select c.country , sum(total_amount) as total from customers c join orders o on c.customer_id = o.customer_id 
group by c.country;

-- 5. Find the average order value (AOV) per customer.

select c.customer_name , avg(o.order_id)  from customers c join orders o on c.customer_id = o.customer_id 
group by c.customer_name;

-- 6. Show each product and total units sold.

select p.product_id, count(od.product_id) as total_unit from products join order_details od on p.product_id = od.product_id 
group by product_name;

-- 7. Find total revenue generated per product category.

select p.category , sum(p.unit_price);


-- 8. Group by month from order_date and show total order count.

select date_format(o.order_date,"%m") as order_month , count(o.order_id) from customers c join orders o on 
c.customer_id = o.customer_id group by order_month;

-- or 

select monthname(o.order_date) as order_month , count(o.order_id) from customers c join orders o on 
c.customer_id = o.customer_id group by order_month;

