use foodDB
go

create trigger TI_CREDITCARD on CREDITCARD instead of insert as
begin
set nocount on
   declare
      @errno    int,
      @errmsg   varchar(255)
	if not exists(select * from client ,inserted where client.cid=inserted.cid)
	begin
		select @errno  = 50002,@errmsg = 'no such client id, cant insert.'         
        goto error
	end
	declare @ccnb int,@cct varchar(50),@cid int
	set @cid=(select cid from inserted)
	set @ccnb=(select ccnb from inserted)
	set @cct=(select cctype from inserted)
	insert into CREDITCARD values(@ccnb,@cid,@cct)
	print 'credit card insertion complete'
	return
/*  Errors handling  */
error:
    exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
	insert into trace values (SYSTEM_USER,USER,'creditcard','insert',GETDATE())
end
go

create trigger TU_CREDITCARD on CREDITCARD for update as
begin
set nocount on
   declare
      @errno    int,
      @errmsg   varchar(255)
	if not exists(select * from client ,inserted where client.cid=inserted.cid)
	begin
		select @errno  = 50003,@errmsg = 'no such client id, cant modify.'
        goto error
	end
	print 'credit card updated'
	return
	
/*  Errors handling  */
error:
    exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
    rollback  transaction
	insert into trace values (SYSTEM_USER,USER,'creditcard','update',GETDATE())
end
go