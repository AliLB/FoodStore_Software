use foodDB
go
Create table trace(
loginname char(20) not null,
username char(20) not null,
tablename char(15) null,
operationtype char(15) null,
dtime datetime
)
go
--to track each client total orders
Create table totalorders(
Cid int,
TotalOrders int
)
go
create trigger TI_TOTALORDERS on totalorders instead of insert as
begin
set NOCOUNT ON
	if exists ( select T.Cid from totalorders T,inserted i where i.cid=T.cid)
	begin
		declare @TO int,@cid int
		set @TO=(select TotalOrders from inserted)
		set @CID=(select cid from inserted)
		update totalorders set TotalOrders=@TO+1 where cid=@cid
		return
	end
	insert into totalorders values((select cid from inserted),1)
    return
end
go