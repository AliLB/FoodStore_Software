use foodDB
go

create procedure deleteP @productId int
as
set nocount on
DECLARE mycursor CURSOR 
	FOR 
		select oid from orderitems where pid=@productId
	OPEN mycursor
	declare @orderid int
	FETCH NEXT FROM mycursor INTO @orderid
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
		exec deletePfromC @prid=@productId,@orid=@orderid
	FETCH NEXT FROM mycursor  INTO @orderid
	END 
CLOSE mycursor 
DEALLOCATE mycursor
delete from product where pid=@productId
go