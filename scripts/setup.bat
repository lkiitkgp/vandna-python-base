@echo off
REM Windows: create venv and install dependencies.
setlocal

set VENV=.venv

if not exist "%VENV%" (
    echo Creating virtual environment in %VENV% ...
    python -m venv "%VENV%"
    if errorlevel 1 (
        echo Failed to create virtual environment.
        exit /b 1
    )
)

echo Upgrading pip ...
"%VENV%\Scripts\python.exe" -m pip install --upgrade pip
if errorlevel 1 exit /b 1

echo Installing dependencies from requirements.txt ...
"%VENV%\Scripts\pip.exe" install -r requirements.txt
if errorlevel 1 exit /b 1

echo.
echo Setup complete. Run the app with: scripts\run.bat
endlocal
