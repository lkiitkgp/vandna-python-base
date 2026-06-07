@echo off
REM Windows: run the application using the venv's Python.
setlocal

set VENV=.venv
set APP=src\main.py

if not exist "%VENV%\Scripts\python.exe" (
    echo Virtual environment not found. Run scripts\setup.bat first.
    exit /b 1
)

"%VENV%\Scripts\python.exe" %APP% %*
endlocal
