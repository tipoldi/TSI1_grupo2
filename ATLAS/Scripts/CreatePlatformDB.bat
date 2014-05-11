@echo off
set serverName=%1
pushd ..\Model\PlatformSchema
sqlcmd -S .\%serverName% -i CreateDB.sql -v dbname="Platform"
popd
pushd ..\Model\PlatformSchema\DB
for %%g in (*.sql) do (
sqlcmd -d "Platform" -S .\%serverName% -i "%%g"
)
popd
if errorlevel 1 pause