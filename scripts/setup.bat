@echo off
REM Windows: create venv and install dependencies.
REM Tries `py -3` first (Python launcher), then falls back to `python`.
setlocal

set VENV=.venv
set PYEXE=

REM Prefer the Python launcher (avoids the Microsoft Store stub).
where py >nul 2>&1
if %errorlevel%==0 (
    set "PYEXE=py -3"
) else (
    where python >nul 2>&1
    if %errorlevel%==0 (
        set "PYEXE=python"
    )
)

if "%PYEXE%"=="" (
    echo.
    echo ERROR: Python was not found on PATH.
    echo Install Python 3 from https://www.python.org/downloads/windows/
    echo and make sure "Add python.exe to PATH" is checked during install.
    exit /b 1
)

if not exist "%VENV%" (
    echo Creating virtual environment in %VENV% using %PYEXE% ...
    %PYEXE% -m venv "%VENV%"
    if errorlevel 1 (
        echo Failed to create virtual environment.
        exit /b 1
    )
)

echo Upgrading pip ...
"%VENV%\Scripts\python.exe" -m pip install --upgrade pip
if errorlevel 1 exit /b 1

echo Installing dependencies from requirements.txt ...
"%VENV%\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 exit /b 1

echo.
echo Setup complete. Run the app with: scripts\run.bat
endlocal
