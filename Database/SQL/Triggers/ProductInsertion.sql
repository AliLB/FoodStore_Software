use foodDB
go

create trigger TI_Product on Product instead of insert as
begin
set nocount on
    declare
       @errno    int,
       @errmsg   varchar(255)

	if exists ( select * from Product P,inserted i where i.Pname=P.Pname)
		begin
			select @errno  = 50002,
                    @errmsg = 'Product name exist choose another.'
             goto error
		end
	declare @name varchar(50),@image varchar(200),@price float,@type varchar(50)
	set @name=(select Pname from inserted)
	set @image=(select Pimage from inserted)
	set @price=(select Pprice from inserted)
	set @type=(select Ptype from inserted)
	insert into Product values(@type,@name,@price,@image)
	print 'Product insertion complete'
    return
/*  Errors handling  */
error:
	exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
	insert into trace values (SYSTEM_USER,USER,'Product','insert',GETDATE())
end
go