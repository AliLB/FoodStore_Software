use foodDB
go

CREATE PROCEDURE deleteCus @name nvarchar(50)
AS
set nocount on
declare @cid int,@oid int
set @cid=(select cid from CLIENT where cname=@name)
set @oid=(select oid from orders where cid=@cid)
delete from CreditCard where cid=@cid
delete from DELIVERYINFO where did=(select did from orders where oid=@oid)
delete from ORDERITEMS where oid=@oid
delete from ORDERS where oid=@oid
delete from CLIENT where cid=@cid
print 'client deletion completed'
GO