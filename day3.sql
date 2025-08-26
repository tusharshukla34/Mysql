use cybrom;
drop table info3;
create table info1 (id int, name varchar(30), dob date, salary decimal(6,3), mobile_number bigint, mobile_no varchar(30));

insert into info1 (id,name,dob,salary,mobile_number,mobile_no)
values (1,"tushar","2025-12-22",99.999,1234567897,"+91 98654323576");

select * from info1;
describe info1;

#constraint
# unique, not null , check , default

create table info2 (id int unique, age int not null);
insert into info2(id ,age)
values (1,25),(2,45),(3,78);

create table info3 (id int unique not null, age int unique);
insert into info3(id ,age)
values (1,25),(2,null),(3,null);
select * from info3;