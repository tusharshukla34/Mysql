use cybrom2;
show tables;

describe patient;
describe hospital;

# steps to drop foreign key
alter table patient drop foreign key patient_ibfk_1;    # 1st we drop foreign key relation
alter table patient drop key doc_id;                     # 2nd we drop key reference

alter table hospital drop foreign key hospital_ibfk_2;
alter table hospital drop key pat_id;

# copy struture
create table patient1 as select * from patient;

drop table patient;

rename table patient1 to patient;