use foodDB
go

create procedure updateCart @prid int, @orid int,@quantity int
as
set nocount on
	declare @oldquant int,@q int
	set @oldquant=(select quantity from ORDERITEMS where oid=@orid and pid=@prid)
	set @q=@quantity+@oldquant
	update ORDERITEMS set QUANTITY=@q where pid=@prid and oid=@orid
	exec insertTp @pid=@prid,@quan=@quantity,@oid=@orid
go