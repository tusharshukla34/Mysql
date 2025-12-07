use practise;

show tables;


create table infooo (id int primary key auto_increment, name varchar(39) not null,age varchar(49) check(age > 18),
					  num bigint unique, city varchar(40) default 'Bhopal');
                      
 desc infooo;
 
 insert into infooo (name,age,num,city)
 values ('TUSHAR',21,'8989898969','');
 
 select * from infooo;
 
 
 create table intoo (name varchar(78),id int,fac_id int ,serial_no int, primary key (id,fac_id,serial_no));
 
 desc intoo;
 
 create table fori (id int , ids int primary key, 
 foreign key(id) references infooo(id));
 
 desc fori;
 
 
 alter table fori drop foreign key fori_ibfk_1;
 alter table fori drop key id;
 
 RENAME table ml to student_info;
 
 select * from student_info;
 
 rename table test to exam;
 
 select * from exam;
 
 alter table student_info change names full_name varchar(70);
 
 alter table student_info change cource varchar(88);
 
 alter table exam change subject test_subject varchar(677) ;
 
 rename table student_info to ml , exam to test;
 
 rename table student_info to ml;
 
 alter table ml add column id int;
 
 alter table exam add column grade varchar(5);
 
 alter table exam add remark varchar(78);
 
 alter table exam add column ybj int ,add column  uug int, add column yubi  int  ;
 
 alter table exam drop column ybj;
 
 alter table exam drop column score;
select * from exam; 
 alter table exam change marks score decimal(5,2);
 
 alter table exam drop column uug, drop column yubi;
 
 rename table exam to test;
 
 select * from ml;
 
 desc ml;
 
 drop table ml;
 drop table test;
 
 alter table ml change cources cource varchar(70);
 
 select * from test;
 update test set marks = null where test_id = 103;
 
 update test set subject = "Advance Python" where subject like 'Python%';
 
 update test set marks =  marks +5 where test_id is not null;
 
 update test set marks = +5 where test_id is not null;
 
 SET SQL_SAFE_UPDATES = 0;

 
 
 
 alter table ml rename column cource to cources varchar(77);
 select * from test;
 
 update test set test_subject = "sql" where test_id = 102;
 
 update test set test_subject = 'uiu' where test_id = 101; 
 
alter table ml rename column date to dates, rename column full_name to name;
 
 desc student_info;
 
 alter table student_info rename column name to names;
 
 alter table exam modify marks float;
 
 alter table student_info modify name varchar(700);
 
 
 
 
 1️⃣ ORDER BY — 5 Questions (ONLY Queries ❌ No Answers)

-- Display all student names and marks ordered by marks in descending order.

-- Show students sorted by course name alphabetically.

-- Display subject and marks ordered by subject A → Z.

-- Show all test records ordered by test_date latest first.

-- Display students ordered by joining_date, oldest first.

2️⃣ LIMIT — 5 Questions (ONLY Queries ❌ No Answers)

-- Display the top 3 highest marks from the test table.

-- Show first 2 students from ml table.

-- Display only 1 test record of Tushar.

-- List 5 earliest test dates.

-- Show highest marks record using ORDER BY + LIMIT.

3️⃣ OFFSET — 5 Questions (ONLY Queries ❌ No Answers)

-- Display student list skipping the first 2 rows.

-- Show marks skipping first 3 highest records.

-- Display subject and marks skipping 1 record but limit 2.

-- Show test rows starting from 4th row.

-- List names and marks, skip first record then show 3.