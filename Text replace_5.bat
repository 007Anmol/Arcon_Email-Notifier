@echo off
setlocal

:: === CONFIGURATION ===
set "TOOL=E:\Executor\Executor\MySQL_Utility\textReplace.exe"
set "FOLDER=E:\DBSCRIPTS\1.SchemaChanges"
set "FIND=arcosdb"
set "REPLACE=arcosdb_u16sp2_websm_qa"

:: === VERIFY INPUT PATH EXISTS ===
if not exist "%FOLDER%" (
    echo [ERROR] Folder does not exist: %FOLDER%
    pause
    exit /b 1
)

:: === CREATE A TEMP INPUT FILE WITHOUT TRAILING CHARACTERS ===
set "INPUT_FILE=%TEMP%\textreplace_input.txt"
> "%INPUT_FILE%" (
    <nul set /p="%FOLDER%" & echo.
    <nul set /p="%FIND%" & echo.
    <nul set /p="%REPLACE%" & echo.
)

:: === RUN THE TEXT REPLACE TOOL ===
"%TOOL%" < "%INPUT_FILE%"

:: === CLEAN UP ===
del "%INPUT_FILE%" >nul 2>&1

echo.
echo [SUCCESS] textReplace.exe executed with inputs.
pause
endlocal
