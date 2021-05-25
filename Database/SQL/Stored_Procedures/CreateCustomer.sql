use foodDB
go 
CREATE PROCEDURE createCus @name nvarchar(50),@pass varchar(50),@email nvarchar(100)
AS
set nocount on
insert into client values(@name,HASHBYTES('SHA1',@pass),@email)
declare @cid int,@deliveryID int
declare @DID table (DID int)
set @cid=(select cid from CLIENT where cname=@name)
INSERT INTO Deliveryinfo (telephonenb,location) output inserted.did into @did VALUES (null,null)
set @deliveryID=(select * from @DID)
insert into orders values(@cid,@deliveryID,0)
GO