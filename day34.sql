use dummy;
select * from customers;
# stored procedure

Delimiter //
create procedure customerinfo()
begin 
select * from customers where country = "usa";
end //
Delimiter ;

call customerinfo();

Delimiter //
create procedure customercredit()
begin
select * from customers where creditlimit > 180000 and country = "usa";
end //
Delimiter ;

call customercredit()


Delimiter //
create procedure getofficebycountryss(in countryname varchar(255))
begin
select * from offices where country = countryname;
end //
Delimiter ;

call getofficebycountryss('USA');

drop procedure customerinfo;
drop procedure customerage;
drop procedure customercredit;

