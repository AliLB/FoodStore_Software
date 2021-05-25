use foodDB
go

CREATE FUNCTION getpid (@name varchar(50))
returns int
begin
	declare @pid int
	set @pid=(select pid from product where pname=@name)
	if(@pid=null) 
	begin
		exec Printing 'no such product'
		return 0
	end
	return @pid
end
go