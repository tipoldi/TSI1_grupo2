@echo off
pushd ..\Model\GameSchema
sqlcmd -S .\SQLEXPRESS -i DeleteDB.sql -v dbname="Platform"
popd
if errorlevel 1 pause