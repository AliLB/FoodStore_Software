use foodDB
go

CREATE PROCEDURE createMan @name nvarchar(50),@pass varchar(50),@email nvarchar(100),@isM int
AS
set nocount on
insert into MANAGER values(@name,HASHBYTES('SHA1',@pass),@email,@isM)
GO