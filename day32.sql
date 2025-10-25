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

