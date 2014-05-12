@echo off
set serverName=%1
set gameID=%2
set schemaPath=%3
IF [%gameID%]==[] (
echo Value Missing
pause
Exit
)
IF [%schemaPath%]==[] (
set schemaPath=..\Model\GameSchema
)
pushd %schemaPath%
sqlcmd -S .\%serverName% -i CreateDB.sql -v dbname="Game%gameID%"
popd
pushd %schemaPath%\DB
for %%g in (*.sql) do (
sqlcmd -d "Game%gameID%" -S .\%serverName% -i "%%g"
)
popd
if errorlevel 1 pause