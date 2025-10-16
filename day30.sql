create database windowfun;
use windowfun;

CREATE TABLE sales1_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_rep VARCHAR(50),
    region VARCHAR(50),
    product VARCHAR(50),
    month VARCHAR(20),
    sales_amount DECIMAL(10,2)
);



INSERT INTO sales1_data (sales_rep, region, product, month, sales_amount) VALUES
('Alice', 'North', 'Laptop', 'Jan', 1200.00),
('Bob', 'South', 'Tablet', 'Jan', 800.00),
('Charlie', 'East', 'Laptop', 'Jan', 950.00),
('David', 'West', 'Phone', 'Jan', 600.00),
('Eva', 'North', 'Tablet', 'Feb', 1100.00),
('Alice', 'North', 'Laptop', 'Feb', 1300.00),
('Bob', 'South', 'Tablet', 'Feb', 850.00),
('Charlie', 'East', 'Laptop', 'Feb', 1000.00),
('David', 'West', 'Phone', 'Feb', 700.00),
('Eva', 'North', 'Tablet', 'Mar', 1200.00),
('Alice', 'North', 'Laptop', 'Mar', 1250.00),
('Bob', 'South', 'Tablet', 'Mar', 900.00),
('Charlie', 'East', 'Laptop', 'Mar', 1050.00),
('David', 'West', 'Phone', 'Mar', 650.00),
('Eva', 'North', 'Tablet', 'Apr', 1150.00),
('Alice', 'North', 'Laptop', 'Apr', 1400.00),
('Bob', 'South', 'Tablet', 'Apr', 950.00),
('Charlie', 'East', 'Laptop', 'Apr', 1100.00),
('David', 'West', 'Phone', 'Apr', 800.00),
('Eva', 'North', 'Tablet', 'May', 1180.00),
('Alice', 'North', 'Laptop', 'May', 1350.00);



CREATE TABLE IF NOT EXISTS sales1(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);
 
INSERT INTO sales1(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);




select * from sales1_data;

select sales_rep,region,month ,
sum(sales_amount) over (partition by region) per_region
from sales_data;

select sales_rep,region,month ,
sum(sales_amount) over (partition by sales_rep) per_person
from sales_data;


select sales_rep,region,month ,product,
avg(sales_amount) over (partition by product) per_person
from sales_data;

select sales_rep,region,month ,product,
avg(sales_amount) over (partition by month) per_person
from sales1_data;


select * from sales1;

# rank       it does not skip rows        (no. of rows)
select *, rank() over (partition by fiscal_year order by sale) total_sales     # it skips the row see last row output
from sales1;


# dense_rank       it skip rows        (no. of rows)
select *, dense_rank()  over (partition by fiscal_year order by sale) total_sales  # it does not skips the row see last row output
from sales1;

# lead
select *, lead(sale) over (partition by sales_employee order by fiscal_year desc)
from sales1;

# lag
select *, lag(sale) over (partition by sales_employee order by fiscal_year desc)
from sales1;

# multiple col
select *, sum(sale) over (partition by fiscal_year order by sale) total_sales  ,
rank() over (partition by fiscal_year order by sale) rank_sales     # it skips the row see last row output
from sales1;



-- 1.	Rank sales reps by their total sales within each month. (Use RANK() function with PARTITION BY month)

select *, rank() over (partition by month order by sales_amount desc) rank_emp from sales1_data;

-- 2.	Show the cumulative (running) total of sales for each sales rep across months. (Use SUM() as a window function ordered by month)

select sales_rep,month,sales_amount, sum(sales_amount) over (partition by sales_rep order by month) running_total from sales1_data;

-- 3.	Find the average monthly sales amount for each region.  (Use AVG() with PARTITION BY region)

select *, avg(sales_amount) over(partition by region) avg_sal from sales1_data;


# Case statement

-- 4.	Compare each month’s sales amount with the previous month's sales for each sales rep.   (Use LAG() window function)

select sales_rep,month,sales_amount, lag(sales_amount) over(partition by sales_rep) as prev_sale from sales1_data;

-- 5.	Find the sales amount of the next month for each sales rep.  (Use LEAD() window function)

select sales_rep,month,sales_amount, lead(sales_amount) over(partition by sales_rep order by month) as next_month from sales1_data;

-- 6.	Find what percentage of the total regional sales is contributed by each record.  (Use SUM() in denominator and compute percentage)

select *, sum(sales_amount) over(partition by region) Total_sales,
(sales_amount / sum(sales_amount) over (partition by region)) * 100  percentage  from sales1_data;


select *, (sales_amount / sum(sales_amount) over (partition by region)) * 100  percentage  from sales1_data;

select *, round(100*sales_amount / sum(sales_amount) over (partition by sales_rep),2)  percentage  from sales1_data;

-- 7.	For each sales rep, find their highest monthly sales amount (and display it alongside each row). (Use MAX() as window function)

select sales_rep,sales_amount,month, max(sales_amount) over (partition by sales_rep) from sales1_data;

-- 8.	Check whether each sales rep’s sales increased or not compared to their previous month. (Use LAG() with CASE WHEN logic)

select sales_rep,month,sales_amount , sales_amount - lag(sales_amount) over (partition by sales_rep) as salary_deference,
case when salary_deference > 0 then 'increased'
when salary_deference < 0 then 'decreased'
else 'na'
end as compare
from sales1_data;

select *,lag(sales_amount) over (partition by sales_rep) from sales1_data;

-- 9.	Assign a row number to each sales rep within their region and month based on sales amount. (Use ROW_NUMBER() function)

select *, row_number() over (partition by region,month order by sales_amount desc) row_num from sales1_data;

select *, row_number() over (partition by sales_rep order by month,region desc) row_num from sales1_data;

-- 10.	Compare each record’s sales amount with the average sales of that region and month. (Use AVG() and subtraction to calculate the difference)

select *, avg(sales_amount) over(partition by region,month) avg_sales ,
(sales_amount - avg(sales_amount) over(partition by region,month)) as difference_betw_sales_and_avg_sales
from sales1_data;