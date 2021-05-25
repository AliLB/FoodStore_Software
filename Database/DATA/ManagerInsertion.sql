use foodDB
go
set nocount on
exec createMan @name='master',@pass='madmin',@email='AbuAli.Way@outlook.com',@isM=1
exec createMan @name='admin',@pass='admin',@email='admin@hotmail.com',@isM=0
exec createMan @name='dbouk',@pass='database',@email='dbouk@gmail.com',@isM=0