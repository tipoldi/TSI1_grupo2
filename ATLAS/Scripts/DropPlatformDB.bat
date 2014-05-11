@echo off
set serverName=%1
pushd ..\Model\GameSchema
sqlcmd -S .\%serverName% -i DeleteDB.sql -v dbname="Platform"
popd
if errorlevel 1 pause