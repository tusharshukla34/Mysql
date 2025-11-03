use dummy;


show tables;

create table porders as (select * from orders);
create table pcustomer as (select * from customers);
select * from porders;
select * from pcustomer;

alter table pcustomer drop column phone;   # to drop column from the table 
alter table pcustomer add column phone bigint;
alter table pcustomer modify column customernumber bigint;     # modifying datatype of the column
alter table pcustomer rename column contactlastname to lastname;  # renameing the column
alter table pcustomer add constraint unique(lastname);  # we can add contraint using this 
describe pcustomer;

select * from pcustomer;

SET sql_safe_updates = 0;
update pcustomer set contactlastname = 'aaaaaa' where city like 'nantes';  # updating value of the table
select * from pcustomer where city like 'nantes';


