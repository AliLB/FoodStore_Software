use foodDB
go

create procedure updateMpass @id int, @pass varchar(50)
as
set nocount on
if not exists(select * from manager where mid=@id)
begin
	print 'no such id for any manager'
	return
end
	update Manager set Mpass=HASHBYTES('SHA1',@pass) where mid=@id
	print 'manager password changed'
go