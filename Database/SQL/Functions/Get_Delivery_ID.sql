use foodDB
go

CREATE FUNCTION getdid (@cid int)
returns int
begin
	declare @did int
	set @did=(select did from orders where cid=@cid)
	if(@did=null) 
	begin
		return 0
	end
	return @did
end
go