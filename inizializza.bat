@echo off
cls
echo Verifica dell'installazione di Python...

where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python non e' installato. Installazione di Python...
    powershell -command "& { Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe' -OutFile '%TEMP%\python-installer.exe' }"
    powershell -command "& { Start-Process '%TEMP%\python-installer.exe' -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait }"
    del %TEMP%\python-installer.exe
)

echo Installazione dei pacchetti Python necessari...
pip install fifteen_puzzle_solvers
pip install watchdog

echo Avvio dello script in background...
start "" /B python risolutore.py

echo Lo script Python è stato avviato in background. Puoi chiudere questa finestra del prompt dei comandi.
pause
