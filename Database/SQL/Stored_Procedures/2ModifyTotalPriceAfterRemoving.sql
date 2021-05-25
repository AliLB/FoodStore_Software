use foodDB
go

CREATE PROCEDURE deleteTp @pid int,@oid int
AS
set nocount on
	declare @tp float,@quan int,@price float
	set @tp=(SELECT Ototalprice from Orders where oid=@oid)
	set @quan=(SELECT quantity from OrderItems where oid=@oid and pid=@pid)
	set @price=(SELECT pprice from product where pid=@pid)
	update Orders set Ototalprice=(@tp-(@price*@quan)) where oid=@oid
GO