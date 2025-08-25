drop database cybrom1;
create database cybrom;
use cybrom; #to move into the database
show tables; #show all table present in current database
create table info(id int,name varchar(30),age char(30),city varchar(30));
select * from info; #querify the result set
describe info;  #description of outer structure


# insertion in a table


insert into info (id,name,age,city)
values (1,"tushar",20,"bhopal"),
       (2,"ram",32,"pune");
       
 select * from info;      