use dummy;

select * from customers where city not in ('usa','australia') and creditlimit >= 50000;

# view
create view c_cust as (select * from customers where city not in ('usa','australia') and creditlimit >= 50000);

select * from c_cust;