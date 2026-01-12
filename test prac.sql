create database finalprep;
use dummy;
show tables;

select * from customers;
select * from employees;
select * from orders;





-- 2.	Select customer name from customer. Sort by customer name (122)

select customername from customers order by customername;

-- 3.	List each of the different status that an order may be in (6)

select distinct status from orders;

-- 4.	List firstname and lastname for each customers. Sort by lastname then firstname (23)

select contactlastname,contactfirstname from customers order by contactlastname,contactfirstname;

-- 5.	List all the employee job titles (7)

select distinct jobtitle from employees;

-- 6.	List all products along with their product scale (110)

select productname, productscale from products;

-- 7.	List all the territories where we have Offices (4)

show tables;
select territory from offices;

-- WHERE Clause
-- 8.	select contact firstname, contact lastname and credit limit for all Customers where credit limit > 50000 (85)

select * from customers;
select contactfirstname , contactlastname , creditlimit from customers where creditlimit > 50000;

-- 9.	select Customers who do not have a credit limit (0.00) (24)

select * from customers where creditlimit = 0;

-- 10.	List all Offices not in the USA (4)

select * from offices where country not in ("USA");

-- 11.	List Orders made between June 16, 2014 and July 7, 2014 (8)



-- 12.	List products that we need to reorder (quantityinstock < 1000) (12)


-- 13.	List all Orders that shipped after the required date (1)


-- 14.	List all Customers who have the word 'Mini' in their name (10)


-- 15.	List all products supplied by 'Highway 66 Mini Classics' (9)


-- 16.	List all product not supplied by 'Highway 66 Mini Classics' (101)


-- 17.	List all employees that don't have a manager (1)




-- NATURAL JOIN
-- 18.	Display every order along with the details of that order for order numbers 10270, 10272, 10279 (23)
-- Hint: this can be done two ways. Try both of them. Which is easier if you have a large number of selection criteria?
-- method 1 using OR:
SELECT ordernumber, productcode, quantityordered, priceeach, orderlinenumber
FROM Orders NATURAL JOIN OrderDetails
WHERE ordernumber = 10270 OR ordernumber = 10272 OR ordernumber = 10279; 
-- method 2 using IN:
SELECT ordernumber, productcode, quantityordered, priceeach, orderlinenumber
FROM Orders NATURAL JOIN OrderDetails
WHERE ordernumber IN(10270, 10272,10279);

-- 19.	List of ProductLines and vendors that supply the products in that productline. (65)
-- NOT THE ANSWER (JUST TO MORE CLEARLY SEE THE DUPLICATES):
SELECT productline, productvendor
FROM ProductLines NATURAL JOIN Products
ORDER BY productline, productvendor;
-- ACTUAL ANSWER FOR #19:
SELECT DISTINCT productline, productvendor
FROM ProductLines NATURAL JOIN Products;


-- Inner Join
-- 20.	select Customers that live in the same state as one of our Offices (26)
-- method 1:


-- method 2:


-- 21.	select Customers that live in the same state as their employee representative works (26)



-- Multi-JOIN
-- 22.	select customerName, orderDate, quantityOrdered, productLine, productName for all Orders made and shipped in 2015 (444)




-- OUTER JOIN
-- 23.	List products that didn't sell (1)
-- method 1:

-- method 2:

);

-- 24.	List all Customers and their sales rep even if they don't have a sales rep (122)


-- Aggregate Functions
-- 25.	Find the total of all Payments made by each customer (98)


-- 26.	Find the largest payment made by a customer (1)


-- 27.	Find the average payment made by a customer (1)


-- 28.	What is the total number of products per product line (7)


-- 29.	What is the number of Orders per status (6)


-- 30.	List all Offices and the number of employees working in each office (7)


-- HAVING
-- 31.	List the total number of products per product line where number of products > 3 (6)


-- 32.	List the orderNumber and order total for all Orders that totaled more than $60,000.00.


-- Computations
-- 33.	List the products and the profit that we have made on them.  
--      The profit in each order for a given product is (priceEach - buyPrice) * quantityOrdered.  
--      List the product's name and code with the total profit that we have earned selling that product.  
--      Order the rows descending by profit. 
--      Only show those products whose profit is greater than $60,000.00. (11)



-- 34.	List the average of the money spent on each product across all Orders 
--      where that product appears when the customer is based in Japan.  
--      Show these products in descending order by the average expenditure (45).
-- !NOTE!: WHERE cluase comes before GROUP BY.
-- method 1:


-- method 2:



-- 35.	What is the profit per product (MSRP-buyprice) (110)


-- 36.	List the Customer Name and their total Orders (quantity * priceEach) 
--      across all Orders that the customer has ever placed with us,
--      in descending order by order total 
--      for those Customers who have ordered more than $100,000.00 from us. (32)


-- Set Operations
-- 37.	List all Customers who didn't order in 2015 (78)
-- method 1:

-- method 2


-- 38.	List all people that we deal with (employees and customer contacts). 
--      Display first name, last name, company name (or employee) (145)



-- 39.	List the last name, first name, and employee number of all of the employees who do not have any Customers.  
--      Order by last name first, then the first name. (8)
-- method 1:

-- method 2:


-- 40.	List the states and the country that the state is part of that have 
--      Customers but not Offices, 
--      Offices but not Customers,
--      or both one or more Customers and one or more Offices all in one query.  
--      Designate which state is which with the string 'Customer', 'Office', or 'Both'.  
--      If a state falls into the "Both" category, do not list it as a Customer or an Office state.
--      Order by the country, then the state.
--      Give the category column (where you list 'Customer', 'Office', or 'Both') a header of "Category"
--      and exclude any entries in which the state is null. (19)


-- 41.	List the Product Code and Product name of every product that has never been 
--      in an order in which the customer asked for more than 48 of them.  
--      Order by the Product Name.  (8)

);

-- 42.	List the first name and last name of any customer who ordered any products
--      from either of the two product lines 'Trains' or 'Trucks and Buses'.
--      Do not use an "or".
--      Instead perform a union.  
--      Order by the customer's name.  (61)


-- 43.	List the name of all Customers who do not live in the same state and country with any other customer.  
-- method 1:


-- Subqueries
-- 44.	What product that makes us the most money (qty*price) (1)

-- 45.	List the product lines and vendors for product lines which are supported by < 5 vendors (3)

-- 46.	List the products in the product line with the most number of products (38)


-- 47.	Find the first name and last name of all customer contacts
--      whose customer is located in the same state as the San Francisco office. (11)


-- 48.	What is the customer and sales person of the highest priced order? (1)
-- method 1:


-- method 2:


-- 49.	What is the order number and the cost of the order for the most expensive Orders?
--      Note that there could be more than one order which all happen to add up to the same cost,
--      and that same cost could be the highest cost among all Orders. (1)


-- 50.	What is the name of the customer, the order number,
--      and the total cost of the most expensive Orders? (1)
 

-- 51.	Perform the above query using a view. (1)
----    YOU NEED TO RUN BOTH QUERIES BELOW:
----    However, in derby, there is no "OR REPLACE" so after the first time you
----    create the below view table, theres no way to replace it in the case
----    that some other order becomes the highest price order besides manually
----    dropping the view and running it again




-- 52.	Show all of the Customers who have ordered at least one product
--      with the name "Ford" in it, that "Dragon Souveniers, Ltd." has also ordered.  
--      List them in reverse alphabetical order,
--      and do not consider the case of the letters in the customer name in the ordering.
--      Show each customer no more than once. (61)


-- 53.	Which products have an MSRP within 5% of the average MSRP across all products?
--      List the Product Name, the MSRP, and the average MSRP ordered by the product MSRP. (14)


-- 54.	List all of the Customers who have never made a payment on the same date as another customer. (57)



-- 55.	Find Customers who have ordered the same thing.
--      Find only those customer pairs who have ordered the same thing as each other at least 201 times (1)


-- 56.	What is the manager who manages the greatest number of employees (2)


-- 57.	Select all employees who work for the manager that manages the greatest number of employee (12)





-- 58.	List all employees that have the same last name. Make sure each combination is listed only once (5)


-- 59.	Select the name of each of two Customers who have made at least one payment on the same date as the other.
--      Make sure that each pair of Customers only appears once. (46)
SELECT A.customernumber, A.paymentdate, B.customernumber, B.paymentdate
FROM Payments A INNER JOIN Payments B
USING (paymentdate)
WHERE A.customernumber > B.CUSTOMERNUMBER;
----    FULL ANSWER FOR #59:
SELECT Cus_A.customername, Cus_B.customername, A.PAYMENTDATE AS "Common Payment Date"
FROM (Payments A NATURAL JOIN Customers Cus_A) INNER JOIN (Payments B NATURAL JOIN Customers Cus_B) 
USING (paymentdate)
WHERE A.customernumber > B.customernumber;




-- 60.	Find Customers that share the same state and country.
--      The country must be one of the following: UK, Australia, Italy or Canada.
--      Remember that not all countries have states at all, so you need to substitute
--       a character sting like 'N/A' for the state in those cases so that you can compare the states.


-- 61.	Find all of the Customers who have the same sales representative as some other customer,
--      and either customer name has 'Australian' in it.
--      List each of the Customers sharing a sales representative, and the name of the sales representative.
--      Order by the name of the first customer, then the second.  Do not show any combination more than once. (9)
