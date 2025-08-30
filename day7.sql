use cybrom2;
create table doctor (doc_id int,doc_name varchar(30),doc_dep varchar(30),city varchar(30) default "bhopal",primary key(doc_id));

create table patient(pat_id int , doc_id int , name varchar(30),room_no int ,mobile_no bigint,primary key(pat_id),
foreign key(doc_id) references doctor(doc_id));

create table hospital(hosp_id int,doc_id int , pat_id int, address varchar(100) not null,department varchar(100) not null,
primary key(hosp_id), foreign key(doc_id) references doctor(doc_id),foreign key(pat_id) references patient(pat_id));

describe doctor;
describe patient;
describe hospital;