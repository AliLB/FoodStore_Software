use foodDB
go

CREATE PROCEDURE Printing @name nvarchar(50)
AS
print @name
GO