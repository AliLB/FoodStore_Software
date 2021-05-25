use master
go
sp_addlogin 'ali','','foodDB','us_english';
go
sp_addlogin 'hassan','123','foodDB','us_english';
go
use foodDB
go
sp_addrole 'Managers'; --master admin
go
grant select,update,insert,delete on Manager to Managers
grant select,delete on Client to Managers
grant select,update,insert,delete on Product to Managers
grant select,update,insert,delete on Orders to Managers
grant select on Orderitems to Managers
grant select on CreditCard to Managers
grant select on totalorders to Managers
GRANT EXECUTE on dbo.createMan to Managers
GRANT EXECUTE on dbo.createCus to Managers
GRANT EXECUTE on dbo.deleteCus to Managers
GRANT EXECUTE on dbo.deleteP to Managers
GRANT EXECUTE on dbo.SelectClient to Managers
GRANT EXECUTE on dbo.SelectManager to Managers
GRANT EXECUTE on dbo.getcid to Managers
GRANT EXECUTE on dbo.getdid to Managers
GRANT EXECUTE on dbo.getoid to Managers
GRANT EXECUTE on dbo.getpid to Managers
go
sp_addrole 'Employees'; --admin
go
grant select,delete on Client to Employees
grant select,update,insert,delete on Product to Employees
grant select,update,insert,delete on Orders to Employees
grant select on Orderitems to Employees
grant select on CreditCard to Employees
grant select on totalorders to Employees
GRANT EXECUTE on dbo.createCus to Employees
GRANT EXECUTE on dbo.deleteCus to Employees
GRANT EXECUTE on dbo.deleteP to Employees
GRANT EXECUTE on dbo.SelectClient to Employees
GRANT EXECUTE on dbo.getcid to Employees
GRANT EXECUTE on dbo.getdid to Employees
GRANT EXECUTE on dbo.getoid to Employees
GRANT EXECUTE on dbo.getpid to Employees
go
sp_adduser 'hassan','employee_hassan','Employees';
go
sp_adduser 'ali','manager_ali','Managers';

