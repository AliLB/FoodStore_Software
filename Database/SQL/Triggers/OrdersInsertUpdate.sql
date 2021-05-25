use foodDB
go

create trigger TI_ORDERS on ORDERS for insert as
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
	if not exists(select * from DELIVERYINFO ,inserted where DELIVERYINFO.did=inserted.did)
	begin
		select @errno  = 50002,@errmsg = 'no such deliveryinfo id, cant insert.'
        goto error
	end
    return
	
/*  Errors handling  */
error:
    exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
    rollback  transaction
	insert into trace values(SYSTEM_USER,USER,'orders','insert',GETDATE());
end
go


create trigger TU_ORDERS on ORDERS for update as
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
	if not exists(select * from DELIVERYINFO ,inserted where DELIVERYINFO.did=inserted.did)
	begin
		select @errno  = 50003,@errmsg = 'no such deliveryinfo id, cant modify.'
        goto error
	end
    return
	
/*  Errors handling  */
error:
    exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
    rollback  transaction
	insert into trace values(SYSTEM_USER,USER,'orders','update',GETDATE());
end
go