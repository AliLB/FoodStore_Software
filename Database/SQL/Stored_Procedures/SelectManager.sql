use foodDB
go 

CREATE PROCEDURE SelectManager @name nvarchar(50),@pass varchar(50)
AS
SELECT * FROM Manager where Mname=@name and Mpass=HASHBYTES('SHA1',@pass)
GO