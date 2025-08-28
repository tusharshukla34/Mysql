use cybrom;
# default  #check
create table info4 (id int unique not null,age int check(age>18),name varchar(30),city varchar(30) default "bhopal");
insert into info4 (id,age,name,city) values(1,34,"tushar","indore");
select * from info4;
insert into info4 (id,age,name) values(2,20,"tushar");

# primary key (we can say combination of not null and unique)

create table info5 (id int primary key, age int check(age>18),city varchar(30) default "bhopal");
insert into info5 (id,age) values (1,34),(2,34),(3,44);
select * from info5;
describe info5;

# auto_increment

# primary key at coloumn level
create table info6 (id int primary key auto_increment, age int check(age>18),city varchar(30) default "bhopal");
insert into info6 (age) values (34),(34),(44);
select * from info6;
describe info6;


# primary key at table level
create table info7(id int,age int not null, primary key(id,age)); # only id is primary key and other are composite key 
insert into info7 (id,age) values (1,23),(2,34); 
select * from info7;
describe info7;

