use cybrom2;
show tables;
select * from info2;
describe info2;
update info2 set age =102 where id = 2;

# to change datatype for outer structure
alter table info2 modify column name  varchar(100);

#to change the name of column of outer structure
alter table info2 rename column project to ass_project;

# table rename
rename table info2 to information;
select * from information;

# to add new column
alter table information add column contact varchar(30) not null;

# to insert the values using insert   # error
insert into information(contact) values("+91 89743286"),("+91 897786886"),("+91 8978906");

# to solve the error (we can not insert the whole values direcrtly we need to update individualy)
update information set contact = "976753088" where id = 1;

# to drop the column
alter table information drop column contact;