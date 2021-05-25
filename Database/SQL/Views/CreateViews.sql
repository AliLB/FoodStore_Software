use foodDB
go
CREATE  view Sandwich as
(select Pname,Pprice,Pimage from Product where Ptype='Sandwich');
go
CREATE  view Drink as
(select Pname,Pprice,Pimage from Product where Ptype='Drink');
go
