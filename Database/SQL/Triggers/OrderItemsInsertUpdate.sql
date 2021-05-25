use foodDB
go

create trigger TI_ORDERITEMS on ORDERITEMS instead of insert as
begin
set nocount on
    declare
       @errno    int,
       @errmsg   varchar(255)
	if not exists(select * from orders ,inserted where orders.oid=inserted.oid)
	begin
		select @errno  = 50002,@errmsg = 'no such order id, cant insert.'
        goto error
	end
	if not exists(select * from PRODUCT ,inserted where PRODUCT.pid=inserted.pid)
	begin
		select @errno  = 50002,@errmsg = 'no such product id, cant insert.'
        goto error
	end
	declare @productid int,@orderid int,@quant int
	set @productid=(select pid from inserted)
	set @orderid=(select oid from inserted)
	set @quant=(select quantity from inserted)
	insert into ORDERITEMS values(@productid,@orderid,@quant)
	exec insertTp @pid=@productid,@quan=@quant,@oid=@orderid
	print 'orderitem insertion complete'
	return
/*  Errors handling  */
error:
    exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
    rollback  transaction
	insert into trace values(SYSTEM_USER,USER,'orderitems','insert',GETDATE());
end
go

create trigger TU_ORDERITEMS on ORDERITEMS for update as
begin
set nocount on
   declare
      @errno    int,
      @errmsg   varchar(255)

    if not exists(select * from orders ,inserted where orders.oid=inserted.oid)
	begin
		select @errno  = 50003,@errmsg = 'no such order id, cant modify.'
        goto error
	end
	if not exists(select * from PRODUCT ,inserted where PRODUCT.pid=inserted.pid)
	begin
		select @errno  = 50003,@errmsg = 'no such product id, cant modify.'
        goto error
	end
	print 'orderitem updated'
    return

/*  Errors handling  */
error:
    exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
    rollback  transaction
	insert into trace values(SYSTEM_USER,USER,'orderitems','update',GETDATE());
end
go