@echo off
echo creating trace...
FOR %%I in (..\SQL\Trace\*.sql) DO (
echo.
echo %%I 
sqlcmd %~1 -i %%I
echo.
)
echo --------------------------------------------------- 