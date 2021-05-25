use foodDB
go

CREATE FUNCTION getcid (@name varchar(50))
returns int
begin
	declare @cid int
	set @cid=(select cid from client where cname=@name)
	if(@cid=null) 
	begin
		exec Printing 'no such client'
		return 0
	end
	return @cid
end
go