@echo off
echo Creating Views...
FOR %%I in (..\SQL\Views\*.sql) DO (
echo.
echo %%I 
sqlcmd %~1 -i %%I
echo.
)
echo --------------------------------------------------- 