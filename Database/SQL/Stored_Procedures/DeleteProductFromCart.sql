use foodDB
go

create procedure deletePfromC @prid int, @orid int
as
set nocount on
	exec deleteTp @pid=@prid,@oid=@orid
	delete from orderitems where pid=@prid and oid=@orid
	print 'product deleted from cart'
go