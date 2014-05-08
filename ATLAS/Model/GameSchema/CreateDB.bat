@echo off
set juegoID=%1
sqlcmd -S .\SQLEXPRESS -i 000.CreateDB.sql -v dbname="Juego%juegoID%"
pushd "DB"
IF EXIST "output.txt" del "output.txt"
type NUL > "output.txt"
for %%g in (*.sql) do (
sqlcmd -d "Juego%juegoID%" -S .\SQLEXPRESS -i "%%g" -o "%%g.txt"
echo ..................................................................................... >> "output.txt"
echo Executing: "%%g" >> "output.txt"
echo ..................................................................................... >> "output.txt"
copy "output.txt"+"%%g.txt" "output.txt"
del "%%g.txt"
)
popd