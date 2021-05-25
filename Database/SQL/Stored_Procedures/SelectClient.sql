use foodDB
go

CREATE PROCEDURE SelectClient @name nvarchar(50),@pass varchar(50)
AS
SELECT * FROM Client where Cname=@name and Cpass=HASHBYTES('SHA1',@pass)
GO