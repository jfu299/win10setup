@echo off

:: DisableWindowsUpdate.bat
:: Custom Setup for Windows 10
:: 		https://github.com/jfu299/win10setup
:: 		https://raw.githubusercontent.com/jfu299/win10setup/main/DisableWindowsUpdate.bat
:: By: Justin Fu
:: Updated: April 20, 2022

:: --------------

:: IMPORTANT INFO: (Read before running this batch file)
:: Requires Admin Privileges
:: Does NOT require Restart to take effect
:: When run, this file will disable and stop the Windows Update Service (wuauserv)
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

net stop wuauserv

REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V Start /T REG_dWORD /D 4 /F

REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V ObjectName /D Administrators /F

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