use foodDB
go

create procedure updateCpass @id int, @pass varchar(50)
as
set nocount on
if not exists(select * from manager where mid=@id)
begin
	print 'no such id for any client'
	return
end
	update client set Cpass=HASHBYTES('SHA1',@pass) where cid=@id
	print 'client password changed'
go