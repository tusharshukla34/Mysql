create database foreign_key;
use foreign_key;

create table student(student_id int not null auto_increment,name varchar(30) not null,age int not null,primary key(student_id));

create table course(course_id int not null ,course_name varchar(30),primary key(course_id));

create table enrollment(enrollement_id int not null auto_increment,student_id int,course_id int,enrollement_date date,
primary key(enrollement_id),
foreign key(student_id) references student(student_id),
foreign key(course_id) references course(course_id));

describe enrollment;