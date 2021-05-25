use foodDB
go

CREATE PROCEDURE insertTp @pid int,@quan int,@oid int
AS
set nocount on
	declare @tp float,@price float
	set @tp=(SELECT Ototalprice from Orders where oid=@oid)
	set @price=(SELECT pprice from product where pid=@pid)
	update Orders set Ototalprice=((@price*@quan)+@tp) where oid=@oid
GO