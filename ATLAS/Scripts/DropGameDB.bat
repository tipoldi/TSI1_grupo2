@echo off
set gameID=%1
IF [%1]==[] (
echo Value Missing
pause
Exit
)
pushd ..\Model\GameSchema
sqlcmd -S .\SQLEXPRESS -i DeleteDB.sql -v dbname="Game%gameID%"
popd
if errorlevel 1 pause