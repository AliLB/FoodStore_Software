@echo off
echo creating Roles and Users...
FOR %%I in (..\SQL\RolesAndUsers\*.sql) DO (
echo.
echo %%I 
sqlcmd %~1 -i %%I
echo.
)
echo --------------------------------------------------- 