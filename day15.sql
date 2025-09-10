use dummy;

# or
select c.customernumber, c.customername,c.country,o.ordernumber,o.status from customers as c inner join orders as o on
c.customernumber = o.customernumber
where country = "usa" or "norway";

# and
select c.customernumber, c.customername,c.country,o.ordernumber,o.status from customers as c inner join orders as o on
c.customernumber = o.customernumber
where country = "usa" and status = "shipped";

# in
select c.customernumber, c.customername,c.country,o.ordernumber,o.status from customers as c inner join orders as o on
c.customernumber = o.customernumber
where country in ("usa","germany","norway");

# not in
select c.customernumber, c.customername,c.country,c.creditlimit,o.ordernumber,o.status from customers as c inner join orders as o on
c.customernumber = o.customernumber
where country not in ("usa","norway");

# between
select  c.customernumber, c.customername,c.country,c.creditlimit,o.ordernumber,o.status from customers as c inner join orders as o on
c.customernumber = o.customernumber where creditlimit between 100000 and 200000 order by creditlimit desc;

# not between
select  c.customernumber, c.customername,c.creditlimit,c.country,o.ordernumber,o.status from customers as c inner join orders as o on
c.customernumber = o.customernumber where creditlimit not between 50000 and 100000 order by creditlimit desc;

# running numbers of cluses for query
select  c.customernumber, c.customername,c.creditlimit,c.country,o.ordernumber,o.status from customers as c inner join orders as o on
c.customernumber = o.customernumber where country not in ("usa","norway","germany","spain")
and status = "shipped" order by creditlimit desc limit 1 offset 1;
