@echo off
pushd ..\Model\PlatformSchema
sqlcmd -S .\SQLEXPRESS -i CreateDB.sql -v dbname="Platform"
popd
pushd ..\Model\PlatformSchema\DB
for %%g in (*.sql) do (
sqlcmd -d "Platform" -S .\SQLEXPRESS -i "%%g"
)
popd
if errorlevel 1 pause