create database testprac;
use testprac;

create table students(stu_id int primary key auto_increment, sname varchar(30)  not null, age int not null check (age > 18)
,dob date not null);

create table teachers(teac_id int primary key auto_increment, tname varchar(30), address varchar(100)
,city varchar(34) default 'Bhopal' ,stu_id int , foreign key(stu_id) references students(stu_id));

show tables;
desc students;
desc teachers;


insert into students(sname,age,dob)
values("ram",45,"2020-12-23"),
      ("aman",55,"2020-12-23"),
      ("sallu",65,"2020-12-23"),
      ("lucky",85,"2020-12-23"),
      ("sumit",35,"2020-12-23");
select * from students;



insert into teachers(tname,address,stu_id)
values("amisha","sfsfrgeethrt",1),
      ("geta","ohiigigihguigu",2),
      ("vanshika","ooihigifufu",1),
      ("paramjeet","hiigufuiyi",1),
      ("tripti","uuyyrrddff",5);
select * from teachers;      


# add col 
select * from students;
alter table students add column father_name varchar(39);

# add values to new col
update students set father_name = "uiuiuiui" where stu_id = 1;

# add constraint to col
desc students;
alter table students modify column father_name varchar(300) unique;

# rename col
alter table students rename column father_name to f_name;

# modify dtype
alter table students modify column f_name char(120);

# update values
update students set sname = "shailendra" where stu_id = 3;

# delete value
del;

# rename table
rename table students to studentss;
rename table studentss to students;

# create duplicate or a copy table
create table Copy_students as select * from students;

# revove constarints
desc students;
alter table students drop constraint father_name;

# drop table
drop table copy_students;

# drop foreign key
alter table teachers drop foreign key teachers_ibfk_1;
alter table teachers drop key stu_id;
desc teachers;

# add constarint FK
alter table teachers add foreign key(stu_id) references students(stu_id);

# create normal view
create view s_view as (select s.stu_id, s.sname, t.teac_id ,t.tname from students s join teachers t
on s.stu_id = t.stu_id);
select * from s_view;

# create algorithm 
create algorithm = temptable view 
sa_view (stu_id , sname) as (select stu_id, sname from students);
select * from sa_view;