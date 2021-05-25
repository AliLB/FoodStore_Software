use foodDB
go

create trigger TI_Client on Client instead of insert as
begin
set nocount on
    declare
       @errno    int,
       @errmsg   varchar(255)

	if exists ( select * from Client C,inserted i where i.Cname=C.Cname)
		begin
			select @errno  = 50002,
                    @errmsg = 'username exist choose another.'
             goto error
		end
	if exists ( select * from Manager M,inserted i where i.Cname=M.Mname)
		begin
			select @errno  = 50002,
                    @errmsg = 'username exist choose another.'
             goto error
		end
	if exists ( select * from Client C,inserted i where i.email=C.email)
		begin
			select @errno  = 50002,
                    @errmsg = 'email exist choose another.'
             goto error
		end
	if exists ( select * from inserted i,Manager M where i.EMAIL=M.EMAIL)
		begin
			select @errno  = 50002,
                    @errmsg = 'email exist choose another.'
             goto error
		end
	declare @name varchar(50),@pass varbinary(20),@email varchar(100)
	set @name=(select Cname from inserted)
	set @pass=(select Cpass from inserted)
	set @email=(select email from inserted)
	insert into Client values(@name,@pass,@email)
	print 'Client insertion complete'
    return
/*  Errors handling  */
error:
	exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
	insert into trace values (SYSTEM_USER,USER,'Client','insert',GETDATE())
end
go