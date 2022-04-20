@echo off

:: EnableWindowsUpdate.bat
:: Custom Setup for Windows 10
:: 		https://github.com/jfu299/win10setup
:: 		https://raw.githubusercontent.com/jfu299/win10setup/main/EnableWindowsUpdate.bat
:: By: Justin Fu
:: Updated: April 20, 2022

:: --------------

:: IMPORTANT INFO: (Read before running this batch file)
:: Requires Admin Privileges
:: Requires Restart to take effect
:: When run, this file will enable and start the Windows Update Service (wuauserv)
:: This does NOT affect the Windows Update Medic Service (WaaSMedicSvc)
::      - See setup.bat and othersetup.txt to disable Windows Update Medic Service

:: --------------
:: Admin Privileges Check
echo Checking for Admin Privileges:
echo.
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Administrator Privileges Detected
    goto adminsuccess
) ELSE (
    echo Administrator Privileges NOT Detected
    goto adminfailed
)

:: --------------
:: Disable Windows Update

:adminsuccess

REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V Start /T REG_dWORD /D 3 /F

REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V ObjectName /D LocalSystem /F

net start wuauserv

goto RestartPrompt

:: --------------
:: Non-Admin Message

:adminfailed
echo.
echo -------
echo.
echo This batch file requires admin permission
echo.
echo Press Any Key to End
echo.
echo -------
echo.
PAUSE
goto :EOF

:: --------------
:: Restart Prompt

:RestartPrompt
echo.
echo ---------------------
echo.
echo A Restart is Recommended
echo.
echo If you want to restart the computer, it will restart in 10 seconds after answering the prompt
echo To cancel a Restart, type shutdown /a on Command Prompt, Powershell, or Run
echo.
echo ---------------------
echo.

set /p op="Restart Computer? (y/n) "
if "%op%"=="y" goto RestartComputer
if "%op%"=="yes" goto RestartComputer
if "%op%"=="Yes" goto RestartComputer
if "%op%"=="Y" goto RestartComputer
if "%op%"=="YES" goto RestartComputer

if "%op%"=="n" goto NoRestart
if "%op%"=="no" goto NoRestart
if "%op%"=="No" goto NoRestart
if "%op%"=="N" goto NoRestart
if "%op%"=="NO" goto NoRestart

:: -------

echo.
echo -------
echo.
echo INVALID OPTION - Computer will NOT be Restarted
goto end

:: -------

:NoRestart
echo.
echo -------
echo.
echo Computer will NOT be Restarted
goto end

:: --------------
:: Restart Computer
:RestartComputer
echo.
echo -------
echo.
shutdown /r /f /t 10
echo Restarting in 10 Seconds ...
echo.
echo TO CANCEL RESTART: shutdown /a
echo.
echo -------
echo.
PAUSE
goto :EOF

:: --------------
:: End Message
:end
echo.
echo -------
echo.
echo Press Any Key to End
echo.
echo -------
echo.
PAUSE

goto :EOF

:: --------------