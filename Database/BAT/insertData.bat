@echo off
echo Inserting data...
echo.
echo ..\DATA\ManagerInsertion.sql
sqlcmd %~1 -i ..\DATA\ManagerInsertion.sql
echo.
echo.
echo ..\DATA\ProductInsertion.sql
sqlcmd %~1 -i ..\DATA\ProductInsertion.sql
echo.
echo.
echo ..\DATA\ClientInsertion.sql
sqlcmd %~1 -i ..\DATA\ClientInsertion.sql
echo.
echo.
echo --------------------------------------------------- 