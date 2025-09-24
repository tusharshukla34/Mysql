use dummy;

# updatable view
create view ab_view as (select customernumber,city,state,creditlimit from customers);
select * from ab_view;

# non - updatable view 
create algorithm = temptable view 
ab1_view (customernumber,city,state,creditlimit) as 
(select customernumber,city,state,creditlimit from customers);
select * from ab1_view;


# cross filter direction                      --                  updatable view
#  it behave like bidirectional 
select * from customers;   # parent table 
select * from ab_view;   # child table 

# update is performed on parent and impact can be seen on child table 
update customers set state = null where customernumber = 103;


# update is performed on child and impact can be seen on parent table 
update ab_view set state = null where customernumber = 103;


# cross filter direction                      --                 non - updatable view

select * from customers;   # parent table 
select * from ab1_view;   # child table 

# update is performed on parent and impact can be seen on child table 
update customers set state = "aasd" where customernumber = 103;


# update is performed on child but no impact can be seen on parent table 
update ab1_view set state = null where customernumber = 103;  -- error