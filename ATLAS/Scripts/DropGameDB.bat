@echo off
set serverName=%1
set gameID=%2
set schemaPath=%3
IF [%1]==[] (
echo Value Missing
pause
Exit
)
IF [%schemaPath%]==[] (
set schemaPath=..\Model\GameSchema
)
pushd %schemaPath%
sqlcmd -S .\%serverName% -i DeleteDB.sql -v dbname="Game%gameID%"
popd
if errorlevel 1 pause