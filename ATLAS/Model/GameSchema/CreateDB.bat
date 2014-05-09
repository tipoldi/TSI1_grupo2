@echo off
set juegoID=%1
sqlcmd -S .\SQLEXPRESS -i 000.CreateDB.sql -v dbname="Juego%juegoID%"
pushd "DB"
for %%g in (*.sql) do (
sqlcmd -d "Juego%juegoID%" -S .\SQLEXPRESS -i "%%g"
)
popd
if errorlevel 1 pause