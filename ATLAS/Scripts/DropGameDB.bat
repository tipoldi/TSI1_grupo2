@echo off
set serverName=%1
set gameID=%2
IF [%1]==[] (
echo Value Missing
pause
Exit
)
pushd ..\Model\GameSchema
sqlcmd -S .\%serverName% -i DeleteDB.sql -v dbname="Game%gameID%"
popd
if errorlevel 1 pause