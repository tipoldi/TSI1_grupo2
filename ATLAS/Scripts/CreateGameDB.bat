@echo off
set gameID=%1
IF [%1]==[] (
echo Value Missing
pause
Exit
)
pushd ..\Model\GameSchema
sqlcmd -S .\SQLEXPRESS -i 000.CreateDB.sql -v dbname="Game%gameID%"
popd
pushd ..\Model\GameSchema\DB
for %%g in (*.sql) do (
sqlcmd -d "Game%gameID%" -S .\SQLEXPRESS -i "%%g"
)
popd
if errorlevel 1 pause