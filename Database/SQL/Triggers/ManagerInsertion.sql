use foodDB
go

create trigger TI_Manager on Manager instead of insert as
begin
set nocount on
    declare
       @errno    int,
       @errmsg   varchar(255)

		if exists ( select * from Client C,inserted i where i.Mname=C.Cname)
		begin
			select @errno  = 50002,
                    @errmsg = 'username exist choose another.'
             goto error
		end
	if exists ( select * from Manager M,inserted i where i.Mname=M.Mname)
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
	if exists ( select * from Manager M,inserted i where i.isMaster=M.isMaster and M.isMaster=1)
		begin
			select @errno  = 50002,
                    @errmsg = 'only one master can be created.'
             goto error
		end
	declare @name varchar(50),@pass varbinary(20),@email varchar(100),@isM int
	set @name=(select Mname from inserted)
	set @pass=(select Mpass from inserted)
	set @email=(select email from inserted)
	set @isM=(select isMaster from inserted)
	insert into Manager values(@name,@pass,@email,@isM)
	print 'Manager insertion complete'
    return

/*  Errors handling  */
error:
	exec sp_addmessage @errno,16,@errmsg
    raiserror (@errno,16,1)
	insert into trace values (SYSTEM_USER,USER,'Manager','insert',GETDATE())
end
go