use windowfun;

--  8. Determine Account Status


create table users(User_ID int,Name varchar(30),Status varchar(40));

insert into users(User_ID,Name,Status)
values(1,'John','Active'),
(2,'Mike','Suspended'),
(3,'Emma','Inactive');

select *,
case when status = 'active' then "open"
when status = 'suspended' then 'closed'
else 'not active'
end as Account_status
from users;


--  9. Calculate Discounts Based on Order Value

create table orders(Order_ID int ,Customer varchar(30),Amount float);

insert into orders(order_ID,customer,amount)
values(1,'John',1200),
(2,'Mike',600),
(3,'Emma',400);

select *,
case when amount > 1000 then amount*15/100
when amount between 500 and 1000 then amount*10/100
else amount*05/100
end as discount_u_got
from orders;



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    total_spent DECIMAL(10,2),
    membership_expiry DATE,
    loan_status VARCHAR(20),
    shipment_date DATE,
    expected_delivery DATE,
    hours_worked INT,
    salary_per_hour DECIMAL(5,2),
    product_category VARCHAR(50),
    transaction_amount DECIMAL(10,2),
    transaction_flag VARCHAR(10),
    insurance_plan VARCHAR(20),
    user_role VARCHAR(20)
);

INSERT INTO customers VALUES
(1,'Rahul',25,12000.00,'2025-12-31','Pending','2025-10-20','2025-10-25',38,200.00,'Electronics',1200.00,NULL,'Basic','User'),
(2,'Anita',45,45000.50,'2024-11-10','Approved','2025-10-15','2025-10-20',45,180.00,'Groceries',600.00,'Fraud','Premium','Admin'),
(3,'Vikram',32,8000.75,'2023-08-01','Rejected','2025-10-18','2025-10-19',50,150.00,'Fashion',300.00,NULL,'Standard','User'),
(4,'Neha',29,30000.00,'2025-05-15','Pending','2025-10-22','2025-10-25',42,220.00,'Electronics',2500.00,NULL,'Gold','Manager'),
(5,'Sohan',52,98000.00,'2022-12-31','Approved','2025-10-18','2025-10-20',55,175.00,'Furniture',10000.00,'Fraud','Platinum','User'),
(6,'Priya',37,0.00,'2025-02-28','Pending','2025-10-21','2025-10-23',30,190.00,'Groceries',NULL,NULL,'Basic','User'),
(7,'Karan',28,2500.00,'2024-07-20','Pending','2025-10-19','2025-10-22',60,160.00,'Fashion',200.00,NULL,'Standard','User'),
(8,'Meena',41,55000.00,'2026-01-30','Approved','2025-10-14','2025-10-16',40,210.00,'Electronics',5000.00,NULL,'Premium','Admin'),
(9,'Aman',22,4000.00,'2025-06-01','Pending','2025-10-25','2025-10-28',35,180.00,'Fashion',80.00,NULL,'Basic','User'),
(10,'Divya',30,150000.00,'2023-05-05','Approved','2025-10-10','2025-10-15',48,300.00,'Luxury',20000.00,'Fraud','Platinum','Manager'),
(11,'Ravi',34,8600.00,'2024-02-10','Rejected','2025-10-17','2025-10-19',32,160.00,'Books',350.00,NULL,'Standard','User'),
(12,'Sneha',27,47000.00,'2025-03-01','Approved','2025-10-20','2025-10-22',46,195.00,'Cosmetics',1800.00,NULL,'Gold','Supervisor'),
(13,'Arjun',50,22000.00,'2024-10-01','Pending','2025-10-19','2025-10-21',52,170.00,'Electronics',900.00,NULL,'Premium','User'),
(14,'Pooja',31,61000.00,'2026-05-10','Approved','2025-10-22','2025-10-24',58,250.00,'Groceries',700.00,NULL,'Basic','Admin'),
(15,'Tarun',26,500.00,'2023-01-01','Rejected','2025-10-18','2025-10-19',28,150.00,'Fashion',150.00,'Fraud','Basic','User');


-- 10. Identify Late Shipments

select customer_id,name,product_category,
case when shipment_date > expected_delivery then 'Late'
else 'early'
end as shipment_status
from customers;

-- 11. Determine Loan Eligibility

select customer_id,name,
case when loan_status = 'pending' then '';

-- 12. Assign Age Groups

select customer_id,name,
case when age between 50 and 100 then 'Senior citizon'
when age between 18 and 50 then 'adult'
else 'teen'
end as age_group
from customers;

-- 13. Replace NULL Values with Default

select * from customers;

select customer_id,name,
case when transaction_flag is null then 'NA'
else 'Fraud'
end as transaction_flag
from customers; 	

-- 14. Categorize Products

-- 15. Calculate Overtime Pay

-- 16. Identify Expired Memberships

-- 17. Categorize Customer Spending

-- 18. Flag Fraudulent Transactions

-- 19. Determine Insurance Premiums

-- 20. Assign User Roles

