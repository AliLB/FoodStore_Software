use foodDB
go

CREATE FUNCTION getoid (@cid int)
returns int
begin
	declare @oid int
	set @oid=(select oid from orders where cid=@cid)
	if(@oid=null) 
	begin
		return 0
	end
	return @oid
end
go