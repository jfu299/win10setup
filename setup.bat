@echo OFF

:: setup.bat
:: Custom Setup for Windows 10
:: 		https://github.com/jfu299/win10setup
:: 		https://raw.githubusercontent.com/jfu299/win10setup/main/setup.bat
:: By: Justin Fu
:: Updated: May 28, 2022

echo.
echo -------
echo Custom Setup for Windows 10
echo 	https://github.com/jfu299/win10setup
echo 	https://raw.githubusercontent.com/jfu299/win10setup/main/setup.bat
echo By: Justin Fu
echo Updated: May 28, 2022
echo -------
echo.

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

:adminsuccess
echo.
echo -------
echo.
echo MAKE SURE YOU READ THIS BATCH FILE BEFORE YOU RUN IT - THIS BATCH FILE WILL CHANGE MANY SETTINGS
echo.
echo -------
PAUSE

:: --------------
:firstMenu
echo -------
echo.
echo Select an option:
echo.
echo 1) MAIN
echo.
echo 2) Other Options
echo.
echo 3) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto mainFile
if "%op%"=="2" goto mainMenu

if "%op%"=="3" goto end
if "%op%"=="N" goto end
if "%op%"=="n" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

:: Error Message if a valid choice is not selected
echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto firstMenu
:: --------------
:mainMenu
echo -------
echo Select an option:
echo.
echo 1) MAIN
echo.
echo 2) Windows 10 Update Options
echo.
echo 3) Web Browser Policies Setup
echo.
echo 4) Enable/Disable OneDrive
echo.
echo 5) Remove Microsoft Edge
echo.
echo 6) Username Visibility
echo.
echo 7) Ctrl-Alt-Del Options
echo.
echo 8) Extra Policies to lock down user account
echo.
echo 9) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto mainFile
if "%op%"=="2" goto option2
if "%op%"=="3" goto option3
if "%op%"=="4" goto option4
if "%op%"=="5" goto option5
if "%op%"=="6" goto option6
if "%op%"=="7" goto option7
if "%op%"=="8" goto option8

if "%op%"=="9" goto end
if "%op%"=="N" goto end
if "%op%"=="n" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

:: Error Message if a valid choice is not selected
echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto mainMenu
:: ------------------------------------------------------------------------------------
:option2
echo -------
echo.
echo You have selected Option 2: Windows 10 Update Options
:option2redo
echo.
echo ------- IMPORTANT ----------
echo.
echo Please notice to set updates to manual or disabled you must stop the
echo Windows 10 Medic Service (WaaSMedicSvc) through the registry and
echo take ownership and disable access to everyone to the WaaSMedicSvc registry key
echo (HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc)
echo.
echo ----------------------------
echo.
echo Select a task:
echo.
echo 1) Manual Updates
echo.
echo 2) Disable Updates
echo.
echo 3) (Windows 10 Pro Only) Disable Access to Update in Settings
echo.
echo 4) (Windows 10 Pro Only) Enable Access to Update in Settings
echo.
echo 5) Return
echo.
echo 6) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option2.1
if "%op%"=="2" goto option2.2
if "%op%"=="3" goto option2.3
if "%op%"=="4" goto option2.4

if "%op%"=="5" goto mainMenu
if "%op%"=="6" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option2redo

:: --------------
:option2.1
echo.
echo -------
echo.

:option2.1redo

set /p op="Set Manual Updates? (y/n) "
if "%op%"=="y" goto option2.1Start
if "%op%"=="yes" goto option2.1Start
if "%op%"=="Yes" goto option2.1Start
if "%op%"=="Y" goto option2.1Start
if "%op%"=="YES" goto option2.1Start

if "%op%"=="n" goto option2
if "%op%"=="no" goto option2
if "%op%"=="No" goto option2
if "%op%"=="N" goto option2
if "%op%"=="NO" goto option2

if "%op%"=="cancel" goto option2
if "%op%"=="Cancel" goto option2
if "%op%"=="CANCEL" goto option2

if "%op%"=="stop" goto option2
if "%op%"=="Stop" goto option2
if "%op%"=="STOP" goto option2

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option2.1redo

:: --------------

:option2.2
echo.
echo -------
echo.

:option2.2redo

set /p op="Set Disable Updates? (y/n) "
if "%op%"=="y" goto option2.2Start
if "%op%"=="yes" goto option2.2Start
if "%op%"=="Yes" goto option2.2Start
if "%op%"=="Y" goto option2.2Start
if "%op%"=="YES" goto option2.2Start

if "%op%"=="n" goto option2
if "%op%"=="no" goto option2
if "%op%"=="No" goto option2
if "%op%"=="N" goto option2
if "%op%"=="NO" goto option2

if "%op%"=="cancel" goto option2
if "%op%"=="Cancel" goto option2
if "%op%"=="CANCEL" goto option2

if "%op%"=="stop" goto option2
if "%op%"=="Stop" goto option2
if "%op%"=="STOP" goto option2

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option2.2redo

:: --------------

:option2.3
echo.
echo -------
echo.

:option2.3redo

set /p op="(Windows 10 Pro Only) Disable Access to Update in Settings? (y/n) "
if "%op%"=="y" goto option2.3Start
if "%op%"=="yes" goto option2.3Start
if "%op%"=="Yes" goto option2.3Start
if "%op%"=="Y" goto option2.3Start
if "%op%"=="YES" goto option2.3Start

if "%op%"=="n" goto option2
if "%op%"=="no" goto option2
if "%op%"=="No" goto option2
if "%op%"=="N" goto option2
if "%op%"=="NO" goto option2

if "%op%"=="cancel" goto option2
if "%op%"=="Cancel" goto option2
if "%op%"=="CANCEL" goto option2

if "%op%"=="stop" goto option2
if "%op%"=="Stop" goto option2
if "%op%"=="STOP" goto option2

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option2.3redo

:: --------------

:option2.4
echo.
echo -------
echo.

:option2.4redo

set /p op="(Windows 10 Pro Only) Enable Access to Update in Settings? (y/n) "
if "%op%"=="y" goto option2.4Start
if "%op%"=="yes" goto option2.4Start
if "%op%"=="Yes" goto option2.4Start
if "%op%"=="Y" goto option2.4Start
if "%op%"=="YES" goto option2.4Start

if "%op%"=="n" goto option2
if "%op%"=="no" goto option2
if "%op%"=="No" goto option2
if "%op%"=="N" goto option2
if "%op%"=="NO" goto option2

if "%op%"=="cancel" goto option2
if "%op%"=="Cancel" goto option2
if "%op%"=="CANCEL" goto option2

if "%op%"=="stop" goto option2
if "%op%"=="Stop" goto option2
if "%op%"=="STOP" goto option2

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option2.4redo

:: --------------
:option2.1Start
@echo ON
:: -------
:: See Windows 10 Updates Partial Control on Main (Same Thing)
:: Target Release Version (Version 21H2)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ProductVersion /T REG_SZ /D "Windows 10" /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D "21H2" /F
:: Defer Updates (Windows Update for Business)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdatesPeriodInDays /T REG_dWORD /D 365 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdatesPeriodInDays /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuilds /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuildsPolicyValue /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableWUfBSafeguards /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /V IsWUfBConfigured /T REG_dWORD /D 1 /F
:: Current Branch Readiness (Semi-Annual Channel for 1903 and above)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V BranchReadinessLevel /T REG_dWORD /D 1 /F
:: Disable Wake Timers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AUPowerManagement /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance" /V WakeUp /T REG_dWORD /D 0 /F
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg -attributes SUB_SLEEP BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D +ATTRIB_HIDE
:: No Windows Update Taskbar Notification
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V TrayIconVisibility /T REG_dWORD /D 0 /F
:: Disable Automatic Active Hours
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V SmartActiveHoursState /T REG_dWORD /D 2 /F
:: Maximum Active Hours
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetActiveHoursMaxRange /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursMaxRange /T REG_dWORD /D 18 /F
:: Set Active Hours
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetActiveHours /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursStart /T REG_dWORD /D 7 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursEnd /T REG_dWORD /D 1 /F
:: Disable Upgrade Message to Windows 10 on Windows 7, Windows 8, and Windows 8.1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableOSUpgrade /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /V DisableOSUpgrade /T REG_dWORD /D 1 /F
:: Disable Delivery Optimization
:: HEX: 64 DECIMAL: 100
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /V DODownloadMode /T REG_dWORD /D 100 /F
:: Pause Updates Indefinitely
:: HEX: 96520 DECIMAL: 615712
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V FlightSettingsMaxPauseDays /T REG_dWORD /D 615712 /F
:: Disable Microsoft Edge Chromium Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F
:: Disable Windows Update Medic Service
net stop WaaSMedicSvc
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /V ObjectName /T REG_SZ /D Administrators /F
:: No Auto Reboot
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAutoRebootWithLoggedOnUsers /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAUShutdownOption /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAUAsDefaultShutdownOption /T REG_dWORD /D 1 /F
:: No Metered Connections
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AllowAutoWindowsUpdateDownloadOverMeteredNetwork /T REG_dWORD /D 0 /F
:: Windows 10 Manual Update
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V AUOptions /T REG_dWORD /D 2 /F
:: --- Manual Update Start
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V Start /T REG_dWORD /D 3 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V ObjectName /T REG_SZ /D LocalSystem /F
@echo OFF
goto option2
:: --------------
:option2.2Start
@echo ON
:: See Windows 10 Updates Partial Control on Main (Same Thing)
:: Target Release Version (Version 21H2)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ProductVersion /T REG_SZ /D "Windows 10" /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D "21H2" /F
:: Defer Updates (Windows Update for Business)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdatesPeriodInDays /T REG_dWORD /D 365 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdatesPeriodInDays /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuilds /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuildsPolicyValue /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableWUfBSafeguards /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /V IsWUfBConfigured /T REG_dWORD /D 1 /F
:: Current Branch Readiness (Semi-Annual Channel for 1903 and above)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V BranchReadinessLevel /T REG_dWORD /D 1 /F
:: Disable Wake Timers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AUPowerManagement /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance" /V WakeUp /T REG_dWORD /D 0 /F
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg -attributes SUB_SLEEP BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D +ATTRIB_HIDE
:: No Windows Update Taskbar Notification
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V TrayIconVisibility /T REG_dWORD /D 0 /F
:: Disable Automatic Active Hours
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V SmartActiveHoursState /T REG_dWORD /D 2 /F
:: Maximum Active Hours
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetActiveHoursMaxRange /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursMaxRange /T REG_dWORD /D 18 /F
:: Set Active Hours
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetActiveHours /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursStart /T REG_dWORD /D 7 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursEnd /T REG_dWORD /D 1 /F
:: Disable Upgrade Message to Windows 10 on Windows 7, Windows 8, and Windows 8.1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableOSUpgrade /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /V DisableOSUpgrade /T REG_dWORD /D 1 /F
:: Disable Delivery Optimization
:: HEX: 64 DECIMAL: 100
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /V DODownloadMode /T REG_dWORD /D 100 /F
:: Pause Updates Indefinitely
:: HEX: 96520 DECIMAL: 615712
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V FlightSettingsMaxPauseDays /T REG_dWORD /D 615712 /F
:: Disable Microsoft Edge Chromium Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F
:: Disable Windows Update Medic Service
net stop WaaSMedicSvc
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /V ObjectName /T REG_SZ /D Administrators /F
:: No Auto Reboot
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAutoRebootWithLoggedOnUsers /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAUShutdownOption /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAUAsDefaultShutdownOption /T REG_dWORD /D 1 /F
:: No Metered Connections
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AllowAutoWindowsUpdateDownloadOverMeteredNetwork /T REG_dWORD /D 0 /F
:: Windows 10 Manual Update
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V AUOptions /T REG_dWORD /D 2 /F
:: -------
:: --- Disable Update Start
net stop wuauserv
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V ObjectName /T REG_SZ /D Administrators /F
@echo OFF
goto option2
:: --------------
:option2.3Start
@echo ON
:: Windows 10 Disable Access to Update in Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetDisableUXWUAccess /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetDisablePauseUXAccess /T REG_dWORD /D 1 /F
@echo OFF
goto option2
:: --------------
:option2.4Start
:: Windows 10 Undo Disable Access to Update in Settings
@echo ON
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetDisableUXWUAccess /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetDisablePauseUXAccess /T REG_dWORD /D 0 /F
@echo OFF
goto option2
:: ------------------------------------------------------------------------------------
:: Web Browser Policies Setup
:option3
echo -------
echo.
echo You have selected Option 3: Web Browser Policies Setup for Chrome, Chromium, Firefox, and Microsoft Edge Chromium
:option3redo
echo.
echo Select a task:
echo.
echo ----------------------------
echo.
echo Web Browser Policies for Chrome, Chromium, Firefox, Microsoft Edge Chromium, Microsoft Edge Legacy, and Internet Explorer
echo It is not recommended to use Internet Explorer or the Legacy (non-Chromium) Microsoft Edge
echo.
echo ----------------------------
echo.
echo 1) (Already included in Main) Web Browser Enterprise Policies
echo.
echo 2) Block Install of Extensions/Addons
echo.
echo 3) Allow Install of Extensions/Addons
echo.
echo 4) Return
echo.
echo 5) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option3.1
if "%op%"=="2" goto option3.2
if "%op%"=="3" goto option3.3

if "%op%"=="4" goto mainMenu
if "%op%"=="5" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option3redo

:: --------------
:option3.1
echo.
echo -------
echo.

:option3.1redo

set /p op="(Already included in Main) Set Web Browser Enterprise Policies? (y/n) "
if "%op%"=="y" goto option3.1Start
if "%op%"=="yes" goto option3.1Start
if "%op%"=="Yes" goto option3.1Start
if "%op%"=="Y" goto option3.1Start
if "%op%"=="YES" goto option3.1Start

if "%op%"=="n" goto option3
if "%op%"=="no" goto option3
if "%op%"=="No" goto option3
if "%op%"=="N" goto option3
if "%op%"=="NO" goto option3

if "%op%"=="cancel" goto option3
if "%op%"=="Cancel" goto option3
if "%op%"=="CANCEL" goto option3

if "%op%"=="stop" goto option3
if "%op%"=="Stop" goto option3
if "%op%"=="STOP" goto option3

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option3.1redo

:: --------------

:option3.2
echo.
echo -------
echo.

:option3.2redo

set /p op="Block Install of Extensions/Addons? (y/n) "
if "%op%"=="y" goto option3.2Start
if "%op%"=="yes" goto option3.2Start
if "%op%"=="Yes" goto option3.2Start
if "%op%"=="Y" goto option3.2Start
if "%op%"=="YES" goto option3.2Start

if "%op%"=="n" goto option3
if "%op%"=="no" goto option3
if "%op%"=="No" goto option3
if "%op%"=="N" goto option3
if "%op%"=="NO" goto option3

if "%op%"=="cancel" goto option3
if "%op%"=="Cancel" goto option3
if "%op%"=="CANCEL" goto option3

if "%op%"=="stop" goto option3
if "%op%"=="Stop" goto option3
if "%op%"=="STOP" goto option3

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option3.2redo

:: --------------

:option3.3
echo.
echo -------
echo.

:option3.3redo

set /p op="Allow Install of Extensions/Addons? (y/n) "
if "%op%"=="y" goto option3.3Start
if "%op%"=="yes" goto option3.3Start
if "%op%"=="Yes" goto option3.3Start
if "%op%"=="Y" goto option3.3Start
if "%op%"=="YES" goto option3.3Start

if "%op%"=="n" goto option3
if "%op%"=="no" goto option3
if "%op%"=="No" goto option3
if "%op%"=="N" goto option3
if "%op%"=="NO" goto option3

if "%op%"=="cancel" goto option3
if "%op%"=="Cancel" goto option3
if "%op%"=="CANCEL" goto option3

if "%op%"=="stop" goto option3
if "%op%"=="Stop" goto option3
if "%op%"=="STOP" goto option3

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option3.3redo

:: --------------
:option3.1Start
@echo ON

:: -----------------
:: Chrome
:: -----------------

:: -----
:: Extension Settings
:: 1) "Ublock Origin", 2) "SponsorBlock for YouTube - Skip Sponsorships", 3) "ClearURLs"
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
:: REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V HideWebStoreIcon /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
:: -----
:: CHROME: Auto Sign In
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BrowserSignin /T REG_dWORD /D 0 /F
:: -----
:: DNS Over HTTPS and Proxy
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DnsOverHttpsMode /T REG_SZ /D off /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V NetworkPredictionOptions /T REG_dWORD /D 2 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F
:: -----
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: -----
:: Settings Import
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultSensorsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PaymentMethodQueryEnabled /T REG_dWORD /D 0 /F
:: -----
:: URL Bar
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
:: Background Mode
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: PDF Files
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
:: Media
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AutoplayAllowed /T REG_dWORD /D 0 /F
:: -----
:: URL Blocklist
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\URLBlocklist" /V 1 /T REG_SZ /D "securly.com" /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\URLBlocklist" /V 2 /T REG_SZ /D "goguardian.com" /F
:: -----

:: -----------------
:: Chromium
:: -----------------

:: -----
:: Extension Settings
:: 1) "Ublock Origin", 2) "SponsorBlock for YouTube - Skip Sponsorships", 3) "ClearURLs"
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
:: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V HideWebStoreIcon /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
:: -----
:: CHROMIUM: Auto Sign In
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BrowserSignin /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SyncDisabled /T REG_dWORD /D 1 /F
:: -----
:: DNS Over HTTPS and Proxy
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DnsOverHttpsMode /T REG_SZ /D off /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V NetworkPredictionOptions /T REG_dWORD /D 2 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F
:: -----
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: -----
:: Settings Import
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ChromeCleanupEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultSensorsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PaymentMethodQueryEnabled /T REG_dWORD /D 0 /F
:: -----
:: URL Bar
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
:: Background Mode
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: PDF Files
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
:: Media
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AutoplayAllowed /T REG_dWORD /D 0 /F
:: -----
:: URL Blocklist
REG ADD "HKLM\SOFTWARE\Policies\Chromium\URLBlocklist" /V 1 /T REG_SZ /D "securly.com" /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\URLBlocklist" /V 2 /T REG_SZ /D "goguardian.com" /F
:: -----

:: -----------------
:: Firefox
:: -----------------

:: -----
:: Firefox Extension Settings and force-install
REG DELETE "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_MULTI_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi\"},\"bypasspaywalls@bypasspaywalls\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"allowed\"},\"treestyletab@piro.sakura.ne.jp\":{\"installation_mode\":\"allowed\"},\"adblock-for-ff-lite@addons\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{c8476e35-1a52-831c-487c-86db836cf38c}\":{\"installation_mode\":\"blocked\"},\"jid1-q4sG8pYhq8KGHs@jetpack\":{\"installation_mode\":\"blocked\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"},\"adguardadblocker@adguard.com\":{\"installation_mode\":\"blocked\"},\"{da6554a8-470c-4d6a-a6ca-904740683552}\":{\"installation_mode\":\"blocked\"},\"jid1-93CWPmRbVPjRQA@jetpack\":{\"installation_mode\":\"blocked\"},\"87677a2c52b84ad3a151a4a72f5bd3c4@jetpack\":{\"installation_mode\":\"blocked\"},\"{6601dd36-5bb6-4755-8cd5-f36b59ff5307}\":{\"installation_mode\":\"blocked\"},\"{01e4670b-532b-42ed-88c2-c7b46d05133a}\":{\"installation_mode\":\"blocked\"},\"languagetool-webextension@languagetool.org\":{\"installation_mode\":\"blocked\"},\"abb@amazon.com\":{\"installation_mode\":\"blocked\"},\"{0f929014-5ed2-4527-8b8d-86a9c889b129}\":{\"installation_mode\":\"blocked\"},\"{f9cacf2e-cafc-4f0f-b6ad-8e1a01b4b4d0}\":{\"installation_mode\":\"blocked\"},\"{45c15c03-6d29-45d2-984c-9f1ad34f3f51}\":{\"installation_mode\":\"blocked\"},\"browser@tunnelbear.com\":{\"installation_mode\":\"blocked\"},\"rebingerext@gmail.com\":{\"installation_mode\":\"blocked\"},\"ApplicationGuardRel@microsoft.com\":{\"installation_mode\":\"blocked\"},\"{cfa868c0-6239-47df-bc81-54e13151ec2e}\":{\"installation_mode\":\"blocked\"},\"{a07b7886-3015-4959-9a88-4273860edd6d}\":{\"installation_mode\":\"blocked\"},\"{7e39f3c8-2ef5-46ea-80d0-f8b8f72541c5}\":{\"installation_mode\":\"blocked\"},\"{23bcb1d2-a715-42e2-87c5-43ba10d23ace}\":{\"installation_mode\":\"blocked\"},\"{9b43dad5-885b-4f0d-882f-e945b7e4b96f}\":{\"installation_mode\":\"blocked\"},\"{8d8ca802-6b23-43ed-9445-e05d48579542}\":{\"installation_mode\":\"blocked\"}}" /F

:: Installed Extensions:
:: 1) uBlock Origin - uBlock0@raymondhill.net
::      https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi
:: 2) SponsorBlock for YouTube - sponsorBlocker@ajay.app
::      https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi
:: 3) Bypass Paywalls - bypasspaywalls@bypasspaywalls
::      https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi

:: Allowed Extensions:
:: 1) ClearURLs - {74145f27-f039-47ce-a470-a662b129930a}
::      https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi
:: 2) Tree Style Tabs - treestyletab@piro.sakura.ne.jp
::      https://addons.mozilla.org/firefox/downloads/latest/tree-style-tab/latest.xpi

:: (Other adblockers interfere with ublock origin)
:: Blocked Extension List
:: 1) Adblock: adblock-for-ff-lite@addons ; jid1-NIfFY2CA8fy1tg@jetpack ; {c8476e35-1a52-831c-487c-86db836cf38c} ; jid1-q4sG8pYhq8KGHs@jetpack
:: 2) Adblock Ultimate: adblockultimate@adblockultimate.net
:: 3) Adblock Plus: {d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}
:: 4) Adguard: adguardadblocker@adguard.com
:: 5) Proctor Test: {da6554a8-470c-4d6a-a6ca-904740683552}
:: 6) Honey: jid1-93CWPmRbVPjRQA@jetpack
:: 7) Grammarly: 87677a2c52b84ad3a151a4a72f5bd3c4@jetpack ; {6601dd36-5bb6-4755-8cd5-f36b59ff5307} ; {01e4670b-532b-42ed-88c2-c7b46d05133a} ; languagetool-webextension@languagetool.org
:: 8) Amazon Assistant: abb@amazon.com
:: 9) Nano Adblocker: {0f929014-5ed2-4527-8b8d-86a9c889b129}
:: 10) Nano Defender: {f9cacf2e-cafc-4f0f-b6ad-8e1a01b4b4d0}
:: 11) Hola: {45c15c03-6d29-45d2-984c-9f1ad34f3f51}
:: 12) TunnelBear: browser@tunnelbear.com
:: 13) ReBinger: rebingerext@gmail.com
:: 14) Microsoft Application Guard Extension: ApplicationGuardRel@microsoft.com
:: 15) Microsoft Bing Homepage: {cfa868c0-6239-47df-bc81-54e13151ec2e}
:: 16) Microsoft Bing Homepage and Search Engine: {a07b7886-3015-4959-9a88-4273860edd6d}
:: 17) MSN Homepage, New Tab and Bing Search Engine: {7e39f3c8-2ef5-46ea-80d0-f8b8f72541c5}
:: 18) MSN Homepage and New Tab: {23bcb1d2-a715-42e2-87c5-43ba10d23ace}
:: 19) MSN Homepage and Bing Search Engine: {9b43dad5-885b-4f0d-882f-e945b7e4b96f}
:: 20) Microsoft Bing Search Engine: {8d8ca802-6b23-43ed-9445-e05d48579542}
:: -----

:: About Config Preferences (about:config)
:: Uses setup.reg

REG DELETE "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V Preferences /F
regedit.exe /S %~dpn0.reg

:: -----

:: {"media.eme.enabled":{"Value":false,"Status":"locked"},"media.gmp-widevinecdm.enabled":{"Value":false,"Status":"locked"},"network.http.sendRefererHeader":{"Value":0,"Status":"locked"},"media.hardwaremediakeys.enabled":{"Value":false,"Status":"default"},"browser.search.suggest.enabled":{"Value":false,"Status":"locked"},"browser.search.suggest.enabled.private":{"Value":false,"Status":"locked"},"browser.search.log":{"Value":false,"Status":"locked"},"browser.search.hiddenOneOffs":{"Value":"Google,Amazon.com,Bing,DuckDuckGo,eBay,Wikipedia(en),Wikipedia,Wikipedia(en)","Status":"locked"},"browser.urlbar.groupLabels.enabled":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.bookmark":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.history":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.openpage":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.searches":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.topsites":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.engines":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.calculator":{"Value":false,"Status":"locked"},"browser.urlbar.update1.searchTips":{"Value":false,"Status":"locked"},"browser.urlbar.update1.interventions":{"Value":false,"Status":"locked"},"browser.urlbar.showSearchSuggestionsFirst":{"Value":false,"Status":"locked"},"browser.urlbar.sponsoredTopSites":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.quicksuggest":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.quicksuggest.sponsored":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.enabled":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.scenario":{"Value":"offline","Status":"locked"},"browser.urlbar.quicksuggest.remoteSettings.enabled":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.dataCollection.enabled":{"Value":false,"Status":"locked"},"datareporting.policy.dataSubmissionPolicyBypassNotification":{"Value":true,"Status":"locked"},"browser.urlbar.suggest.quicksuggest.nonsponsored":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.shouldShowOnboardingDialog":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.showOnboardingDialogAfterNRestarts":{"Value":0,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includeBookmarks":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includeDownloads":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includePocket":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includeVisited":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.default.sites":{"Value":"","Status":"locked"},"browser.newtabpage.activity-stream.showSponsored":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.showSponsoredTopSites":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned":{"Value":"","Status":"locked"},"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines":{"Value":"","Status":"locked"},"browser.contentblocking.report.vpn-promo.url":{"Value":"","Status":"locked"},"browser.privatebrowsing.infoEnabled":{"Value":false,"Status":"locked"},"browser.privatebrowsing.promoEnabled":{"Value":false,"Status":"locked"},"browser.privatebrowsing.vpnpromourl":{"Value":"","Status":"locked"},"browser.contentblocking.report.hide_vpn_banner":{"Value":true,"Status":"locked"},"browser.contentblocking.report.vpn.enabled":{"Value":false,"Status":"locked"},"browser.contentblocking.report.hide_lockwise_app":{"Value":true,"Status":"locked"},"browser.contentblocking.report.lockwise.enabled":{"Value":false,"Status":"locked"},"browser.contentblocking.report.monitor.enabled":{"Value":false,"Status":"locked"},"browser.contentblocking.report.show_mobile_app":{"Value":false,"Status":"locked"},"browser.aboutConfig.showWarning":{"Value":false,"Status":"default"},"browser.tabs.warnOnClose":{"Value":false,"Status":"default"},"browser.tabs.warnOnCloseOtherTabs":{"Value":false,"Status":"default"},"browser.urlbar.trimURLs":{"Value":false,"Status":"locked"},"extensions.htmlaboutaddons.recommendations.enabled":{"Value":false,"Status":"locked"},"extensions.htmlaboutaddons.discover.enabled":{"Value":false,"Status":"locked"},"extensions.getAddons.showPane":{"Value":false,"Status":"locked"},"extensions.pocket.onSaveRecs":{"Value":false,"Status":"locked"},"extensions.pocket.onSaveRecs.locales":{"Value":"","Status":"locked"},"extensions.pocket.showHome":{"Value":false,"Status":"locked"},"browser.tabs.crashReporting.sendReport":{"Value":false,"Status":"locked"},"geo.enabled":{"Value":false,"Status":"locked"},"geo.provider.ms-windows-location":{"Value":false,"Status":"locked"},"security.insecure_connection_text.enabled":{"Value":true,"Status":"locked"},"security.insecure_connection_text.pbmode.enabled":{"Value":true,"Status":"locked"},"security.warn_submit_secure_to_insecure":{"Value":true,"Status":"locked"},"security.mixed_content.block_active_content":{"Value":true,"Status":"locked"},"security.insecure_field_warning.contextual.enabled":{"Value":true,"Status":"locked"},"browser.safebrowsing.phishing.enabled":{"Value":true,"Status":"locked"},"browser.safebrowsing.malware.enabled":{"Value":true,"Status":"locked"},"extensions.blocklist.enabled":{"Value":true,"Status":"locked"},"accessibility.force_disabled":{"Value":1,"Status":"locked"},"dom.battery.enabled":{"Value":false,"Status":"locked"},"media.videocontrols.picture-in-picture.keyboard-controls.enabled":{"Value":true,"Status":"default"},"browser.formfill.enable":{"Value":false,"Status":"default"},"network.prefetch-next":{"Value":false,"Status":"locked"},"network.predictor.enabled":{"Value":false,"Status":"locked"},"network.predictor.enable-prefetch":{"Value":false,"Status":"locked"},"browser.urlbar.speculativeConnect.enabled":{"Value":false,"Status":"locked"},"browser.send_pings":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.telemetrybrowser.newtabpage.activity-stream.telemetry":{"Value":false,"Status":"locked"},"browser.pingcentre.telemetry":{"Value":false,"Status":"locked"},"media.wmf.deblacklisting-for-telemetry-in-gpu-process":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons":{"Value":false,"Status":"locked"},"browser.aboutwelcome.enabled":{"Value":false,"Status":"locked"},"browser.messaging-system.whatsNewPanel.enabled":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.section.topstories":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.snippets":{"Value":false,"Status":"locked"},"browser.ctrlTab.recentlyUsedOrder":{"Value":false,"Status":"default"},"browser.crashReports.unsubmittedCheck.enabled":{"Value":false,"Status":"locked"},"browser.crashReports.unsubmittedCheck.autoSubmit":{"Value":false,"Status":"locked"},"browser.crashReports.unsubmittedCheck.autoSubmit2":{"Value":false,"Status":"locked"},"browser.tabs.crashReporting.includeURL":{"Value":false,"Status":"locked"},"print.always_print_silent":{"Value":false,"Status":"locked"},"print.save_print_settings":{"Value":false,"Status":"locked"},"print.tab_modal.enabled":{"Value":true,"Status":"locked"},"accessibility.blockautorefresh":{"Value":false,"Status":"locked"},"extensions.formautofill.creditCards.enabled":{"Value":false,"Status":"default"},"extensions.formautofill.addresses.enabled":{"Value":false,"Status":"default"},"ui.key.menuAccessKeyFocuses":{"Value":false,"Status":"locked"},"browser.backspace_action":{"Value":2,"Status":"locked"},"extensions.allowPrivateBrowsingByDefault":{"Value":true,"Status":"locked"},"browser.urlbar.eventTelemetry.enabled":{"Value":false,"Status":"locked"},"browser.urlbar.richSuggestions.tail":{"Value":false,"Status":"locked"},"browser.urlbar.autoFill":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.telemetry":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.telemetry":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.discoverystream.spocs.personalized":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.aboutpreferences":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.discoverystreamfeed":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.favicon":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.newtabinit":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.places":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.recommendationproviderswitcher":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.sections":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts":{"Value":false,"Status":"locked"},"browser.urlbar.shortcuts.bookmarks":{"Value":false,"Status":"default"},"browser.urlbar.shortcuts.history":{"Value":false,"Status":"default"},"browser.urlbar.shortcuts.tabs":{"Value":false,"Status":"default"},"accessibility.typeaheadfind.manual":{"Value":false,"Status":"default"},"media.navigator.enabled":{"Value":false,"Status":"default"},"pdfjs.enableScripting":{"Value":false,"Status":"locked"},"dom.payments.defaults.saveAddress":{"Value":false,"Status":"default"},"dom.payments.defaults.saveCreditCard":{"Value":false,"Status":"default"},"browser.preferences.moreFromMozilla":{"Value":false,"Status":"locked"},"signon.autofillForms":{"Value":false,"Status":"default"},"browser.ctrlTab.sortByRecentlyUsed":{"Value":false,"Status":"locked"},"browser.sessionstore.resuming_after_os_restart":{"Value":false,"Status":"locked"},"browser.startup.page":{"Value":1,"Status":"locked"},"media.videocontrols.picture-in-picture.video-toggle.enabled":{"Value":false,"Status":"default"}}

:: -----
:: DNS Over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS" /V Locked /T REG_dWORD /D 1 /F
:: Proxy
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Proxy" /V Mode /T REG_SZ /D none /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Proxy" /V Locked /T REG_dWORD /D 1 /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V NetworkPrediction /T REG_dWORD /D 0 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverrideFirstRunPage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverridePostUpdatePage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V NoDefaultBookmarks /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DontCheckDefaultBrowser /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V Locked /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V Locked /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin" /V Default /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin" /V Locked /T REG_dWORD /D 1 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableTelemetry /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxStudies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFeedbackCommands /T REG_dWORD /D 1 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Cookies" /V AcceptThirdParty /T REG_SZ /D never /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Cookies" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /V "Default" /T REG_SZ /D "block-audio-video" /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /V Locked /T REG_dWORD /D 0 /F
:: -----
:: Tracking Protection
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\EnableTrackingProtection" /V Value /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\EnableTrackingProtection" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\EnableTrackingProtection" /V Cryptomining /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\EnableTrackingProtection" /V Fingerprinting /T REG_dWORD /D 1 /F
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Search /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V TopSites /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Highlights /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Pocket /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Snippets /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Locked /T REG_dWORD /D 1 /F
:: -----
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions" /V DisableDeveloperTools /T REG_dWORD /D 0 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisplayBookmarksToolbar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V "DisplayMenuBar" /T REG_SZ /D "default-off" /F
:: Pocket
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisablePocket /T REG_dWORD /D 1 /F
:: Refresh Profile Suggestion
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableProfileRefresh /T REG_dWORD /D 1 /F
:: Safe Mode Disabled
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSafeMode /T REG_dWORD /D 1 /F
:: Windows SSO
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V WindowsSSO /T REG_dWORD /D 0 /F
:: -----
:: Quick Set Desktop Background
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSetDesktopBackground /T REG_dWORD /D 1 /F
:: Import Bookmarks Icon on Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableProfileImport /T REG_dWORD /D 1 /F
:: Other
REG DELETE "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /F
:: -----

:: -----------------
:: Brave
:: -----------------

:: -----
:: Extension Settings
:: 1) "Ublock Origin", 2) "SponsorBlock for YouTube - Skip Sponsorships", 3) "ClearURLs"
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
:: REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V HideWebStoreIcon /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
:: -----
:: DNS Over HTTPS and Proxy
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DnsOverHttpsMode /T REG_SZ /D off /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V NetworkPredictionOptions /T REG_dWORD /D 2 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F
:: -----
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: -----
:: Settings Import
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultSensorsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PaymentMethodQueryEnabled /T REG_dWORD /D 0 /F
:: -----
:: URL Bar
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
:: Background Mode
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: PDF Files
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
:: Media
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AutoplayAllowed /T REG_dWORD /D 0 /F
:: -----
:: Brave: Tor
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V TorDisabled /T REG_dWORD /D 1 /F
:: -----
:: URL Blocklist
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\URLBlocklist" /V 1 /T REG_SZ /D "securly.com" /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\URLBlocklist" /V 2 /T REG_SZ /D "goguardian.com" /F
:: -----

:: -----------------
:: Microsoft Edge Chromium
:: -----------------

REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F

:: Extension Settings
:: 1) "Ublock Origin", 2) "SponsorBlock for YouTube - Skip Sponsorships", 3) "ClearURLs"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D odfafepnkmbhccpbejgmiehpchacaeak /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mbmgnelfcpoecdepckhlhegpcehmpmji /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D mdkdmaickkfdekbjdoojfalpbkgaddei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 1 /T REG_SZ /D odfafepnkmbhccpbejgmiehpchacaeak;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mbmgnelfcpoecdepckhlhegpcehmpmji;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 3 /T REG_SZ /D mdkdmaickkfdekbjdoojfalpbkgaddei;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"odfafepnkmbhccpbejgmiehpchacaeak\": {},\"mdkdmaickkfdekbjdoojfalpbkgaddei\": {}}" /F
:: -----
:: DNS Over HTTPS and Proxy
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DnsOverHttpsMode /T REG_SZ /D off /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BuiltInDnsClientEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NetworkPredictionOptions /T REG_dWORD /D 2 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V HideFirstRunExperience /T REG_dWORD /D 1 /F
:: -----
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AllowSurfGame /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: -----
:: Settings Import
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AutoImportAtFirstRun /T REG_dWORD /D 4 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportBrowserSettings /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportCookies /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportExtensions /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportFavorites /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportOpenTabs /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportPaymentInfo /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportShortcuts /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ShowRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PersonalizationReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V TrackingPrevention /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultSensorsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PaymentMethodQueryEnabled /T REG_dWORD /D 0 /F
:: -----
:: Background Mode
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: PDF Files
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
:: Media
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AutoplayAllowed /T REG_dWORD /D 0 /F
:: -----
:: Collections and Shopping
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EdgeCollectionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\CollectionsServicesAndExportsBlockList" /V 1 /T REG_SZ /D pinterest_suggestions /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EdgeShoppingAssistantEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ShowMicrosoftRewards /T REG_dWORD /D 0 /F
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageHideDefaultTopSites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPagePrerenderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageAllowedBackgroundTypes /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageSearchBox /T REG_SZ /D redirect /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SpotlightExperiencesAndRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AddressBarMicrosoftSearchInBingProviderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageQuickLinksEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageContentEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageHideDefaultTopSites /T REG_dWORD /D 1 /F
:: Family Settings Disable
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V FamilySafetySettingsEnabled /T REG_dWORD /D 0 /F
:: Internet Explorer Mode
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V HideInternetExplorerRedirectUXForIncompatibleSitesEnabled /T REG_dWORD /D 1 /F
:: Edge Bar / Web Widget
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V WebWidgetIsEnabledOnStartup /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V WebWidgetAllowed /T REG_dWORD /D 0 /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ResolveNavigationErrorsUseWebService /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AlternateErrorPagesEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V LocalProvidersEnabled /T REG_dWORD /D 0 /F
:: -----
:: URL Blocklist
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\URLBlocklist" /V 1 /T REG_SZ /D "securly.com" /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\URLBlocklist" /V 2 /T REG_SZ /D "goguardian.com" /F
:: -----

:: -----------------
:: Microsoft Edge Legacy
:: -----------------

:: -----
:: First Run
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AllowPrelaunch /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventFirstRunPage /T REG_dWORD /D 1 /F
:: Default Browser
REG ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
:: -----
:: Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" /V FlashPlayerEnabled /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V EnableExtendedBooksTelemetry /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventLiveTileDataCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V MicrosoftEdgeDataOptIn /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V Cookies /T REG_dWORD /D 1 /F
:: -----
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Internet Settings" /V ConfigureHomeButton /T REG_dWORD /D 1 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V "Use FormSuggest" /T REG_SZ /D no /F
:: -----
:: Books Library
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AlwaysEnableBooksLibrary /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V UseSharedFolderForBooks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V AllowConfigurationUpdateForBooksLibrary /T REG_dWORD /D 0 /F
:: -----
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI" /V ShowOneBox /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI" /V AllowWebContentOnNewTabPage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V AllowTabPreloading /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V PreventTabPreloading /T REG_dWORD /D 1 /F
:: -----
:: Internet Explorer Switch
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V SyncFavoritesBetweenIEAndMicrosoftEdge /T REG_dWORD /D 0 /F
:: -----
:: Sync
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSyn /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableWebBrowserSettingSyncUserOverride /T REG_dWORD /D 2 /F
:: -----
:: Browsing History
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\KioskMode" /V ConfigureKioskMode /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AllowSavingHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Privacy" /V ClearBrowsingHistoryOnExit /T REG_dWORD /D 1 /F
:: -----
:: Phishing Filter
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /V PreventOverride /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /V PreventOverrideAppRepUnknown /T REG_dWORD /D 1 /F
:: -----

:: -----------------
:: Internet Explorer
:: -----------------

:: -----
:: First Run
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V DisableImportExportFavorites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V DisableFirstRunCustomize /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V DisableFirstRunCustomize /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /V ShowMessageWhenOpeningSitesInMicrosoftEdge /T REG_dWORD /D 0 /F
:: Default Browser
REG ADD "HKLM\Default\Software\Microsoft\Internet Explorer\Main" /V "Check_Associations" /T REG_SZ /D "no" /F
REG ADD "HKCU\Default\Software\Microsoft\Internet Explorer\Main" /V "Check_Associations" /T REG_SZ /D "no" /F
:: -----
:: Location
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Geolocation" /V PolicyDisableGeolocation /T REG_dWORD /D 1 /F
:: Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V DisableFlashInIE /T REG_dWORD /D 1 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" /V DisableLogging /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpItemSendFeedback /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpItemSendFeedback /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /V DisableCustomerImprovementProgram /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V NoReportSiteProblems /T REG_SZ /D yes /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\WindowsSearch" /V EnabledScopes /T REG_dWORD /D 0 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V ShowContentAdvisor /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\DomainSuggestion" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpMenu /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V DisplayQuickPick /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V TopResult /T REG_dWORD /D 0 /F
:: -----
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\ContinuousBrowsing" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Recovery" /V NoReopenLastSession /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing" /V NewTabPageShow /T REG_dWORD /D 0 /F
:: -----
:: Browsing History
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V DisableDeleteBrowsingHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V DisableDeleteForms /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V History /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V ClearBrowsingHistoryOnExit /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanDownloadHistory /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanHistory /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanInPrivateBlocking /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanTrackingProtection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanTIF /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V UseAllowList /T REG_dWORD /D 0 /F
:: -----
:: Phishing Filter
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V Enabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V PreventOverride /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V PreventOverrideAppRepUnknown /T REG_dWORD /D 1 /F
:: -----
:: Send All Sites to Microsoft Edge
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /V RestrictIE /T REG_dWORD /D 1 /F
:: -----
:: Popups
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V RestrictPopupExceptionList /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing" /V PopupsUseNewWindow /T REG_dWORD /D 2 /F
:: -----
:: Hide New Edge Button
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V HideNewEdgeButton /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V HideNewEdgeButton /T REG_dWORD /D 1 /F
:: -----
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /V NoSearchBox /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /V NoSplash /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V EnableAutoUpgrade /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V AllowWindowReuse /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\FormatDetection" /V PhoneNumberEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V DisableFixSecuritySettings /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V DisableSecuritySettingsCheck /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V AllowServicePoweredQSA /T REG_dWORD /D 0 /F
:: -----

:: --------------------------------------------------------------------
:: Block Bad Extensions/Addons (Chrome, Chromium, Firefox, Brave, and Edge Chromium)
:: ----------------------------------

:: -----------------
:: Chrome
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 2 /T REG_SZ /D cfhdojbkjhnklbpkdaibdccddilifddb /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 3 /T REG_SZ /D gighmmpiobklfepjocnamgkkbiglidom /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 4 /T REG_SZ /D lgblnfidahcdcjddiepkckcfdhpknnjh /F
:: uBlock (non-origin)
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 5 /T REG_SZ /D epcnnfbjfcgphgdmggkamkmgojdagdnn /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 6 /T REG_SZ /D ohahllgiabjaoigichmmfljhkcfikeof /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 7 /T REG_SZ /D bgnkhhnnamicmpeenaelnjfhikgbkllg /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 8 /T REG_SZ /D kbfnbcaeplbcioakkpcpgfkobkghlhen /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 9 /T REG_SZ /D noojmhngiheennhgaffkfboanjpbkpep /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 10 /T REG_SZ /D bjodbpcjeogaihbekannledankhcjbgo /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 11 /T REG_SZ /D bmnlcjabgnpnenekpadlanbbkooimhnj /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 12 /T REG_SZ /D gomekmidlodglbbmalcneegieacbdmki /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 13 /T REG_SZ /D eofcbnmajmjmplflapaojjnihcjkigck /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 14 /T REG_SZ /D nbmoafcmbajniiapeidgficgifbfmjfo /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 15 /T REG_SZ /D mbckjcfnjmoiinpgddefodcighgikkgn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 16 /T REG_SZ /D ggimcfhnklgjpgehibgfmoidcgmbhppm /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 17 /T REG_SZ /D kcdahmgmaagjhocpipbodaokikjkampi /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 18 /T REG_SZ /D gkojfkhlekighikafcpjkiklfbnlmeio /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 19 /T REG_SZ /D lpognpnpncelknkahlngpojfjgdmkodn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 20 /T REG_SZ /D eoigllimhcllmhedfbmahegmoakcdakd /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 21 /T REG_SZ /D napjheenlliimoedooldaalpjfidlidp /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 22 /T REG_SZ /D klekeajafkkpokaofllcadenjdckhinm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 23 /T REG_SZ /D cmendinpapjjojakimjlmkkkcmnojefg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 24 /T REG_SZ /D jjkchpdmjjdmalgembblgafllbpcjlei /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 25 /T REG_SZ /D lkdiimaiohgpacfbgedcipmgigppaofn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 26 /T REG_SZ /D kaedchgajfpgipflgbgeeiiajekblklm /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 27 /T REG_SZ /D bhmmomiinigofkjcapegjjndpbikblnp /F
:: Adobe
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 28 /T REG_SZ /D efaidnbmnnnibpcajpcglclefindmkaj /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 29 /T REG_SZ /D pedmlpceiodameienmmkpkkpilgklmfh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 30 /T REG_SZ /D fbgcedjacmlbgleddnoacbnijgmiolem /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 31 /T REG_SZ /D dhelmjcpoddajfaldodimlaehbalhgag /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 32 /T REG_SZ /D obdappnhkfoejojnmcohppfnoeagadna /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 33 /T REG_SZ /D bkbeeeffjjeopflfhgeknacdieedcoml /F
:: -----
:: Fake TikTok
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 34 /T REG_SZ /D bjflcommipadapdldncoacffcccldlkm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 35 /T REG_SZ /D niljfkkadomdhekbkamcdlmokhnklign /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 36 /T REG_SZ /D agnbmfinlfpgonkehceknkpapgoibdno /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 37 /T REG_SZ /D dedphjedjalglppdfpmmibdbbkmifnbb /F
:: Fake Flash 
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 38 /T REG_SZ /D mcakfkioeanhfiojkchcndahgagcidbd /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 39 /T REG_SZ /D nddmmcpmdbkooddfjcohmlcfclhllgeh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 40 /T REG_SZ /D fnipglnbhfacfmefbgiiodalehbcgcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 41 /T REG_SZ /D fldkdmkgnlbehfgeifjpjabmandnchpe /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 42 /T REG_SZ /D aiccdefnpjkolgnpdamdimejlfmopcca /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 43 /T REG_SZ /D mdjjpkalmajfkhnamkekeljbfenponih /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 44 /T REG_SZ /D kppfgjkgimgbanjbbgpmccbkagcebnid /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 45 /T REG_SZ /D omimccinlhlkpjaeaocglgmkbelejlhj /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 46 /T REG_SZ /D cngjoacjdpnadhhjpdppcdjboiclnclc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 47 /T REG_SZ /D hloblpeplfiajnfdengendhdnpmdgagn /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 48 /T REG_SZ /D gmdffbblaahnjmpcjaenakkdplibibge /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 49 /T REG_SZ /D maekfnoeejhpjfkfmdlckioggdcdofpg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 50 /T REG_SZ /D cmedhionkhpnakcndndgjdbohmhepckk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 51 /T REG_SZ /D gpbfjnhlnemfnhajnmkjicfmbagfbejm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 52 /T REG_SZ /D gkhnanmhgeggclieoggjehkloolfkbdo /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 53 /T REG_SZ /D oldifepkckfmnlokobgdbjjfjjmhfgag /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 54 /T REG_SZ /D megdnjjcjgoiacejpegmfoeooleddmeb /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 55 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 56 /T REG_SZ /D khnleagcghdbpphacgjjkcoceilngecl /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 57 /T REG_SZ /D cegbjdefhfnbphoghdgcapnliodjbncp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 58 /T REG_SZ /D emngkmlligggbbiioginlkphcmffbncb /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 59 /T REG_SZ /D jompdinfdpijbcngkadcdaladbochoae /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 60 /T REG_SZ /D pkocadmokmpjeeaimigjpmfpdaighkga /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 61 /T REG_SZ /D jaeigffnocnbblojlfmiimdocmfcjkii /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 62 /T REG_SZ /D ppdonaappkjkbgbncmmjencphdclioab /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 63 /T REG_SZ /D lalfpjdbhpmnhfofkckdpkljeilmogfl /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D alcmakjhknigccfidaelkafjmfifkhkc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D fmaicbnbcbjgbpecclcnaehmbpjpdane /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D icegedoajhdclokfmeobnnbalabmpehm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D jhpheijfhpbkaejncokigfaihgdndjhg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D jbbmlecgjpijkeelnebilpekpnkaoool /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D gokhabgljglbmjilkmelajgkkhofeeij /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D klapabjimnakejfmpdolgamfplaondck /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D pclbpfjdhojdfcojcmmgggaanfnmhifk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D dhdpjhfemdchgdfngofnkgmabdmchoii /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D ckjbcmkjhocgdhmkkkieknbmhdnjanoh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D fkjdaikpmbninlknfjgehkoggdgmknel /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D eilkefcdofnagepelocjipipghaalkam /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D ocbcobiceiagblnejkcekbpgpakolhff /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D lkcohpjckebdgmdofkdfppgeejccjmnl /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D fhjieeiddoiibfbdknfligkjlpihnmjc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D bkalmigiilcgdihccnaonhnkdhpfbaam /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D gkkehpomgpdgkdmbdfkangmbafecdhhd /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D inejjjikomlbaahobecdaoaillmfejil /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D kllohiclobgoaffphlofnjdlabflpgha /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D ececmkgelhdncajgmofiffjmhojnimmb /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D fjadbbodmeifhkgepjjkeneeojammfag /F
:: VPN
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D kalfeohpimfncbfhjhanngehpbfilokk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D nlbejmccbhkncgokjcmghpfloaajcffj /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D ejkaocphofnobjdedneohbbiilggdlbi /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D bihmplhobchoageeokmgbdihknkjbknd /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D aleggpabliehgbeagmfhnodcijcmbonb /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D fpmapakogndmenjcfoajifaaonnkpkei /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D llkbempahblbohpipifajipejjackemi /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D nplnfhpilojbbcnjpiaoecppkkicfgfp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D jeajkcogjepdpppofeocjpejdckbgdco /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D eekepadogplleogcggcjkfebfjhihlnm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D mmknfaojcgjcelkoabokhaljjapiogbg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D jalmmnpclgbgcphkbnglcnlobgcbhkki /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D hkegehhbmbongohpgmdadkbkmnfokicn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D odfnofpjippoimohokldpheacfenmfch /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D oobhlpildfogoccaffnfckililknpcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D jmgacjgobknfojonlckhndlamkfcjofm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D gfceeghcoekcmlpgonlplkpmakdmpgmg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kfgffakpbnpfonmljmpfamjpnjbhfiij /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D bbebbhmelpcfmijoanocdliephmoahln /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
:: Amazon Assistant
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D pbjikboenpfhbbejgkoklgkhjpfogcam /F
:: College Board Secure Test
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D lhfmngifffjhdjdgkfdhbifhndddmjko /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D hblfbmjdaalalhifaajnnodlkiloengc /F
:: ProctorU
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D kbmmbecgmmkedcifdommembgkeomigjf /F
:: Nano Adblocker / Nano Defender
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D gabbbocakeomblphkmmnoamkioajlkfo /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 121 /T REG_SZ /D ggolfgbegefeeoocgjbmkembbncoadlb /F
:: Grammer Check Software Block
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 122 /T REG_SZ /D kdfieneakcjfaiglcfcgkidlkmlijjnh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 123 /T REG_SZ /D oldceeleldhonbafppcapldpdifcinji /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 124 /T REG_SZ /D pjpgohokimaldkikgejifibjdpbopfdc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 125 /T REG_SZ /D gpaiobkfhnonedkhhfjpmhdalgeoebfa /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 126 /T REG_SZ /D npnbdojkgkbcdfdjlfdmplppdphlhhcf /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 127 /T REG_SZ /D hamhaljjdpcgkelbadepgmnocknejief /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 128 /T REG_SZ /D ifajfiofeifbbhbionejdliodenmecna /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 129 /T REG_SZ /D dmngfggkdcjejjgbfemebfomkphgcena /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 130 /T REG_SZ /D mpeepmfabickbdbckcejbflkpfamgcon /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 131 /T REG_SZ /D dmgkiikdlhmpikkhpiplldicbnicmboc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 132 /T REG_SZ /D ndgklmlnheedegipcohgcbjhhgddendc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 134 /T REG_SZ /D ecpbljknammclncihheaiehdahccgmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 135 /T REG_SZ /D nohphjepbjannpjpmodlcgdlialokkpd /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 136 /T REG_SZ /D oidhbpddkfhmipanjccneeifmmiabjng /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 137 /T REG_SZ /D nngceafehcgnogadphbkblijebijibkj /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 138 /T REG_SZ /D fkjahhehbehlijcehipnhpjhldcajban /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 139 /T REG_SZ /D ljgdcokhgjdpghmhdkbolccfcfdbklpo /F
:: Tunnelbear
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 140 /T REG_SZ /D omdakjcmkglenbhjadbccaookpfjihpa /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 141 /T REG_SZ /D njglkaigokomacaljolalkopeonkpbik /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 142 /T REG_SZ /D obhacaboehinamiaoafpljgofoapchgf /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 143 /T REG_SZ /D cccmaneagdjeppggplfjbemndmknmdib /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 144 /T REG_SZ /D kgddnoifhgfdhcpbkkjdgokfnkkmdcen /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 145 /T REG_SZ /D jaohnaoeopobbpjdeglffjnaclhifabp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 146 /T REG_SZ /D fnkihbploojbmldhgdfpalkoifmegfpn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 147 /T REG_SZ /D kdmoafnhillldhoddnccefecelkofphm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 148 /T REG_SZ /D keghjkfdmmdkneijbbbnopeglnakbphn /F
:: Securly Classroom
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 149 /T REG_SZ /D jfbecfmiegcjddenjhlbhlikcbfmnafd /F
:: Securly for Chromebooks (This extension force reloads tabs when extension restarts)
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 150 /T REG_SZ /D iheobagjkfklnlikgihanlhcddjoihkg /F
:: Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites
:: lanschool student
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 151 /T REG_SZ /D ifeifkfohlobcbhmlfkenopaimbmnahb /F
:: lanschool web helper
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 152 /T REG_SZ /D honjcnefekfnompampcpmcdadibmjhlk /F
:: Read and Write
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 153 /T REG_SZ /D inoeonmfapjbbkmdafoankkfajkcphgd /F
:: Other 2
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 154 /T REG_SZ /D kgeglempfkhalebjlogemlmeakondflc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 155 /T REG_SZ /D hmkphiklpggiafkgpmdekkofbadkffnn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 156 /T REG_SZ /D jdfhadodhoabdfkgkclcdpocjffadkne /F

:: -----------------
:: Chromium
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 2 /T REG_SZ /D cfhdojbkjhnklbpkdaibdccddilifddb /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 3 /T REG_SZ /D gighmmpiobklfepjocnamgkkbiglidom /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 4 /T REG_SZ /D lgblnfidahcdcjddiepkckcfdhpknnjh /F
:: uBlock (non-origin)
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 5 /T REG_SZ /D epcnnfbjfcgphgdmggkamkmgojdagdnn /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 6 /T REG_SZ /D ohahllgiabjaoigichmmfljhkcfikeof /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 7 /T REG_SZ /D bgnkhhnnamicmpeenaelnjfhikgbkllg /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 8 /T REG_SZ /D kbfnbcaeplbcioakkpcpgfkobkghlhen /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 9 /T REG_SZ /D noojmhngiheennhgaffkfboanjpbkpep /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 10 /T REG_SZ /D bjodbpcjeogaihbekannledankhcjbgo /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 11 /T REG_SZ /D bmnlcjabgnpnenekpadlanbbkooimhnj /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 12 /T REG_SZ /D gomekmidlodglbbmalcneegieacbdmki /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 13 /T REG_SZ /D eofcbnmajmjmplflapaojjnihcjkigck /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 14 /T REG_SZ /D nbmoafcmbajniiapeidgficgifbfmjfo /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 15 /T REG_SZ /D mbckjcfnjmoiinpgddefodcighgikkgn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 16 /T REG_SZ /D ggimcfhnklgjpgehibgfmoidcgmbhppm /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 17 /T REG_SZ /D kcdahmgmaagjhocpipbodaokikjkampi /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 18 /T REG_SZ /D gkojfkhlekighikafcpjkiklfbnlmeio /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 19 /T REG_SZ /D lpognpnpncelknkahlngpojfjgdmkodn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 20 /T REG_SZ /D eoigllimhcllmhedfbmahegmoakcdakd /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 21 /T REG_SZ /D napjheenlliimoedooldaalpjfidlidp /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 22 /T REG_SZ /D klekeajafkkpokaofllcadenjdckhinm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 23 /T REG_SZ /D cmendinpapjjojakimjlmkkkcmnojefg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 24 /T REG_SZ /D jjkchpdmjjdmalgembblgafllbpcjlei /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 25 /T REG_SZ /D lkdiimaiohgpacfbgedcipmgigppaofn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 26 /T REG_SZ /D kaedchgajfpgipflgbgeeiiajekblklm /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 27 /T REG_SZ /D bhmmomiinigofkjcapegjjndpbikblnp /F
:: Adobe
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 28 /T REG_SZ /D efaidnbmnnnibpcajpcglclefindmkaj /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 29 /T REG_SZ /D pedmlpceiodameienmmkpkkpilgklmfh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 30 /T REG_SZ /D fbgcedjacmlbgleddnoacbnijgmiolem /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 31 /T REG_SZ /D dhelmjcpoddajfaldodimlaehbalhgag /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 32 /T REG_SZ /D obdappnhkfoejojnmcohppfnoeagadna /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 33 /T REG_SZ /D bkbeeeffjjeopflfhgeknacdieedcoml /F
:: -----
:: Fake TikTok
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 34 /T REG_SZ /D bjflcommipadapdldncoacffcccldlkm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 35 /T REG_SZ /D niljfkkadomdhekbkamcdlmokhnklign /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 36 /T REG_SZ /D agnbmfinlfpgonkehceknkpapgoibdno /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 37 /T REG_SZ /D dedphjedjalglppdfpmmibdbbkmifnbb /F
:: Fake Flash 
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 38 /T REG_SZ /D mcakfkioeanhfiojkchcndahgagcidbd /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 39 /T REG_SZ /D nddmmcpmdbkooddfjcohmlcfclhllgeh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 40 /T REG_SZ /D fnipglnbhfacfmefbgiiodalehbcgcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 41 /T REG_SZ /D fldkdmkgnlbehfgeifjpjabmandnchpe /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 42 /T REG_SZ /D aiccdefnpjkolgnpdamdimejlfmopcca /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 43 /T REG_SZ /D mdjjpkalmajfkhnamkekeljbfenponih /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 44 /T REG_SZ /D kppfgjkgimgbanjbbgpmccbkagcebnid /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 45 /T REG_SZ /D omimccinlhlkpjaeaocglgmkbelejlhj /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 46 /T REG_SZ /D cngjoacjdpnadhhjpdppcdjboiclnclc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 47 /T REG_SZ /D hloblpeplfiajnfdengendhdnpmdgagn /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 48 /T REG_SZ /D gmdffbblaahnjmpcjaenakkdplibibge /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 49 /T REG_SZ /D maekfnoeejhpjfkfmdlckioggdcdofpg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 50 /T REG_SZ /D cmedhionkhpnakcndndgjdbohmhepckk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 51 /T REG_SZ /D gpbfjnhlnemfnhajnmkjicfmbagfbejm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 52 /T REG_SZ /D gkhnanmhgeggclieoggjehkloolfkbdo /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 53 /T REG_SZ /D oldifepkckfmnlokobgdbjjfjjmhfgag /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 54 /T REG_SZ /D megdnjjcjgoiacejpegmfoeooleddmeb /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 55 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 56 /T REG_SZ /D khnleagcghdbpphacgjjkcoceilngecl /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 57 /T REG_SZ /D cegbjdefhfnbphoghdgcapnliodjbncp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 58 /T REG_SZ /D emngkmlligggbbiioginlkphcmffbncb /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 59 /T REG_SZ /D jompdinfdpijbcngkadcdaladbochoae /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 60 /T REG_SZ /D pkocadmokmpjeeaimigjpmfpdaighkga /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 61 /T REG_SZ /D jaeigffnocnbblojlfmiimdocmfcjkii /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 62 /T REG_SZ /D ppdonaappkjkbgbncmmjencphdclioab /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 63 /T REG_SZ /D lalfpjdbhpmnhfofkckdpkljeilmogfl /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D alcmakjhknigccfidaelkafjmfifkhkc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D fmaicbnbcbjgbpecclcnaehmbpjpdane /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D icegedoajhdclokfmeobnnbalabmpehm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D jhpheijfhpbkaejncokigfaihgdndjhg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D jbbmlecgjpijkeelnebilpekpnkaoool /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D gokhabgljglbmjilkmelajgkkhofeeij /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D klapabjimnakejfmpdolgamfplaondck /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D pclbpfjdhojdfcojcmmgggaanfnmhifk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D dhdpjhfemdchgdfngofnkgmabdmchoii /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D ckjbcmkjhocgdhmkkkieknbmhdnjanoh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D fkjdaikpmbninlknfjgehkoggdgmknel /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D eilkefcdofnagepelocjipipghaalkam /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D ocbcobiceiagblnejkcekbpgpakolhff /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D lkcohpjckebdgmdofkdfppgeejccjmnl /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D fhjieeiddoiibfbdknfligkjlpihnmjc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D bkalmigiilcgdihccnaonhnkdhpfbaam /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D gkkehpomgpdgkdmbdfkangmbafecdhhd /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D inejjjikomlbaahobecdaoaillmfejil /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D kllohiclobgoaffphlofnjdlabflpgha /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D ececmkgelhdncajgmofiffjmhojnimmb /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D fjadbbodmeifhkgepjjkeneeojammfag /F
:: VPN
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D kalfeohpimfncbfhjhanngehpbfilokk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D nlbejmccbhkncgokjcmghpfloaajcffj /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D ejkaocphofnobjdedneohbbiilggdlbi /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D bihmplhobchoageeokmgbdihknkjbknd /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D aleggpabliehgbeagmfhnodcijcmbonb /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D fpmapakogndmenjcfoajifaaonnkpkei /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D llkbempahblbohpipifajipejjackemi /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D nplnfhpilojbbcnjpiaoecppkkicfgfp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D jeajkcogjepdpppofeocjpejdckbgdco /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D eekepadogplleogcggcjkfebfjhihlnm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D mmknfaojcgjcelkoabokhaljjapiogbg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D jalmmnpclgbgcphkbnglcnlobgcbhkki /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D hkegehhbmbongohpgmdadkbkmnfokicn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D odfnofpjippoimohokldpheacfenmfch /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D oobhlpildfogoccaffnfckililknpcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D jmgacjgobknfojonlckhndlamkfcjofm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D gfceeghcoekcmlpgonlplkpmakdmpgmg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kfgffakpbnpfonmljmpfamjpnjbhfiij /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D bbebbhmelpcfmijoanocdliephmoahln /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
:: Amazon Assistant
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D pbjikboenpfhbbejgkoklgkhjpfogcam /F
:: College Board Browser
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D lhfmngifffjhdjdgkfdhbifhndddmjko /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D hblfbmjdaalalhifaajnnodlkiloengc /F
:: ProctorU
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D kbmmbecgmmkedcifdommembgkeomigjf /F
:: Nano Adblocker / Nano Defender
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D gabbbocakeomblphkmmnoamkioajlkfo /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 121 /T REG_SZ /D ggolfgbegefeeoocgjbmkembbncoadlb /F
:: Grammer Check Software Block
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 122 /T REG_SZ /D kdfieneakcjfaiglcfcgkidlkmlijjnh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 123 /T REG_SZ /D oldceeleldhonbafppcapldpdifcinji /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 124 /T REG_SZ /D pjpgohokimaldkikgejifibjdpbopfdc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 125 /T REG_SZ /D gpaiobkfhnonedkhhfjpmhdalgeoebfa /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 126 /T REG_SZ /D npnbdojkgkbcdfdjlfdmplppdphlhhcf /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 127 /T REG_SZ /D hamhaljjdpcgkelbadepgmnocknejief /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 128 /T REG_SZ /D ifajfiofeifbbhbionejdliodenmecna /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 129 /T REG_SZ /D dmngfggkdcjejjgbfemebfomkphgcena /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 130 /T REG_SZ /D mpeepmfabickbdbckcejbflkpfamgcon /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 131 /T REG_SZ /D dmgkiikdlhmpikkhpiplldicbnicmboc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 132 /T REG_SZ /D ndgklmlnheedegipcohgcbjhhgddendc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 134 /T REG_SZ /D ecpbljknammclncihheaiehdahccgmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 135 /T REG_SZ /D nohphjepbjannpjpmodlcgdlialokkpd /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 136 /T REG_SZ /D oidhbpddkfhmipanjccneeifmmiabjng /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 137 /T REG_SZ /D nngceafehcgnogadphbkblijebijibkj /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 138 /T REG_SZ /D fkjahhehbehlijcehipnhpjhldcajban /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 139 /T REG_SZ /D ljgdcokhgjdpghmhdkbolccfcfdbklpo /F
:: Tunnelbear
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 140 /T REG_SZ /D omdakjcmkglenbhjadbccaookpfjihpa /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 141 /T REG_SZ /D njglkaigokomacaljolalkopeonkpbik /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 142 /T REG_SZ /D obhacaboehinamiaoafpljgofoapchgf /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 143 /T REG_SZ /D cccmaneagdjeppggplfjbemndmknmdib /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 144 /T REG_SZ /D kgddnoifhgfdhcpbkkjdgokfnkkmdcen /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 145 /T REG_SZ /D jaohnaoeopobbpjdeglffjnaclhifabp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 146 /T REG_SZ /D fnkihbploojbmldhgdfpalkoifmegfpn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 147 /T REG_SZ /D kdmoafnhillldhoddnccefecelkofphm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 148 /T REG_SZ /D keghjkfdmmdkneijbbbnopeglnakbphn /F
:: Securly Classroom
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 149 /T REG_SZ /D jfbecfmiegcjddenjhlbhlikcbfmnafd /F
:: Securly for Chromebooks (This extension force reloads tabs when extension restarts)
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 150 /T REG_SZ /D iheobagjkfklnlikgihanlhcddjoihkg /F
:: Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites
:: lanschool student
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 151 /T REG_SZ /D ifeifkfohlobcbhmlfkenopaimbmnahb /F
:: lanschool web helper
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 152 /T REG_SZ /D honjcnefekfnompampcpmcdadibmjhlk /F
:: Read and Write
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 153 /T REG_SZ /D inoeonmfapjbbkmdafoankkfajkcphgd /F
:: Other 2
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 154 /T REG_SZ /D kgeglempfkhalebjlogemlmeakondflc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 155 /T REG_SZ /D hmkphiklpggiafkgpmdekkofbadkffnn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 156 /T REG_SZ /D jdfhadodhoabdfkgkclcdpocjffadkne /F

:: -----------------
:: Brave
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 2 /T REG_SZ /D cfhdojbkjhnklbpkdaibdccddilifddb /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 3 /T REG_SZ /D gighmmpiobklfepjocnamgkkbiglidom /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 4 /T REG_SZ /D lgblnfidahcdcjddiepkckcfdhpknnjh /F
:: uBlock (non-origin)
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 5 /T REG_SZ /D epcnnfbjfcgphgdmggkamkmgojdagdnn /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 6 /T REG_SZ /D ohahllgiabjaoigichmmfljhkcfikeof /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 7 /T REG_SZ /D bgnkhhnnamicmpeenaelnjfhikgbkllg /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 8 /T REG_SZ /D kbfnbcaeplbcioakkpcpgfkobkghlhen /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 9 /T REG_SZ /D noojmhngiheennhgaffkfboanjpbkpep /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 10 /T REG_SZ /D bjodbpcjeogaihbekannledankhcjbgo /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 11 /T REG_SZ /D bmnlcjabgnpnenekpadlanbbkooimhnj /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 12 /T REG_SZ /D gomekmidlodglbbmalcneegieacbdmki /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 13 /T REG_SZ /D eofcbnmajmjmplflapaojjnihcjkigck /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 14 /T REG_SZ /D nbmoafcmbajniiapeidgficgifbfmjfo /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 15 /T REG_SZ /D mbckjcfnjmoiinpgddefodcighgikkgn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 16 /T REG_SZ /D ggimcfhnklgjpgehibgfmoidcgmbhppm /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 17 /T REG_SZ /D kcdahmgmaagjhocpipbodaokikjkampi /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 18 /T REG_SZ /D gkojfkhlekighikafcpjkiklfbnlmeio /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 19 /T REG_SZ /D lpognpnpncelknkahlngpojfjgdmkodn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 20 /T REG_SZ /D eoigllimhcllmhedfbmahegmoakcdakd /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 21 /T REG_SZ /D napjheenlliimoedooldaalpjfidlidp /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 22 /T REG_SZ /D klekeajafkkpokaofllcadenjdckhinm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 23 /T REG_SZ /D cmendinpapjjojakimjlmkkkcmnojefg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 24 /T REG_SZ /D jjkchpdmjjdmalgembblgafllbpcjlei /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 25 /T REG_SZ /D lkdiimaiohgpacfbgedcipmgigppaofn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 26 /T REG_SZ /D kaedchgajfpgipflgbgeeiiajekblklm /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 27 /T REG_SZ /D bhmmomiinigofkjcapegjjndpbikblnp /F
:: Adobe
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 28 /T REG_SZ /D efaidnbmnnnibpcajpcglclefindmkaj /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 29 /T REG_SZ /D pedmlpceiodameienmmkpkkpilgklmfh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 30 /T REG_SZ /D fbgcedjacmlbgleddnoacbnijgmiolem /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 31 /T REG_SZ /D dhelmjcpoddajfaldodimlaehbalhgag /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 32 /T REG_SZ /D obdappnhkfoejojnmcohppfnoeagadna /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 33 /T REG_SZ /D bkbeeeffjjeopflfhgeknacdieedcoml /F
:: -----
:: Fake TikTok
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 34 /T REG_SZ /D bjflcommipadapdldncoacffcccldlkm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 35 /T REG_SZ /D niljfkkadomdhekbkamcdlmokhnklign /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 36 /T REG_SZ /D agnbmfinlfpgonkehceknkpapgoibdno /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 37 /T REG_SZ /D dedphjedjalglppdfpmmibdbbkmifnbb /F
:: Fake Flash 
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 38 /T REG_SZ /D mcakfkioeanhfiojkchcndahgagcidbd /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 39 /T REG_SZ /D nddmmcpmdbkooddfjcohmlcfclhllgeh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 40 /T REG_SZ /D fnipglnbhfacfmefbgiiodalehbcgcbm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 41 /T REG_SZ /D fldkdmkgnlbehfgeifjpjabmandnchpe /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 42 /T REG_SZ /D aiccdefnpjkolgnpdamdimejlfmopcca /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 43 /T REG_SZ /D mdjjpkalmajfkhnamkekeljbfenponih /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 44 /T REG_SZ /D kppfgjkgimgbanjbbgpmccbkagcebnid /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 45 /T REG_SZ /D omimccinlhlkpjaeaocglgmkbelejlhj /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 46 /T REG_SZ /D cngjoacjdpnadhhjpdppcdjboiclnclc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 47 /T REG_SZ /D hloblpeplfiajnfdengendhdnpmdgagn /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 48 /T REG_SZ /D gmdffbblaahnjmpcjaenakkdplibibge /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 49 /T REG_SZ /D maekfnoeejhpjfkfmdlckioggdcdofpg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 50 /T REG_SZ /D cmedhionkhpnakcndndgjdbohmhepckk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 51 /T REG_SZ /D gpbfjnhlnemfnhajnmkjicfmbagfbejm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 52 /T REG_SZ /D gkhnanmhgeggclieoggjehkloolfkbdo /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 53 /T REG_SZ /D oldifepkckfmnlokobgdbjjfjjmhfgag /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 54 /T REG_SZ /D megdnjjcjgoiacejpegmfoeooleddmeb /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 55 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 56 /T REG_SZ /D khnleagcghdbpphacgjjkcoceilngecl /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 57 /T REG_SZ /D cegbjdefhfnbphoghdgcapnliodjbncp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 58 /T REG_SZ /D emngkmlligggbbiioginlkphcmffbncb /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 59 /T REG_SZ /D jompdinfdpijbcngkadcdaladbochoae /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 60 /T REG_SZ /D pkocadmokmpjeeaimigjpmfpdaighkga /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 61 /T REG_SZ /D jaeigffnocnbblojlfmiimdocmfcjkii /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 62 /T REG_SZ /D ppdonaappkjkbgbncmmjencphdclioab /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 63 /T REG_SZ /D lalfpjdbhpmnhfofkckdpkljeilmogfl /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D alcmakjhknigccfidaelkafjmfifkhkc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D fmaicbnbcbjgbpecclcnaehmbpjpdane /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D icegedoajhdclokfmeobnnbalabmpehm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D jhpheijfhpbkaejncokigfaihgdndjhg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D jbbmlecgjpijkeelnebilpekpnkaoool /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D gokhabgljglbmjilkmelajgkkhofeeij /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D klapabjimnakejfmpdolgamfplaondck /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D pclbpfjdhojdfcojcmmgggaanfnmhifk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D dhdpjhfemdchgdfngofnkgmabdmchoii /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D ckjbcmkjhocgdhmkkkieknbmhdnjanoh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D fkjdaikpmbninlknfjgehkoggdgmknel /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D eilkefcdofnagepelocjipipghaalkam /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D ocbcobiceiagblnejkcekbpgpakolhff /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D lkcohpjckebdgmdofkdfppgeejccjmnl /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D fhjieeiddoiibfbdknfligkjlpihnmjc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D bkalmigiilcgdihccnaonhnkdhpfbaam /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D gkkehpomgpdgkdmbdfkangmbafecdhhd /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D inejjjikomlbaahobecdaoaillmfejil /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D kllohiclobgoaffphlofnjdlabflpgha /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D ececmkgelhdncajgmofiffjmhojnimmb /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D fjadbbodmeifhkgepjjkeneeojammfag /F
:: VPN
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D kalfeohpimfncbfhjhanngehpbfilokk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D nlbejmccbhkncgokjcmghpfloaajcffj /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D ejkaocphofnobjdedneohbbiilggdlbi /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D bihmplhobchoageeokmgbdihknkjbknd /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D aleggpabliehgbeagmfhnodcijcmbonb /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D fpmapakogndmenjcfoajifaaonnkpkei /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D llkbempahblbohpipifajipejjackemi /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D nplnfhpilojbbcnjpiaoecppkkicfgfp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D jeajkcogjepdpppofeocjpejdckbgdco /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D eekepadogplleogcggcjkfebfjhihlnm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D mmknfaojcgjcelkoabokhaljjapiogbg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D jalmmnpclgbgcphkbnglcnlobgcbhkki /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D hkegehhbmbongohpgmdadkbkmnfokicn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D odfnofpjippoimohokldpheacfenmfch /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D oobhlpildfogoccaffnfckililknpcbm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D jmgacjgobknfojonlckhndlamkfcjofm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D gfceeghcoekcmlpgonlplkpmakdmpgmg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kfgffakpbnpfonmljmpfamjpnjbhfiij /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D bbebbhmelpcfmijoanocdliephmoahln /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
:: Amazon Assistant
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D pbjikboenpfhbbejgkoklgkhjpfogcam /F
:: College Board Browser
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D lhfmngifffjhdjdgkfdhbifhndddmjko /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D hblfbmjdaalalhifaajnnodlkiloengc /F
:: ProctorU
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D kbmmbecgmmkedcifdommembgkeomigjf /F
:: Nano Adblocker / Nano Defender
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D gabbbocakeomblphkmmnoamkioajlkfo /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 121 /T REG_SZ /D ggolfgbegefeeoocgjbmkembbncoadlb /F
:: Grammer Check Software Block
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 122 /T REG_SZ /D kdfieneakcjfaiglcfcgkidlkmlijjnh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 123 /T REG_SZ /D oldceeleldhonbafppcapldpdifcinji /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 124 /T REG_SZ /D pjpgohokimaldkikgejifibjdpbopfdc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 125 /T REG_SZ /D gpaiobkfhnonedkhhfjpmhdalgeoebfa /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 126 /T REG_SZ /D npnbdojkgkbcdfdjlfdmplppdphlhhcf /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 127 /T REG_SZ /D hamhaljjdpcgkelbadepgmnocknejief /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 128 /T REG_SZ /D ifajfiofeifbbhbionejdliodenmecna /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 129 /T REG_SZ /D dmngfggkdcjejjgbfemebfomkphgcena /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 130 /T REG_SZ /D mpeepmfabickbdbckcejbflkpfamgcon /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 131 /T REG_SZ /D dmgkiikdlhmpikkhpiplldicbnicmboc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 132 /T REG_SZ /D ndgklmlnheedegipcohgcbjhhgddendc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 134 /T REG_SZ /D ecpbljknammclncihheaiehdahccgmnk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 135 /T REG_SZ /D nohphjepbjannpjpmodlcgdlialokkpd /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 136 /T REG_SZ /D oidhbpddkfhmipanjccneeifmmiabjng /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 137 /T REG_SZ /D nngceafehcgnogadphbkblijebijibkj /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 138 /T REG_SZ /D fkjahhehbehlijcehipnhpjhldcajban /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 139 /T REG_SZ /D ljgdcokhgjdpghmhdkbolccfcfdbklpo /F
:: Tunnelbear
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 140 /T REG_SZ /D omdakjcmkglenbhjadbccaookpfjihpa /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 141 /T REG_SZ /D njglkaigokomacaljolalkopeonkpbik /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 142 /T REG_SZ /D obhacaboehinamiaoafpljgofoapchgf /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 143 /T REG_SZ /D cccmaneagdjeppggplfjbemndmknmdib /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 144 /T REG_SZ /D kgddnoifhgfdhcpbkkjdgokfnkkmdcen /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 145 /T REG_SZ /D jaohnaoeopobbpjdeglffjnaclhifabp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 146 /T REG_SZ /D fnkihbploojbmldhgdfpalkoifmegfpn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 147 /T REG_SZ /D kdmoafnhillldhoddnccefecelkofphm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 148 /T REG_SZ /D keghjkfdmmdkneijbbbnopeglnakbphn /F
:: Securly Classroom
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 149 /T REG_SZ /D jfbecfmiegcjddenjhlbhlikcbfmnafd /F
:: Securly for Chromebooks (This extension force reloads tabs when extension restarts)
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 150 /T REG_SZ /D iheobagjkfklnlikgihanlhcddjoihkg /F
:: Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites
:: lanschool student
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 151 /T REG_SZ /D ifeifkfohlobcbhmlfkenopaimbmnahb /F
:: lanschool web helper
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 152 /T REG_SZ /D honjcnefekfnompampcpmcdadibmjhlk /F
:: Read and Write
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 153 /T REG_SZ /D inoeonmfapjbbkmdafoankkfajkcphgd /F
:: Other 2
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 154 /T REG_SZ /D kgeglempfkhalebjlogemlmeakondflc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 155 /T REG_SZ /D hmkphiklpggiafkgpmdekkofbadkffnn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 156 /T REG_SZ /D jdfhadodhoabdfkgkclcdpocjffadkne /F

:: -----------------
:: Microsoft Edge Chromium
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 2 /T REG_SZ /D cfhdojbkjhnklbpkdaibdccddilifddb /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 3 /T REG_SZ /D gighmmpiobklfepjocnamgkkbiglidom /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 4 /T REG_SZ /D lgblnfidahcdcjddiepkckcfdhpknnjh /F
:: uBlock (non-origin)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 5 /T REG_SZ /D epcnnfbjfcgphgdmggkamkmgojdagdnn /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 6 /T REG_SZ /D ohahllgiabjaoigichmmfljhkcfikeof /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 7 /T REG_SZ /D bgnkhhnnamicmpeenaelnjfhikgbkllg /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 8 /T REG_SZ /D kbfnbcaeplbcioakkpcpgfkobkghlhen /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 9 /T REG_SZ /D noojmhngiheennhgaffkfboanjpbkpep /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 10 /T REG_SZ /D bjodbpcjeogaihbekannledankhcjbgo /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 11 /T REG_SZ /D bmnlcjabgnpnenekpadlanbbkooimhnj /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 12 /T REG_SZ /D gomekmidlodglbbmalcneegieacbdmki /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 13 /T REG_SZ /D eofcbnmajmjmplflapaojjnihcjkigck /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 14 /T REG_SZ /D nbmoafcmbajniiapeidgficgifbfmjfo /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 15 /T REG_SZ /D mbckjcfnjmoiinpgddefodcighgikkgn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 16 /T REG_SZ /D ggimcfhnklgjpgehibgfmoidcgmbhppm /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 17 /T REG_SZ /D kcdahmgmaagjhocpipbodaokikjkampi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 18 /T REG_SZ /D gkojfkhlekighikafcpjkiklfbnlmeio /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 19 /T REG_SZ /D lpognpnpncelknkahlngpojfjgdmkodn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 20 /T REG_SZ /D eoigllimhcllmhedfbmahegmoakcdakd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 21 /T REG_SZ /D napjheenlliimoedooldaalpjfidlidp /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 22 /T REG_SZ /D klekeajafkkpokaofllcadenjdckhinm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 23 /T REG_SZ /D cmendinpapjjojakimjlmkkkcmnojefg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 24 /T REG_SZ /D jjkchpdmjjdmalgembblgafllbpcjlei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 25 /T REG_SZ /D lkdiimaiohgpacfbgedcipmgigppaofn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 26 /T REG_SZ /D kaedchgajfpgipflgbgeeiiajekblklm /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 27 /T REG_SZ /D bhmmomiinigofkjcapegjjndpbikblnp /F
:: Adobe
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 28 /T REG_SZ /D efaidnbmnnnibpcajpcglclefindmkaj /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 29 /T REG_SZ /D pedmlpceiodameienmmkpkkpilgklmfh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 30 /T REG_SZ /D fbgcedjacmlbgleddnoacbnijgmiolem /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 31 /T REG_SZ /D dhelmjcpoddajfaldodimlaehbalhgag /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 32 /T REG_SZ /D obdappnhkfoejojnmcohppfnoeagadna /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 33 /T REG_SZ /D bkbeeeffjjeopflfhgeknacdieedcoml /F
:: -----
:: Fake TikTok
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 34 /T REG_SZ /D bjflcommipadapdldncoacffcccldlkm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 35 /T REG_SZ /D niljfkkadomdhekbkamcdlmokhnklign /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 36 /T REG_SZ /D agnbmfinlfpgonkehceknkpapgoibdno /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 37 /T REG_SZ /D dedphjedjalglppdfpmmibdbbkmifnbb /F
:: Fake Flash 
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 38 /T REG_SZ /D mcakfkioeanhfiojkchcndahgagcidbd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 39 /T REG_SZ /D nddmmcpmdbkooddfjcohmlcfclhllgeh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 40 /T REG_SZ /D fnipglnbhfacfmefbgiiodalehbcgcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 41 /T REG_SZ /D fldkdmkgnlbehfgeifjpjabmandnchpe /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 42 /T REG_SZ /D aiccdefnpjkolgnpdamdimejlfmopcca /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 43 /T REG_SZ /D mdjjpkalmajfkhnamkekeljbfenponih /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 44 /T REG_SZ /D kppfgjkgimgbanjbbgpmccbkagcebnid /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 45 /T REG_SZ /D omimccinlhlkpjaeaocglgmkbelejlhj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 46 /T REG_SZ /D cngjoacjdpnadhhjpdppcdjboiclnclc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 47 /T REG_SZ /D hloblpeplfiajnfdengendhdnpmdgagn /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 48 /T REG_SZ /D gmdffbblaahnjmpcjaenakkdplibibge /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 49 /T REG_SZ /D maekfnoeejhpjfkfmdlckioggdcdofpg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 50 /T REG_SZ /D cmedhionkhpnakcndndgjdbohmhepckk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 51 /T REG_SZ /D gpbfjnhlnemfnhajnmkjicfmbagfbejm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 52 /T REG_SZ /D gkhnanmhgeggclieoggjehkloolfkbdo /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 53 /T REG_SZ /D oldifepkckfmnlokobgdbjjfjjmhfgag /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 54 /T REG_SZ /D megdnjjcjgoiacejpegmfoeooleddmeb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 55 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 56 /T REG_SZ /D khnleagcghdbpphacgjjkcoceilngecl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 57 /T REG_SZ /D cegbjdefhfnbphoghdgcapnliodjbncp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 58 /T REG_SZ /D emngkmlligggbbiioginlkphcmffbncb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 59 /T REG_SZ /D jompdinfdpijbcngkadcdaladbochoae /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 60 /T REG_SZ /D pkocadmokmpjeeaimigjpmfpdaighkga /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 61 /T REG_SZ /D jaeigffnocnbblojlfmiimdocmfcjkii /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 62 /T REG_SZ /D ppdonaappkjkbgbncmmjencphdclioab /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 63 /T REG_SZ /D lalfpjdbhpmnhfofkckdpkljeilmogfl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D alcmakjhknigccfidaelkafjmfifkhkc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D fmaicbnbcbjgbpecclcnaehmbpjpdane /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D icegedoajhdclokfmeobnnbalabmpehm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D jhpheijfhpbkaejncokigfaihgdndjhg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D jbbmlecgjpijkeelnebilpekpnkaoool /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D gokhabgljglbmjilkmelajgkkhofeeij /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D klapabjimnakejfmpdolgamfplaondck /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D pclbpfjdhojdfcojcmmgggaanfnmhifk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D dhdpjhfemdchgdfngofnkgmabdmchoii /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D ckjbcmkjhocgdhmkkkieknbmhdnjanoh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D fkjdaikpmbninlknfjgehkoggdgmknel /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D eilkefcdofnagepelocjipipghaalkam /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D ocbcobiceiagblnejkcekbpgpakolhff /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D lkcohpjckebdgmdofkdfppgeejccjmnl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D fhjieeiddoiibfbdknfligkjlpihnmjc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D bkalmigiilcgdihccnaonhnkdhpfbaam /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D gkkehpomgpdgkdmbdfkangmbafecdhhd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D inejjjikomlbaahobecdaoaillmfejil /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D kllohiclobgoaffphlofnjdlabflpgha /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D ececmkgelhdncajgmofiffjmhojnimmb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D fjadbbodmeifhkgepjjkeneeojammfag /F
:: VPN
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D kalfeohpimfncbfhjhanngehpbfilokk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D nlbejmccbhkncgokjcmghpfloaajcffj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D ejkaocphofnobjdedneohbbiilggdlbi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D bihmplhobchoageeokmgbdihknkjbknd /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D aleggpabliehgbeagmfhnodcijcmbonb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D fpmapakogndmenjcfoajifaaonnkpkei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D llkbempahblbohpipifajipejjackemi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D nplnfhpilojbbcnjpiaoecppkkicfgfp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D jeajkcogjepdpppofeocjpejdckbgdco /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D eekepadogplleogcggcjkfebfjhihlnm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D mmknfaojcgjcelkoabokhaljjapiogbg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D jalmmnpclgbgcphkbnglcnlobgcbhkki /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D hkegehhbmbongohpgmdadkbkmnfokicn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D odfnofpjippoimohokldpheacfenmfch /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D oobhlpildfogoccaffnfckililknpcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D jmgacjgobknfojonlckhndlamkfcjofm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D gfceeghcoekcmlpgonlplkpmakdmpgmg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kfgffakpbnpfonmljmpfamjpnjbhfiij /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D bbebbhmelpcfmijoanocdliephmoahln /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
:: Amazon Assistant (Chrome Store Version)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 177 /T REG_SZ /D pbjikboenpfhbbejgkoklgkhjpfogcam /F
:: College Board Browser
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 178 /T REG_SZ /D lhfmngifffjhdjdgkfdhbifhndddmjko /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 179 /T REG_SZ /D hblfbmjdaalalhifaajnnodlkiloengc /F
:: ProctorU
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 180 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 181 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 182 /T REG_SZ /D kbmmbecgmmkedcifdommembgkeomigjf /F
:: Nano Adblocker / Nano Defender (Chrome Store Version)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 183 /T REG_SZ /D gabbbocakeomblphkmmnoamkioajlkfo /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 184 /T REG_SZ /D ggolfgbegefeeoocgjbmkembbncoadlb /F

:: -----------------
:: Microsoft Edge Chromium Add-on Store
:: -----------------

:: Fake Tiktok
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D eamchpjkhdjbbhdanfngombbbafoopbm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D pdjhconnbgkdigcldclgbgihmjokldbe /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D mipfipmcmnedgckncckicogmnncflhhk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D goepanlbnhiiaopmfcniejcbhgolcllb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D ccjbgffbjdbnnpdnopghofogcfeopdmn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D celdediiemogjpfcjocdbildilkccepl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D ofbgciponmcpbencjjhomeoekhnlnppj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 121 /T REG_SZ /D clklfdpdakpekcamjgiedicfnikeajcl /F
:: Fake Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 122 /T REG_SZ /D omhnkkegfjjhpkobpjdiokemdecmmebb /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 123 /T REG_SZ /D oakdjiehbhihbklollmmmkhfilbklgkf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 124 /T REG_SZ /D ffnfbjmflmibccofnlgeolaoamencnpf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 125 /T REG_SZ /D bpllndkbconceaidgcllkolimbbiojic /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 126 /T REG_SZ /D lmfhgdeejhbbcagkkbefkkgkfofjhfch /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 127 /T REG_SZ /D efpgcmfgkpmogadebodiegjleafcmdcb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 128 /T REG_SZ /D onlofoccaenllpjmalbnilfacjmcfhfk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 129 /T REG_SZ /D bpffhahkoibohjndinfiimfomedmgnme /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 130 /T REG_SZ /D kkkldohdhcfhpjchcefpkfhjfeapdmek /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 131 /T REG_SZ /D gaobomhkmmnbjgehdfjeklkbfddhjbfi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 132 /T REG_SZ /D fbobegkkdmmcnmoplkgdmfhdlkjfelnb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 133 /T REG_SZ /D jlfbbmbfbkkilahjmbjehndogohpbfmf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 134 /T REG_SZ /D bbocfgcdelebeaboidkmglbdkimdpojb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 135 /T REG_SZ /D dckihkcdmjmlkndgmmgplpcnkmdpangb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 136 /T REG_SZ /D gclhifbbggfamoojmienffegbmmfnfll /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 137 /T REG_SZ /D pafjohfpgafakkaoccipcknnaoneopei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 138 /T REG_SZ /D oggghceenfdiodiakhigmpamjpcnilin /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 139 /T REG_SZ /D lojfohldolbkplldokkjgjmcffealmka /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 140 /T REG_SZ /D nipggfgilmoiofmnkbeabghbcaohmjih /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 141 /T REG_SZ /D obmbbppggfnabhdbepdbmpcjfckkoljl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 142 /T REG_SZ /D pejdjolhgfenbjfjoejgllffflbbgecm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 143 /T REG_SZ /D kjdjplhnalcgkamkcidihcodlblkihon /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 144 /T REG_SZ /D mbdlpgncclnhomdpmicmgdihapedhhak /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 145 /T REG_SZ /D odiffgppifkpehahdcafnkloapoblbkj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 146 /T REG_SZ /D fhhdniedlnfoenmhbajomdablgpbhnad /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 147 /T REG_SZ /D bhhjenbjldcljpdofmhkdcdfmbagoong /F
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Chrome Web Store Version of force installed extensions (Microsoft addons versions already installed)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 148 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 149 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 150 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 151 /T REG_SZ /D gmgoamodcdcjnbaobigkjelfplakmdhh /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 152 /T REG_SZ /D ndcileolkflehcjpmjnfbnaibdcgglog /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 153 /T REG_SZ /D jccfboncbdccgbgcbhickioeailgpkgb /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 154 /T REG_SZ /D pciakllldcajllepkbbihkmfkikheffb /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 155 /T REG_SZ /D pdffkfellgipmhklpdmokmckkkfcopbh /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 156 /T REG_SZ /D cnlefmmeadmemmdciolhbnfeacpdfbkd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 157 /T REG_SZ /D kljjdbdffnbengiilkaiblpinbhfcfnc /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 158 /T REG_SZ /D amnbcmdbanbkjhnfoeceemmmdiepnbpp /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 159 /T REG_SZ /D fdgpikaaheckgdijjmepmdjjkbceakif /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 160 /T REG_SZ /D phhhmbgggfifgikoihlakngnngdehhfe /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 161 /T REG_SZ /D lacbjnnibafcbpogdcpfdpmajfkdampi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 162 /T REG_SZ /D iffhejniciepiiafcfhhapiidaomcdam /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 163 /T REG_SZ /D nfjgmgjhcihmkobljembcfodkajehoej /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 164 /T REG_SZ /D bdaafgjhhjkdplpffldcncdignokfkbo /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 165 /T REG_SZ /D fdhgeoginicibhagdmblfikbgbkahibd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 166 /T REG_SZ /D lamehkegphbbfdailghaeeleoajilfho /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 167 /T REG_SZ /D iiclaphjclecagpkkaacljnpcppnoibi /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 168 /T REG_SZ /D jebegceanihjkbdfnjelignmnclhpnfh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 169 /T REG_SZ /D bnplfnhcidhhdapmblniehfaaompjlck /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 170 /T REG_SZ /D eghmccdcabhgeigmkhfbnioepobdhhab /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 171 /T REG_SZ /D cjmjijnpnollocennnapedpaeecninea /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 172 /T REG_SZ /D acgiggmcehhbhfnedfkcgenplgkjddef /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 173 /T REG_SZ /D hcfdaddfkgbmekbgcepcnpfiopaigpnn /F
:: Amazon Assistant (Edge Addon Version)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 174 /T REG_SZ /D hkmnokmdbkkafgmpfhhiniclfnfpmogj /F
:: Nano Adblocker / Nano Defender (Edge Addon Version)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 175 /T REG_SZ /D epbkapkgcmdmfpogenoebpdeibmfinpf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 176 /T REG_SZ /D ijfkmnlofajajikjhfiigelipempcklj /F
:: Grammer Check Software Block
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 177 /T REG_SZ /D blnfpbeiknacmjcafapeejaljddgoain /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 178 /T REG_SZ /D kdfieneakcjfaiglcfcgkidlkmlijjnh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 179 /T REG_SZ /D oldceeleldhonbafppcapldpdifcinji /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 180 /T REG_SZ /D pjpgohokimaldkikgejifibjdpbopfdc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 181 /T REG_SZ /D gpaiobkfhnonedkhhfjpmhdalgeoebfa /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 182 /T REG_SZ /D npnbdojkgkbcdfdjlfdmplppdphlhhcf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 183 /T REG_SZ /D hamhaljjdpcgkelbadepgmnocknejief /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 184 /T REG_SZ /D ifajfiofeifbbhbionejdliodenmecna /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 185 /T REG_SZ /D dmngfggkdcjejjgbfemebfomkphgcena /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 186 /T REG_SZ /D mpeepmfabickbdbckcejbflkpfamgcon /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 187 /T REG_SZ /D dmgkiikdlhmpikkhpiplldicbnicmboc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 188 /T REG_SZ /D ndgklmlnheedegipcohgcbjhhgddendc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 189 /T REG_SZ /D ecpbljknammclncihheaiehdahccgmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 190 /T REG_SZ /D nohphjepbjannpjpmodlcgdlialokkpd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 191 /T REG_SZ /D oidhbpddkfhmipanjccneeifmmiabjng /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 192 /T REG_SZ /D nngceafehcgnogadphbkblijebijibkj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 193 /T REG_SZ /D fkjahhehbehlijcehipnhpjhldcajban /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 194 /T REG_SZ /D ljgdcokhgjdpghmhdkbolccfcfdbklpo /F
:: Tunnelbear
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 195 /T REG_SZ /D omdakjcmkglenbhjadbccaookpfjihpa /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 196 /T REG_SZ /D njglkaigokomacaljolalkopeonkpbik /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 197 /T REG_SZ /D obhacaboehinamiaoafpljgofoapchgf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 198 /T REG_SZ /D cccmaneagdjeppggplfjbemndmknmdib /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 199 /T REG_SZ /D kgddnoifhgfdhcpbkkjdgokfnkkmdcen /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 200 /T REG_SZ /D jaohnaoeopobbpjdeglffjnaclhifabp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 201 /T REG_SZ /D fnkihbploojbmldhgdfpalkoifmegfpn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 202 /T REG_SZ /D kdmoafnhillldhoddnccefecelkofphm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 203 /T REG_SZ /D keghjkfdmmdkneijbbbnopeglnakbphn /F
:: Securly Classroom
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 204 /T REG_SZ /D jfbecfmiegcjddenjhlbhlikcbfmnafd /F
:: Securly for Chromebooks (This extension force reloads tabs when extension restarts)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 205 /T REG_SZ /D iheobagjkfklnlikgihanlhcddjoihkg /F
:: Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites
:: lanschool student
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 206 /T REG_SZ /D ifeifkfohlobcbhmlfkenopaimbmnahb /F
:: lanschool web helper
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 207 /T REG_SZ /D honjcnefekfnompampcpmcdadibmjhlk /F
:: Read and Write Extension Chromium and Edge
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 208 /T REG_SZ /D inoeonmfapjbbkmdafoankkfajkcphgd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 209 /T REG_SZ /D bjglhpoliipklkfjcahfefdlfpifcinb /F
:: Other 2
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 210 /T REG_SZ /D kgeglempfkhalebjlogemlmeakondflc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 211 /T REG_SZ /D hmkphiklpggiafkgpmdekkofbadkffnn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 212 /T REG_SZ /D jdfhadodhoabdfkgkclcdpocjffadkne /F

:: -----------------

@echo OFF
goto option3
:: --------------
:option3.2Start
@echo ON

:: -----------------
:: Block Extension/Addon Install
:: -----------------

:: Chrome
REG ADD "HKCU\Software\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
:: Chromium
REG ADD "HKCU\Software\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
:: Firefox
REG DELETE "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /F
REG ADD "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_MULTI_SZ /D "{\"*\":{\"installation_mode\":\"blocked\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi\"},\"bypasspaywalls@bypasspaywalls\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"allowed\"},\"treestyletab@piro.sakura.ne.jp\":{\"installation_mode\":\"allowed\"},\"adblock-for-ff-lite@addons\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{c8476e35-1a52-831c-487c-86db836cf38c}\":{\"installation_mode\":\"blocked\"},\"jid1-q4sG8pYhq8KGHs@jetpack\":{\"installation_mode\":\"blocked\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"},\"adguardadblocker@adguard.com\":{\"installation_mode\":\"blocked\"},\"{da6554a8-470c-4d6a-a6ca-904740683552}\":{\"installation_mode\":\"blocked\"},\"jid1-93CWPmRbVPjRQA@jetpack\":{\"installation_mode\":\"blocked\"},\"87677a2c52b84ad3a151a4a72f5bd3c4@jetpack\":{\"installation_mode\":\"blocked\"},\"{6601dd36-5bb6-4755-8cd5-f36b59ff5307}\":{\"installation_mode\":\"blocked\"},\"{01e4670b-532b-42ed-88c2-c7b46d05133a}\":{\"installation_mode\":\"blocked\"},\"languagetool-webextension@languagetool.org\":{\"installation_mode\":\"blocked\"},\"abb@amazon.com\":{\"installation_mode\":\"blocked\"},\"{0f929014-5ed2-4527-8b8d-86a9c889b129}\":{\"installation_mode\":\"blocked\"},\"{f9cacf2e-cafc-4f0f-b6ad-8e1a01b4b4d0}\":{\"installation_mode\":\"blocked\"},\"{45c15c03-6d29-45d2-984c-9f1ad34f3f51}\":{\"installation_mode\":\"blocked\"},\"browser@tunnelbear.com\":{\"installation_mode\":\"blocked\"},\"rebingerext@gmail.com\":{\"installation_mode\":\"blocked\"},\"ApplicationGuardRel@microsoft.com\":{\"installation_mode\":\"blocked\"},\"{cfa868c0-6239-47df-bc81-54e13151ec2e}\":{\"installation_mode\":\"blocked\"},\"{a07b7886-3015-4959-9a88-4273860edd6d}\":{\"installation_mode\":\"blocked\"},\"{7e39f3c8-2ef5-46ea-80d0-f8b8f72541c5}\":{\"installation_mode\":\"blocked\"},\"{23bcb1d2-a715-42e2-87c5-43ba10d23ace}\":{\"installation_mode\":\"blocked\"},\"{9b43dad5-885b-4f0d-882f-e945b7e4b96f}\":{\"installation_mode\":\"blocked\"},\"{8d8ca802-6b23-43ed-9445-e05d48579542}\":{\"installation_mode\":\"blocked\"}}" /F
:: Brave
REG ADD "HKCU\Software\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
:: Microsoft Edge Chromium
REG ADD "HKCU\Software\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
:: Microsoft Edge Legacy
REG ADD "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /T REG_dWORD /D 0 /F
:: Internet Explorer
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /T REG_SZ /D no /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /T REG_dWORD /D 1 /F

@echo OFF
goto option3
:: --------------
:: --------------
:option3.3Start
@echo ON

:: -----------------
:: Allow Extension/Addon Install
:: -----------------

:: Chrome
REG DELETE "HKCU\Software\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKCU\Software\Policies\Google\Chrome" /V BlockExternalExtensions /F
:: Chromium
REG DELETE "HKCU\Software\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKCU\Software\Policies\Chromium" /V BlockExternalExtensions /F
:: Firefox
REG DELETE "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /F
REG ADD "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_MULTI_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi\"},\"bypasspaywalls@bypasspaywalls\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"allowed\"},\"treestyletab@piro.sakura.ne.jp\":{\"installation_mode\":\"allowed\"},\"adblock-for-ff-lite@addons\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{c8476e35-1a52-831c-487c-86db836cf38c}\":{\"installation_mode\":\"blocked\"},\"jid1-q4sG8pYhq8KGHs@jetpack\":{\"installation_mode\":\"blocked\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"},\"adguardadblocker@adguard.com\":{\"installation_mode\":\"blocked\"},\"{da6554a8-470c-4d6a-a6ca-904740683552}\":{\"installation_mode\":\"blocked\"},\"jid1-93CWPmRbVPjRQA@jetpack\":{\"installation_mode\":\"blocked\"},\"87677a2c52b84ad3a151a4a72f5bd3c4@jetpack\":{\"installation_mode\":\"blocked\"},\"{6601dd36-5bb6-4755-8cd5-f36b59ff5307}\":{\"installation_mode\":\"blocked\"},\"{01e4670b-532b-42ed-88c2-c7b46d05133a}\":{\"installation_mode\":\"blocked\"},\"languagetool-webextension@languagetool.org\":{\"installation_mode\":\"blocked\"},\"abb@amazon.com\":{\"installation_mode\":\"blocked\"},\"{0f929014-5ed2-4527-8b8d-86a9c889b129}\":{\"installation_mode\":\"blocked\"},\"{f9cacf2e-cafc-4f0f-b6ad-8e1a01b4b4d0}\":{\"installation_mode\":\"blocked\"},\"{45c15c03-6d29-45d2-984c-9f1ad34f3f51}\":{\"installation_mode\":\"blocked\"},\"browser@tunnelbear.com\":{\"installation_mode\":\"blocked\"},\"rebingerext@gmail.com\":{\"installation_mode\":\"blocked\"},\"ApplicationGuardRel@microsoft.com\":{\"installation_mode\":\"blocked\"},\"{cfa868c0-6239-47df-bc81-54e13151ec2e}\":{\"installation_mode\":\"blocked\"},\"{a07b7886-3015-4959-9a88-4273860edd6d}\":{\"installation_mode\":\"blocked\"},\"{7e39f3c8-2ef5-46ea-80d0-f8b8f72541c5}\":{\"installation_mode\":\"blocked\"},\"{23bcb1d2-a715-42e2-87c5-43ba10d23ace}\":{\"installation_mode\":\"blocked\"},\"{9b43dad5-885b-4f0d-882f-e945b7e4b96f}\":{\"installation_mode\":\"blocked\"},\"{8d8ca802-6b23-43ed-9445-e05d48579542}\":{\"installation_mode\":\"blocked\"}}" /F
:: Brave
REG DELETE "HKCU\Software\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKCU\Software\Policies\BraveSoftware\Brave" /V BlockExternalExtensions /F
:: Microsoft Edge Chromium
REG DELETE "HKCU\Software\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKCU\Software\Policies\Microsoft\Edge" /V BlockExternalExtensions /F
:: Microsoft Edge Legacy
REG DELETE "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /F
REG DELETE "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /F
:: Internet Explorer
REG DELETE "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /F
REG DELETE "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /F

@echo OFF
goto option3
:: --------------

:: ------------------------------------------------------------------------------------
:option4
echo -------
echo.
echo You have selected Option 4: Enable/Disable OneDrive
:option4redo
echo.
echo ------- IMPORTANT ----------
echo.
echo Disabling OneDrive will completely remove and disable all OneDrive functions
echo.
echo When enabling OneDrive, you will need to manually re-install OneDrive
echo.
echo ----------------------------
echo.
echo Select a task:
echo.
echo 1) Uninstall and Disable OneDrive
echo.
echo 2) Enable OneDrive
echo.
echo 3) Return
echo.
echo 4) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option4.1
if "%op%"=="2" goto option4.2

if "%op%"=="3" goto mainMenu
if "%op%"=="4" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option4redo

:: --------------
:option4.1
echo.
echo -------
echo.

:option4.1redo

echo ------- IMPORTANT ----------
echo.
echo Disabling OneDrive will completely remove and disable all OneDrive functions
echo.
echo ----------------------------

set /p op="Uninstall and Disable OneDrive? (y/n) "
if "%op%"=="y" goto option4.1Start
if "%op%"=="yes" goto option4.1Start
if "%op%"=="Yes" goto option4.1Start
if "%op%"=="Y" goto option4.1Start
if "%op%"=="YES" goto option4.1Start

if "%op%"=="n" goto option4
if "%op%"=="no" goto option4
if "%op%"=="No" goto option4
if "%op%"=="N" goto option4
if "%op%"=="NO" goto option4

if "%op%"=="cancel" goto option4
if "%op%"=="Cancel" goto option4
if "%op%"=="CANCEL" goto option4

if "%op%"=="stop" goto option4
if "%op%"=="Stop" goto option4
if "%op%"=="STOP" goto option4

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option4.1redo

:: --------------

:option4.2
echo.
echo -------
echo.

:option4.2redo

echo ------- IMPORTANT ----------
echo.
echo When enabling OneDrive, you will need to manually re-install OneDrive
echo.
echo ----------------------------

set /p op="Enable OneDrive? (y/n) "
if "%op%"=="y" goto option4.2Start
if "%op%"=="yes" goto option4.2Start
if "%op%"=="Yes" goto option4.2Start
if "%op%"=="Y" goto option4.2Start
if "%op%"=="YES" goto option4.2Start

if "%op%"=="n" goto option4
if "%op%"=="no" goto option4
if "%op%"=="No" goto option4
if "%op%"=="N" goto option4
if "%op%"=="NO" goto option4

if "%op%"=="cancel" goto option4
if "%op%"=="Cancel" goto option4
if "%op%"=="CANCEL" goto option4

if "%op%"=="stop" goto option4
if "%op%"=="Stop" goto option4
if "%op%"=="STOP" goto option4

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option4.2redo

:: --------------

:option4.1Start
@echo ON

:: -----------------
:: Uninstall and Disable OneDrive
:: -----------------

TASKKILL /F /IM OneDrive.exe

REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /V System.IsPinnedToNameSpaceTree /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSyncNGSC /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSync /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Microsoft\OneDrive" /V PreventNetworkTrafficPreUserSignIn /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableMeteredNetworkFileSync /T REG_dWORD /D 0 /F

%windir%\SysWOW64\OneDriveSetup.exe /uninstall

%windir%\System32\OneDriveSetup.exe /uninstall

takeown /f "%UserProfile%\AppData\Local\Microsoft\OneDrive" /a /r /d y
icacls "%UserProfile%\AppData\Local\Microsoft\OneDrive" /grant administrators:F /t /q
rd /s /q "%UserProfile%\AppData\Local\Microsoft\OneDrive"

takeown /f "%ProgramData%\Microsoft OneDrive" /a /r /d y
icacls "%ProgramData%\Microsoft OneDrive" /grant administrators:F /t /q
rd /s /q "%ProgramData%\Microsoft OneDrive"

takeown /f "%UserProfile%\OneDrive" /a /r /d y
icacls "%UserProfile%\OneDrive" /grant administrators:F /t /q
rd /s /q "%UserProfile%\OneDrive"

@echo OFF
goto option4

:: --------------

:option4.2Start
@echo ON

:: -----------------
:: Enable OneDrive
:: -----------------

:: When enabling OneDrive, you will need to manually re-install OneDrive

REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /V System.IsPinnedToNameSpaceTree /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSyncNGSC /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSync /T REG_dWORD /D 0 /F

REG ADD "HKLM\SOFTWARE\Microsoft\OneDrive" /V PreventNetworkTrafficPreUserSignIn /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableMeteredNetworkFileSync /T REG_dWORD /D 0 /F

md "%UserProfile%\AppData\Local\Microsoft\OneDrive"

md "%ProgramData%\Microsoft OneDrive"

md "%UserProfile%\OneDrive"

@echo OFF
goto option4
:: ------------------------------------------------------------------------------------
:option5
echo -------
echo.
echo You have selected Option 5: Remove Microsoft Edge
:option5redo
echo.
echo ------- IMPORTANT ----------
echo.
echo The Start Menu Icon for Microsoft Edge Legacy cannot be removed,
echo However, pressing the Microsoft Edge Icon will not launch Microsoft Edge
echo.
echo ----------------------------
echo.
echo Select a task:
echo.
echo 1) Remove Microsoft Edge Chromium and Microsoft Edge Legacy
echo.
echo 2) Allow Reinstall of Microsoft Edge Chromium only
echo.
echo 3) Return
echo.
echo 4) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option5.1
if "%op%"=="2" goto option5.2

if "%op%"=="3" goto mainMenu
if "%op%"=="4" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option5redo

:: --------------
:option5.1
echo.
echo -------
echo.

:option5.1redo

echo ------- IMPORTANT ----------
echo.
echo The Start Menu Icon for Microsoft Edge Legacy cannot be removed, 
echo Windows 10 will view it as ms-resource:AppName, and move it to the bottom of the app list
echo.
echo To fully remove Microsoft Edge Chromium from the Control Panel List, taking over and deleting registry keys is required
echo.
echo Microsoft Edge Chromium Registry Keys:
echo	Take over control and delete these registry keys
echo.
echo	HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
echo.
echo	HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
echo.
echo Go To (x64 OS): %ProgramFiles(x86)%\Microsoft\Edge\Application
echo Go To (x86 OS): %ProgramFiles%\Microsoft\Edge\Application
echo.
echo ----------------------------

set /p op="Remove Microsoft Edge Chromium and Microsoft Edge Legacy? (y/n) "
if "%op%"=="y" goto option5.1Start
if "%op%"=="yes" goto option5.1Start
if "%op%"=="Yes" goto option5.1Start
if "%op%"=="Y" goto option5.1Start
if "%op%"=="YES" goto option5.1Start

if "%op%"=="n" goto option5
if "%op%"=="no" goto option5
if "%op%"=="No" goto option5
if "%op%"=="N" goto option5
if "%op%"=="NO" goto option5

if "%op%"=="cancel" goto option5
if "%op%"=="Cancel" goto option5
if "%op%"=="CANCEL" goto option5

if "%op%"=="stop" goto option5
if "%op%"=="Stop" goto option5
if "%op%"=="STOP" goto option5

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option5.1redo

:: --------------

:option5.2
echo.
echo -------
echo.

:option5.2redo

echo ------- IMPORTANT ----------
echo.
echo You will still need to manually Reinstall Microsoft Edge Chromium through an .exe file or a .msi file
echo.
echo ----------------------------

set /p op="Allow Reinstall of Microsoft Edge Chromium? (y/n) "
if "%op%"=="y" goto option5.2Start
if "%op%"=="yes" goto option5.2Start
if "%op%"=="Yes" goto option5.2Start
if "%op%"=="Y" goto option5.2Start
if "%op%"=="YES" goto option5.2Start

if "%op%"=="n" goto option5
if "%op%"=="no" goto option5
if "%op%"=="No" goto option5
if "%op%"=="N" goto option5
if "%op%"=="NO" goto option5

if "%op%"=="cancel" goto option5
if "%op%"=="Cancel" goto option5
if "%op%"=="CANCEL" goto option5

if "%op%"=="stop" goto option5
if "%op%"=="Stop" goto option5
if "%op%"=="STOP" goto option5

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option5.2redo

:: --------------
:option5.1Start
@echo ON

:: -----------------
:: Remove Microsoft Edge Chromium and Prevent Reinstall
:: -----------------

TASKKILL /F /IM msedge.exe

takeown /f "%ProgramFiles(x86)%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /grant administrators:F /t /q

takeown /f "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /grant administrators:F /t /q

takeown /f "%ProgramFiles%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles%\Microsoft\Edge" /grant administrators:F /t /q

takeown /f "%ProgramFiles%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /grant administrators:F /t /q

takeown /f "%UserProfile%\AppData\Local\Microsoft\Edge" /a /r /d y
icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /grant administrators:F /t /q


REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /V NoRemove /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /V NoRemove /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /V NoRepair /T REG_dWORD /D 0 /F

%SystemDrive%\ProgramFiles (x86)\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%SystemDrive%\ProgramFiles\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

%SystemDrive%\ProgramFiles (x86)\Microsoft\Edge\Application\89.0.774.68\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%SystemDrive%\ProgramFiles\Microsoft\Edge\Application\89.0.774.68\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

%SystemDrive%\ProgramFiles (x86)\Microsoft\Edge\Application\90.0.818.62\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%SystemDrive%\ProgramFiles\Microsoft\Edge\Application\90.0.818.62\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

rd /s /q "%ProgramFiles(x86)%\Microsoft\Edge"
md "%ProgramFiles(x86)%\Microsoft\Edge"
takeown /f "%ProgramFiles(x86)%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /inheritance:r
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /grant administrators:F /t /q
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /deny everyone:F /t /q

rd /s /q "%ProgramFiles(x86)%\Microsoft\EdgeUpdate"
md "%ProgramFiles(x86)%\Microsoft\EdgeUpdate"
takeown /f "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /inheritance:r
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /grant administrators:F /t /q
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /deny everyone:F /t /q

rd /s /q "%ProgramFiles%\Microsoft\Edge"
md "%ProgramFiles%\Microsoft\Edge"
takeown /f "%ProgramFiles%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles%\Microsoft\Edge" /inheritance:r
icacls "%ProgramFiles%\Microsoft\Edge" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\Edge" /deny everyone:F /t /q

rd /s /q "%ProgramFiles%\Microsoft\EdgeUpdate"
md "%ProgramFiles%\Microsoft\EdgeUpdate"
takeown /f "%ProgramFiles%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /inheritance:r
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /deny everyone:F /t /q

:: rd /s /q "%UserProfile%\AppData\Local\Microsoft\Edge"
:: md "%UserProfile%\AppData\Local\Microsoft\Edge"
:: takeown /f "%UserProfile%\AppData\Local\Microsoft\Edge" /a /r /d y
:: icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /inheritance:r
:: icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /grant administrators:F /t /q
:: icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /deny everyone:F /t /q

REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /V NoModify /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /V NoRepair /T REG_dWORD /D 0 /F

REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /F
REG DELETE "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /F
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /F
REG DELETE "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /F
REG DELETE "HKLM\SOFTWARE\Clients\StartMenuInternet\Microsoft Edge" /F

:: -----------------
:: Remove Microsoft Edge Legacy
:: -----------------

TASKKILL /F /IM MicrosoftEdge.exe

takeown /f "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" && md "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
takeown /f "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /deny everyone:F /t /q

takeown /f "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" && md "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
takeown /f "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /deny everyone:F /t /q

:: takeown /f "%UserProfile%\AppData\Local\MicrosoftEdge" /a /r /d y
:: icacls "%UserProfile%\AppData\Local\MicrosoftEdge" /grant administrators:F /t /q
:: rd /s /q "%UserProfile%\AppData\Local\MicrosoftEdge"

:: takeown /f "%UserProfile%\MicrosoftEdgeBackups" /a /r /d y
:: icacls "%UserProfile%\MicrosoftEdgeBackups" /grant administrators:F /t /q
:: rd /s /q "%UserProfile%\MicrosoftEdgeBackups"

@echo OFF
goto option5
:: --------------
:option5.2Start
@echo ON

:: -----------------
:: Allow Reinstall of Microsoft Edge Chromium
:: -----------------

takeown /f "%ProgramFiles(x86)%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\Edge" /inheritance:e

takeown /f "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\Edge" /inheritance:e

takeown /f "%ProgramFiles%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles%\Microsoft\Edge" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\Edge" /inheritance:e

takeown /f "%ProgramFiles%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\Edge" /inheritance:e

takeown /f "%UserProfile%\AppData\Local\Microsoft\Edge" /a /r /d y
icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\Edge" /inheritance:e

@echo OFF
goto option5
:: ------------------------------------------------------------------------------------
:option6
echo -------
echo.
echo You have selected Option 6: Username Visibility
:option6redo
echo.
echo Select a task:
echo.
echo 1) Hide Username on Login Screen Only
echo.
echo 2) Hide Username on Login and Lock Screen
echo.
echo 3) (Already included in Main) Hide Username on UAC Prompt
echo.
echo 4) Show Username on Login and Lock Screen
echo.
echo 5) Show Username on UAC Prompt
echo.
echo 6) Return
echo.
echo 7) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option6.1
if "%op%"=="2" goto option6.2
if "%op%"=="3" goto option6.3
if "%op%"=="4" goto option6.4
if "%op%"=="5" goto option6.5

if "%op%"=="6" goto mainMenu
if "%op%"=="7" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option6redo

:: --------------
:option6.1
echo.
echo -------
echo.

:option6.1redo

set /p op="Hide Username on Login Screen Only? (y/n) "
if "%op%"=="y" goto option6.1Start
if "%op%"=="yes" goto option6.1Start
if "%op%"=="Yes" goto option6.1Start
if "%op%"=="Y" goto option6.1Start
if "%op%"=="YES" goto option6.1Start

if "%op%"=="n" goto option6
if "%op%"=="no" goto option6
if "%op%"=="No" goto option6
if "%op%"=="N" goto option6
if "%op%"=="NO" goto option6

if "%op%"=="cancel" goto option6
if "%op%"=="Cancel" goto option6
if "%op%"=="CANCEL" goto option6

if "%op%"=="stop" goto option6
if "%op%"=="Stop" goto option6
if "%op%"=="STOP" goto option6

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option6.1redo

:: --------------

:option6.2
echo.
echo -------
echo.

:option6.2redo

set /p op="Hide Username on Login and Lock Screen? (y/n) "
if "%op%"=="y" goto option6.2Start
if "%op%"=="yes" goto option6.2Start
if "%op%"=="Yes" goto option6.2Start
if "%op%"=="Y" goto option6.2Start
if "%op%"=="YES" goto option6.2Start

if "%op%"=="n" goto option6
if "%op%"=="no" goto option6
if "%op%"=="No" goto option6
if "%op%"=="N" goto option6
if "%op%"=="NO" goto option6

if "%op%"=="cancel" goto option6
if "%op%"=="Cancel" goto option6
if "%op%"=="CANCEL" goto option6

if "%op%"=="stop" goto option6
if "%op%"=="Stop" goto option6
if "%op%"=="STOP" goto option6

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option6.2redo

:: --------------

:option6.3
echo.
echo -------
echo.

:option6.3redo

set /p op="(Already included in Main) Hide Username on UAC Prompt? (y/n) "
if "%op%"=="y" goto option6.3Start
if "%op%"=="yes" goto option6.3Start
if "%op%"=="Yes" goto option6.3Start
if "%op%"=="Y" goto option6.3Start
if "%op%"=="YES" goto option6.3Start

if "%op%"=="n" goto option6
if "%op%"=="no" goto option6
if "%op%"=="No" goto option6
if "%op%"=="N" goto option6
if "%op%"=="NO" goto option6

if "%op%"=="cancel" goto option6
if "%op%"=="Cancel" goto option6
if "%op%"=="CANCEL" goto option6

if "%op%"=="stop" goto option6
if "%op%"=="Stop" goto option6
if "%op%"=="STOP" goto option6

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option6.3redo

:: --------------

:option6.4
echo.
echo -------
echo.

:option6.4redo

set /p op="Show Username on Login and Lock Screen? (y/n) "
if "%op%"=="y" goto option6.4Start
if "%op%"=="yes" goto option6.4Start
if "%op%"=="Yes" goto option6.4Start
if "%op%"=="Y" goto option6.4Start
if "%op%"=="YES" goto option6.4Start

if "%op%"=="n" goto option6
if "%op%"=="no" goto option6
if "%op%"=="No" goto option6
if "%op%"=="N" goto option6
if "%op%"=="NO" goto option6

if "%op%"=="cancel" goto option6
if "%op%"=="Cancel" goto option6
if "%op%"=="CANCEL" goto option6

if "%op%"=="stop" goto option6
if "%op%"=="Stop" goto option6
if "%op%"=="STOP" goto option6

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option6.4redo

:: --------------


:option6.5
echo.
echo -------
echo.

:option6.5redo

set /p op="Show Username on UAC Prompt? (y/n) "
if "%op%"=="y" goto option6.5Start
if "%op%"=="yes" goto option6.5Start
if "%op%"=="Yes" goto option6.5Start
if "%op%"=="Y" goto option6.5Start
if "%op%"=="YES" goto option6.5Start

if "%op%"=="n" goto option6
if "%op%"=="no" goto option6
if "%op%"=="No" goto option6
if "%op%"=="N" goto option6
if "%op%"=="NO" goto option6

if "%op%"=="cancel" goto option6
if "%op%"=="Cancel" goto option6
if "%op%"=="CANCEL" goto option6

if "%op%"=="stop" goto option6
if "%op%"=="Stop" goto option6
if "%op%"=="STOP" goto option6

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option6.5redo

:: --------------

:option6.1Start
@echo ON

:: Hide Username on Login Screen Only
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V dontdisplaylastusername /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DontDisplayLockedUserID /T REG_dWORD /D 1 /F

@echo OFF
goto option6

:: --------------

:option6.2Start
@echo ON

:: Hide Username on Login and Lock Screen
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V dontdisplaylastusername /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DontDisplayLockedUserID /T REG_dWORD /D 3 /F

@echo OFF
goto option6

:: --------------

:option6.3Start
@echo ON

:: (Already included in Main) Hide Username on UAC Prompt
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnumerateAdministrators /T REG_dWORD /D 0 /F

@echo OFF
goto option6

:: --------------

:option6.4Start
@echo ON

:: Undo Hide Username on Login and Lock Screen
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V dontdisplaylastusername /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DontDisplayLockedUserID /T REG_dWORD /D 0 /F

@echo OFF
goto option6

:: --------------

:option6.5Start
@echo ON

:: Undo Hide Username on UAC Prompt
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnumerateAdministrators /T REG_dWORD /D 1 /F

@echo OFF
goto option6
:: ------------------------------------------------------------------------------------
:option7
echo -------
echo.
echo You have selected Option 7: Ctrl-Alt-Del Options
:option7redo
echo.
echo Select a task:
echo.
echo 1) Require Ctrl-Alt-Del on Login
echo.
echo 2) Require Ctrl-Alt-Del on UAC
echo.
echo 3) Disable ability to change account password on Ctrl-Alt-Del Screen
echo.
echo 4) Do Not Require Ctrl-Alt-Del on Login
echo.
echo 5) Do Not Require Ctrl-Alt-Del on UAC
echo.
echo 6) Enable ability to change account password on Ctrl-Alt-Del Screen
echo.
echo 7) Return
echo.
echo 8) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option7.1
if "%op%"=="2" goto option7.2
if "%op%"=="3" goto option7.3
if "%op%"=="4" goto option7.4
if "%op%"=="5" goto option7.5
if "%op%"=="6" goto option7.6

if "%op%"=="7" goto mainMenu
if "%op%"=="8" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option7redo

:: --------------
:option7.1
echo.
echo -------
echo.

:option7.1redo

set /p op="Require Ctrl-Alt-Del on Login? (y/n) "
if "%op%"=="y" goto option7.1Start
if "%op%"=="yes" goto option7.1Start
if "%op%"=="Yes" goto option7.1Start
if "%op%"=="Y" goto option7.1Start
if "%op%"=="YES" goto option7.1Start

if "%op%"=="n" goto option7
if "%op%"=="no" goto option7
if "%op%"=="No" goto option7
if "%op%"=="N" goto option7
if "%op%"=="NO" goto option7

if "%op%"=="cancel" goto option7
if "%op%"=="Cancel" goto option7
if "%op%"=="CANCEL" goto option7

if "%op%"=="stop" goto option7
if "%op%"=="Stop" goto option7
if "%op%"=="STOP" goto option7

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option7.1redo

:: --------------

:option7.2
echo.
echo -------
echo.

:option7.2redo

set /p op="Require Ctrl-Alt-Del on UAC? (y/n) "
if "%op%"=="y" goto option7.2Start
if "%op%"=="yes" goto option7.2Start
if "%op%"=="Yes" goto option7.2Start
if "%op%"=="Y" goto option7.2Start
if "%op%"=="YES" goto option7.2Start

if "%op%"=="n" goto option7
if "%op%"=="no" goto option7
if "%op%"=="No" goto option7
if "%op%"=="N" goto option7
if "%op%"=="NO" goto option7

if "%op%"=="cancel" goto option7
if "%op%"=="Cancel" goto option7
if "%op%"=="CANCEL" goto option7

if "%op%"=="stop" goto option7
if "%op%"=="Stop" goto option7
if "%op%"=="STOP" goto option7

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option7.2redo

:: --------------

:option7.3
echo.
echo -------
echo.

:option7.3redo

set /p op="Disable ability to change account password on Ctrl-Alt-Del Screen? (y/n) "
if "%op%"=="y" goto option7.3Start
if "%op%"=="yes" goto option7.3Start
if "%op%"=="Yes" goto option7.3Start
if "%op%"=="Y" goto option7.3Start
if "%op%"=="YES" goto option7.3Start

if "%op%"=="n" goto option7
if "%op%"=="no" goto option7
if "%op%"=="No" goto option7
if "%op%"=="N" goto option7
if "%op%"=="NO" goto option7

if "%op%"=="cancel" goto option7
if "%op%"=="Cancel" goto option7
if "%op%"=="CANCEL" goto option7

if "%op%"=="stop" goto option7
if "%op%"=="Stop" goto option7
if "%op%"=="STOP" goto option7

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option7.3redo

:: --------------

:option7.4
echo.
echo -------
echo.

:option7.4redo

set /p op="Do Not Require Ctrl-Alt-Del on Login? (y/n) "
if "%op%"=="y" goto option7.4Start
if "%op%"=="yes" goto option7.4Start
if "%op%"=="Yes" goto option7.4Start
if "%op%"=="Y" goto option7.4Start
if "%op%"=="YES" goto option7.4Start

if "%op%"=="n" goto option7
if "%op%"=="no" goto option7
if "%op%"=="No" goto option7
if "%op%"=="N" goto option7
if "%op%"=="NO" goto option7

if "%op%"=="cancel" goto option7
if "%op%"=="Cancel" goto option7
if "%op%"=="CANCEL" goto option7

if "%op%"=="stop" goto option7
if "%op%"=="Stop" goto option7
if "%op%"=="STOP" goto option7

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option7.4redo

:: --------------

:option7.5
echo.
echo -------
echo.

:option7.5redo

set /p op="Do Not Require Ctrl-Alt-Del on UAC? (y/n) "
if "%op%"=="y" goto option7.5Start
if "%op%"=="yes" goto option7.5Start
if "%op%"=="Yes" goto option7.5Start
if "%op%"=="Y" goto option7.5Start
if "%op%"=="YES" goto option7.5Start

if "%op%"=="n" goto option7
if "%op%"=="no" goto option7
if "%op%"=="No" goto option7
if "%op%"=="N" goto option7
if "%op%"=="NO" goto option7

if "%op%"=="cancel" goto option7
if "%op%"=="Cancel" goto option7
if "%op%"=="CANCEL" goto option7

if "%op%"=="stop" goto option7
if "%op%"=="Stop" goto option7
if "%op%"=="STOP" goto option7

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option7.5redo

:: --------------


:option7.6
echo.
echo -------
echo.

:option7.6redo

set /p op="Enable ability to change account password on Ctrl-Alt-Del Screen? (y/n) "
if "%op%"=="y" goto option7.6Start
if "%op%"=="yes" goto option7.6Start
if "%op%"=="Yes" goto option7.6Start
if "%op%"=="Y" goto option7.6Start
if "%op%"=="YES" goto option7.6Start

if "%op%"=="n" goto option7
if "%op%"=="no" goto option7
if "%op%"=="No" goto option7
if "%op%"=="N" goto option7
if "%op%"=="NO" goto option7

if "%op%"=="cancel" goto option7
if "%op%"=="Cancel" goto option7
if "%op%"=="CANCEL" goto option7

if "%op%"=="stop" goto option7
if "%op%"=="Stop" goto option7
if "%op%"=="STOP" goto option7

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option7.6redo

:: --------------

:option7.1Start
@echo ON

:: Require Ctrl-Alt-Del on Login
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V DisableCAD /T REG_dWORD /D 0 /F

@echo OFF
goto option7

:: --------------

:option7.2Start
@echo ON

:: Require Ctrl-Alt-Del on UAC
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnableSecureCredentialPrompting /T REG_dWORD /D 1 /F

@echo OFF
goto option7

:: --------------

:option7.3Start
@echo ON

:: Disable ability to change account password on Ctrl-Alt-Del Screen
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableChangePassword /T REG_dWORD /D 1 /F

@echo OFF
goto option7

:: --------------

:option7.4Start
@echo ON

:: Do Not Require Ctrl-Alt-Del on Login
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V DisableCAD /T REG_dWORD /D 1 /F

@echo OFF
goto option7

:: --------------

:option7.5Start
@echo ON

:: Do Not Require Ctrl-Alt-Del on UAC
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnableSecureCredentialPrompting /T REG_dWORD /D 0 /F

@echo OFF
goto option7

:: --------------

:option7.6Start
@echo ON

:: Enable ability to change account password on Ctrl-Alt-Del Screen
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableChangePassword /T REG_dWORD /D 0 /F


@echo OFF
goto option7

:: ------------------------------------------------------------------------------------

:option8
echo -------
echo.
echo You have selected Option 8: Extra Policies to lock down user account
:option8redo
echo.
echo ------- WARNING ----------
echo.
echo This will disable many functions when run on an user account
echo These policies only affect the current user account that it is run on
echo.
echo Before running this, set the user account that you want to restrict to the Administrators group, run this batch script on that user account,
echo then sign out of that account and set it back to the Users group
echo.
echo  -- WARNING --
echo This will prevent a user account from accessing Run, Command Prompt, Powershell, and the Registry
echo This will also disable extension/addon install on Chrome, Chromium, Firefox, Brave, Microsoft Edge Chromium, Microsoft Edge Legacy, and Internet Explorer
echo These restrictions take effect once you sign out and sign back in of the user account
echo.
echo Option 1 Fully Disables Control Panel and Settings App
echo.
echo Option 2 Limits the Control Panel and Settings App
echo.
echo ----------------------------
echo.
echo Select a task:
echo.
echo 1) Restrict User Account (Block Control Panel and Settings)
echo.
echo 2) Restrict User Account (Limit Control Panel and Settings)
echo.
echo 3) Undo Restrict User Account
echo.
echo 4) Return
echo.
echo 5) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option8.1
if "%op%"=="2" goto option8.2
if "%op%"=="3" goto option8.3

if "%op%"=="4" goto mainMenu
if "%op%"=="5" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option8redo

:: --------------
:option8.1
echo.
echo -------
echo.

:option8.1redo

echo ------- WARNING ----------
echo.
echo This will disable many functions when run on an user account
echo These policies only affect the current user account that it is run on
echo.
echo Before running this, set the user account that you want to restrict to the Administrators group, run this batch script on that user account,
echo then sign out of that account and set it back to the Users group
echo.
echo  -- WARNING --
echo This will prevent a user account from accessing Run, Command Prompt, Powershell, and the Registry
echo This will also disable extension/addon install on Chrome, Chromium, Firefox, Brave, Microsoft Edge Chromium, Microsoft Edge Legacy, and Internet Explorer
echo These restrictions take effect once you sign out and sign back in of the user account
echo.
echo This Option (Option 1) Fully Disables Control Panel and Settings App
echo.
echo ----------------------------

set /p op="Restrict User Account (Block Control Panel and Settings)? (yes/n) "
if "%op%"=="y" goto option8.1warn
if "%op%"=="Y" goto option8.1warn

if "%op%"=="yes" goto option8.1Start
if "%op%"=="Yes" goto option8.1Start
if "%op%"=="YES" goto option8.1Start

if "%op%"=="n" goto option8
if "%op%"=="no" goto option8
if "%op%"=="No" goto option8
if "%op%"=="N" goto option8
if "%op%"=="NO" goto option8

if "%op%"=="cancel" goto option8
if "%op%"=="Cancel" goto option8
if "%op%"=="CANCEL" goto option8

if "%op%"=="stop" goto option8
if "%op%"=="Stop" goto option8
if "%op%"=="STOP" goto option8

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option8.1redo

:option8.1warn
echo.
echo -------
echo TYPE YES TO CONTINUE
echo.
goto option8.1redo

:: --------------

:option8.2
echo.
echo -------
echo.

:option8.2redo

echo ------- WARNING ----------
echo.
echo This will disable many functions when run on an user account
echo These policies only affect the current user account that it is run on
echo.
echo Before running this, set the user account that you want to restrict to the Administrators group, run this batch script on that user account,
echo then sign out of that account and set it back to the Users group
echo.
echo  -- WARNING --
echo This will prevent a user account from accessing Run, Command Prompt, Powershell, and the Registry
echo This will also disable extension/addon install on Chrome, Chromium, Firefox, Brave, Microsoft Edge Chromium, Microsoft Edge Legacy, and Internet Explorer
echo These restrictions take effect once you sign out and sign back in of the user account
echo.
echo This Option (Option 2) Limits the Control Panel and Settings App
echo.
echo ----------------------------

set /p op="Restrict User Account (Limit Control Panel and Settings)? (yes/n) "
if "%op%"=="y" goto option8.2warn
if "%op%"=="Y" goto option8.2warn

if "%op%"=="yes" goto option8.2Start
if "%op%"=="Yes" goto option8.2Start
if "%op%"=="YES" goto option8.2Start

if "%op%"=="n" goto option8
if "%op%"=="no" goto option8
if "%op%"=="No" goto option8
if "%op%"=="N" goto option8
if "%op%"=="NO" goto option8

if "%op%"=="cancel" goto option8
if "%op%"=="Cancel" goto option8
if "%op%"=="CANCEL" goto option8

if "%op%"=="stop" goto option8
if "%op%"=="Stop" goto option8
if "%op%"=="STOP" goto option8

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option8.2redo

:option8.2warn
echo.
echo -------
echo TYPE YES TO CONTINUE
echo.
goto option8.2redo

:: --------------

:option8.3
echo.
echo -------
echo.

:option8.3redo

set /p op="Undo Restrict User Account? (y/n) "
if "%op%"=="y" goto option8.3Start
if "%op%"=="yes" goto option8.3Start
if "%op%"=="Yes" goto option8.3Start
if "%op%"=="Y" goto option8.3Start
if "%op%"=="YES" goto option8.3Start

if "%op%"=="n" goto option8
if "%op%"=="no" goto option8
if "%op%"=="No" goto option8
if "%op%"=="N" goto option8
if "%op%"=="NO" goto option8

if "%op%"=="cancel" goto option8
if "%op%"=="Cancel" goto option8
if "%op%"=="CANCEL" goto option8

if "%op%"=="stop" goto option8
if "%op%"=="Stop" goto option8
if "%op%"=="STOP" goto option8

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option8.3redo

:: --------------

:option8.1Start
@echo ON

:: ---
:: Restrict Extension/Addon Install
:: ---

:: Chrome
REG ADD "HKCU\Software\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Chromium
REG ADD "HKCU\Software\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Firefox
REG DELETE "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /F
REG ADD "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_MULTI_SZ /D "{\"*\":{\"installation_mode\":\"blocked\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi\"},\"bypasspaywalls@bypasspaywalls\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"allowed\"},\"treestyletab@piro.sakura.ne.jp\":{\"installation_mode\":\"allowed\"},\"adblock-for-ff-lite@addons\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{c8476e35-1a52-831c-487c-86db836cf38c}\":{\"installation_mode\":\"blocked\"},\"jid1-q4sG8pYhq8KGHs@jetpack\":{\"installation_mode\":\"blocked\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"},\"adguardadblocker@adguard.com\":{\"installation_mode\":\"blocked\"},\"{da6554a8-470c-4d6a-a6ca-904740683552}\":{\"installation_mode\":\"blocked\"},\"jid1-93CWPmRbVPjRQA@jetpack\":{\"installation_mode\":\"blocked\"},\"87677a2c52b84ad3a151a4a72f5bd3c4@jetpack\":{\"installation_mode\":\"blocked\"},\"{6601dd36-5bb6-4755-8cd5-f36b59ff5307}\":{\"installation_mode\":\"blocked\"},\"{01e4670b-532b-42ed-88c2-c7b46d05133a}\":{\"installation_mode\":\"blocked\"},\"languagetool-webextension@languagetool.org\":{\"installation_mode\":\"blocked\"},\"abb@amazon.com\":{\"installation_mode\":\"blocked\"},\"{0f929014-5ed2-4527-8b8d-86a9c889b129}\":{\"installation_mode\":\"blocked\"},\"{f9cacf2e-cafc-4f0f-b6ad-8e1a01b4b4d0}\":{\"installation_mode\":\"blocked\"},\"{45c15c03-6d29-45d2-984c-9f1ad34f3f51}\":{\"installation_mode\":\"blocked\"},\"browser@tunnelbear.com\":{\"installation_mode\":\"blocked\"},\"rebingerext@gmail.com\":{\"installation_mode\":\"blocked\"},\"ApplicationGuardRel@microsoft.com\":{\"installation_mode\":\"blocked\"},\"{cfa868c0-6239-47df-bc81-54e13151ec2e}\":{\"installation_mode\":\"blocked\"},\"{a07b7886-3015-4959-9a88-4273860edd6d}\":{\"installation_mode\":\"blocked\"},\"{7e39f3c8-2ef5-46ea-80d0-f8b8f72541c5}\":{\"installation_mode\":\"blocked\"},\"{23bcb1d2-a715-42e2-87c5-43ba10d23ace}\":{\"installation_mode\":\"blocked\"},\"{9b43dad5-885b-4f0d-882f-e945b7e4b96f}\":{\"installation_mode\":\"blocked\"},\"{8d8ca802-6b23-43ed-9445-e05d48579542}\":{\"installation_mode\":\"blocked\"}}" /F

:: Brave
REG ADD "HKCU\Software\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Microsoft Edge Chromium
REG ADD "HKCU\Software\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Microsoft Edge Legacy
REG ADD "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /T REG_dWORD /D 0 /F

:: Internet Explorer
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /T REG_SZ /D no /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /T REG_dWORD /D 1 /F

:: ---
:: Block Settings and Control Panel
:: ---
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoControlPanel /T REG_dWORD /D 1 /F

:: ---
:: Block Run
:: ---
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRun /T REG_dWORD /D 1 /F

:: ---
:: Block Powershell and Registry
:: ---

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun /T REG_dWORD /D 1 /F

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 1 /T REG_SZ /D "powershell.exe" /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 2 /T REG_SZ /D "powershell_ise.exe" /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 3 /T REG_SZ /D "regedit.exe" /F

:: ---
:: Block Command Prompt
:: ---
REG ADD "HKCU\Software\Policies\Microsoft\Windows\System" /V DisableCMD /T REG_dWORD /D 1 /F

:: ---

@echo OFF
goto end

:: --------------

:option8.2Start
@echo ON

:: ---
:: Restrict Extension/Addon Install
:: ---

:: Chrome
REG ADD "HKCU\Software\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Chromium
REG ADD "HKCU\Software\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Firefox
REG DELETE "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /F
REG ADD "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_MULTI_SZ /D "{\"*\":{\"installation_mode\":\"blocked\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi\"},\"bypasspaywalls@bypasspaywalls\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"allowed\"},\"treestyletab@piro.sakura.ne.jp\":{\"installation_mode\":\"allowed\"},\"adblock-for-ff-lite@addons\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{c8476e35-1a52-831c-487c-86db836cf38c}\":{\"installation_mode\":\"blocked\"},\"jid1-q4sG8pYhq8KGHs@jetpack\":{\"installation_mode\":\"blocked\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"},\"adguardadblocker@adguard.com\":{\"installation_mode\":\"blocked\"},\"{da6554a8-470c-4d6a-a6ca-904740683552}\":{\"installation_mode\":\"blocked\"},\"jid1-93CWPmRbVPjRQA@jetpack\":{\"installation_mode\":\"blocked\"},\"87677a2c52b84ad3a151a4a72f5bd3c4@jetpack\":{\"installation_mode\":\"blocked\"},\"{6601dd36-5bb6-4755-8cd5-f36b59ff5307}\":{\"installation_mode\":\"blocked\"},\"{01e4670b-532b-42ed-88c2-c7b46d05133a}\":{\"installation_mode\":\"blocked\"},\"languagetool-webextension@languagetool.org\":{\"installation_mode\":\"blocked\"},\"abb@amazon.com\":{\"installation_mode\":\"blocked\"},\"{0f929014-5ed2-4527-8b8d-86a9c889b129}\":{\"installation_mode\":\"blocked\"},\"{f9cacf2e-cafc-4f0f-b6ad-8e1a01b4b4d0}\":{\"installation_mode\":\"blocked\"},\"{45c15c03-6d29-45d2-984c-9f1ad34f3f51}\":{\"installation_mode\":\"blocked\"},\"browser@tunnelbear.com\":{\"installation_mode\":\"blocked\"},\"rebingerext@gmail.com\":{\"installation_mode\":\"blocked\"},\"ApplicationGuardRel@microsoft.com\":{\"installation_mode\":\"blocked\"},\"{cfa868c0-6239-47df-bc81-54e13151ec2e}\":{\"installation_mode\":\"blocked\"},\"{a07b7886-3015-4959-9a88-4273860edd6d}\":{\"installation_mode\":\"blocked\"},\"{7e39f3c8-2ef5-46ea-80d0-f8b8f72541c5}\":{\"installation_mode\":\"blocked\"},\"{23bcb1d2-a715-42e2-87c5-43ba10d23ace}\":{\"installation_mode\":\"blocked\"},\"{9b43dad5-885b-4f0d-882f-e945b7e4b96f}\":{\"installation_mode\":\"blocked\"},\"{8d8ca802-6b23-43ed-9445-e05d48579542}\":{\"installation_mode\":\"blocked\"}}" /F

:: Brave
REG ADD "HKCU\Software\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Microsoft Edge Chromium
REG ADD "HKCU\Software\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Microsoft Edge Legacy
REG ADD "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /T REG_dWORD /D 0 /F

:: Internet Explorer
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /T REG_SZ /D no /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /T REG_dWORD /D 1 /F

:: ---
:: Restrict Settings and Control Panel
:: ---
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V SettingsPageVisibility /T REG_SZ /D "showonly:about;network;network-status;network-wifi;network-wifisettings;network-ethernet;network-airplanemode" /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V RestrictCpl /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictCpl" /V 1 /T REG_SZ /D "Troubleshooting" /F

:: ---
:: Block Run
:: ---
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRun /T REG_dWORD /D 1 /F

:: ---
:: Block Powershell and Registry
:: ---

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun /T REG_dWORD /D 1 /F

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 1 /T REG_SZ /D "powershell.exe" /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 2 /T REG_SZ /D "powershell_ise.exe" /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 3 /T REG_SZ /D "regedit.exe" /F

:: ---
:: Block Command Prompt
:: ---
REG ADD "HKCU\Software\Policies\Microsoft\Windows\System" /V DisableCMD /T REG_dWORD /D 1 /F

:: ---

@echo OFF
goto option8

:: --------------

:option8.3Start
@echo ON

:: ---
:: Undo Restrict Extension/Addon Install
:: ---

:: Chrome
REG DELETE "HKCU\Software\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /F

:: Chromium
REG DELETE "HKCU\Software\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /F

:: Firefox
REG DELETE "HKCU\Software\Policies\Mozilla\Firefox" /V ExtensionSettings /F

:: Brave
REG DELETE "HKCU\Software\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /F

:: Microsoft Edge Chromium
REG DELETE "HKCU\Software\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /F

:: Microsoft Edge Legacy
REG DELETE "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /F
REG DELETE "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /F

:: Internet Explorer
REG DELETE "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /F
REG DELETE "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /F

:: ---
:: Undo Block Settings and Control Panel
:: ---
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoControlPanel /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V SettingsPageVisibility /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V RestrictCpl /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictCpl" /F

:: ---
:: Undo Block Run
:: ---
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRun /F

:: ---
:: Undo Block Powershell and Registry
:: ---

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun /T REG_dWORD /D 0 /F

REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 1 /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 2 /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 3 /T /F

REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /F
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun /F

:: ---
:: Undo Block Command Prompt
:: ---
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\System" /V DisableCMD /F

:: ---

@echo OFF
goto option8
:: ------------------------------------------------------------------------------------


:: ------------------------------------------------------------------------------------------------------------------------------
:: Main File
:: ------------------------------------------------------------------------------------
:mainFile
echo -------
echo.
echo You have selected Option 1: MAIN FILE
echo.
echo Before running this File, Set these Registry Keys to Administrators Ownership and Full Control
echo.
echo HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder
echo.
echo HKCR\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder
echo.
echo HKCR\Wow6432Node\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder
echo.
echo HKCR\Wow6432Node\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder
echo.
echo HKLM\SYSTEM\CurrentControlSet\Services\wuauserv
echo.
echo HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
echo.
echo HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
echo.
echo HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update
echo.
echo -------------
echo In addition to taking over these registry keys below, deny access to these registry keys below AFTER running this batch script
echo.
echo HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc
echo.
echo HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack
echo.
echo -------------
echo.
PAUSE
echo.
echo -------
echo This batch file will:
echo    - Change almost all Windows 10 Settings
echo    - Sets Web Browser Policies in Chrome, Chromium, Firefox, Microsoft Edge, and Brave
echo    - Removes the pre-installed Microsoft Edge; uninstall all UWP Apps;
echo    - and will remove/disable various Windows 10 annoyance features.
echo    - To Fully disable Windows Update service (wuauserv), use the other options.
echo    - To Fully disable the Windows Update Medic Service (WaaSMedicSvc), 
echo      after running this batch file, you must take over its registry key and deny full access to everyone
echo.
echo  ############################
echo    WARNING: Make sure you look through this file and know what this will do BEFORE running this batch file
echo  ############################
echo.
echo -------
echo.
echo Windows 10 Target Release Version Policy is set to: 21H2
echo (Change Target Release Version if you are running an older Windows 10 version)
echo.
echo -------
PAUSE

:: ----------------------------------------------------------------------

:mainFileredo
echo.
echo ----------------------------
echo.
echo Option 1: Run main file AND Remove and Prevent Reinstall of Microsoft Edge Chromium
echo.
echo Option 2: Run main file WITHOUT Removing Microsoft Edge Chromium
echo.
echo ----------------------------
echo.
echo 1) Option 1
echo.
echo 2) Option 2
echo.
echo 3) Return
echo.
echo 4) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto mainFileConfirmStartOption1
if "%op%"=="2" goto mainFileConfirmStartOption2
if "%op%"=="3" goto firstMenu

if "%op%"=="4" goto end
if "%op%"=="exit" goto end
if "%op%"=="C" goto end
if "%op%"=="c" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto mainFileredo

:: --------------

:mainFileConfirmStartOption1
echo.
echo -------
:mainFileConfirmStartOption1redo
echo.
set /p op="RUN THIS BATCH FILE (Main File Option 1): (y/n) "
if "%op%"=="y" goto mainFileStart1
if "%op%"=="yes" goto mainFileStart1
if "%op%"=="Yes" goto mainFileStart1
if "%op%"=="Y" goto mainFileStart1
if "%op%"=="YES" goto mainFileStart1

if "%op%"=="n" goto mainFileredo
if "%op%"=="no" goto mainFileredo
if "%op%"=="No" goto mainFileredo
if "%op%"=="N" goto mainFileredo
if "%op%"=="NO" goto mainFileredo

if "%op%"=="cancel" goto mainFileredo
if "%op%"=="Cancel" goto mainFileredo
if "%op%"=="CANCEL" goto mainFileredo

if "%op%"=="stop" goto mainFileredo
if "%op%"=="Stop" goto mainFileredo
if "%op%"=="STOP" goto mainFileredo

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto mainFileConfirmStartOption1redo

:: --------------

:mainFileConfirmStartOption2
echo.
echo -------
:mainFileConfirmStartOption2redo
echo.
set /p op="RUN THIS BATCH FILE (Main File Option 2): (y/n) "
if "%op%"=="y" goto mainFileStart2
if "%op%"=="yes" goto mainFileStart2
if "%op%"=="Yes" goto mainFileStart2
if "%op%"=="Y" goto mainFileStart2
if "%op%"=="YES" goto mainFileStart2

if "%op%"=="n" goto mainFileredo
if "%op%"=="no" goto mainFileredo
if "%op%"=="No" goto mainFileredo
if "%op%"=="N" goto mainFileredo
if "%op%"=="NO" goto mainFileredo

if "%op%"=="cancel" goto mainFileredo
if "%op%"=="Cancel" goto mainFileredo
if "%op%"=="CANCEL" goto mainFileredo

if "%op%"=="stop" goto mainFileredo
if "%op%"=="Stop" goto mainFileredo
if "%op%"=="STOP" goto mainFileredo

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto mainFileConfirmStartOption2redo

:: ----------------------------------------------------------------------

:mainFileStart1

echo.
echo Please wait for this batch file to finish
echo.

@echo ON

:: Stop WaaSMedicSvc and DiagTrack
net stop WaaSMedicSvc
net stop DiagTrack

:: Stop Microsoft Edge Chromium and Microsoft Edge Legacy
TASKKILL /F /IM msedge.exe
TASKKILL /F /IM MicrosoftEdge.exe

:: Stop OneDrive
TASKKILL /F /IM OneDrive.exe

:: Stop Skype Background Host
TASKKILL /F /IM SkypeBackgroundHost.exe

:: -----------------
:: Remove Microsoft Edge Chromium and Prevent Reinstall
:: -----------------

takeown /f "%ProgramFiles(x86)%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /grant administrators:F /t /q

takeown /f "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /grant administrators:F /t /q

takeown /f "%ProgramFiles%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles%\Microsoft\Edge" /grant administrators:F /t /q

takeown /f "%ProgramFiles%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /grant administrators:F /t /q

takeown /f "%UserProfile%\AppData\Local\Microsoft\Edge" /a /r /d y
icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /grant administrators:F /t /q


REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /V NoRemove /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /V NoRemove /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /V NoRepair /T REG_dWORD /D 0 /F

%SystemDrive%\ProgramFiles (x86)\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%SystemDrive%\ProgramFiles\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

%SystemDrive%\ProgramFiles (x86)\Microsoft\Edge\Application\89.0.774.68\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%SystemDrive%\ProgramFiles\Microsoft\Edge\Application\89.0.774.68\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

%SystemDrive%\ProgramFiles (x86)\Microsoft\Edge\Application\90.0.818.62\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%SystemDrive%\ProgramFiles\Microsoft\Edge\Application\90.0.818.62\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

rd /s /q "%ProgramFiles(x86)%\Microsoft\Edge"
md "%ProgramFiles(x86)%\Microsoft\Edge"
takeown /f "%ProgramFiles(x86)%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /inheritance:r
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /grant administrators:F /t /q
icacls "%ProgramFiles(x86)%\Microsoft\Edge" /deny everyone:F /t /q

rd /s /q "%ProgramFiles(x86)%\Microsoft\EdgeUpdate"
md "%ProgramFiles(x86)%\Microsoft\EdgeUpdate"
takeown /f "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /inheritance:r
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /grant administrators:F /t /q
icacls "%ProgramFiles(x86)%\Microsoft\EdgeUpdate" /deny everyone:F /t /q

rd /s /q "%ProgramFiles%\Microsoft\Edge"
md "%ProgramFiles%\Microsoft\Edge"
takeown /f "%ProgramFiles%\Microsoft\Edge" /a /r /d y
icacls "%ProgramFiles%\Microsoft\Edge" /inheritance:r
icacls "%ProgramFiles%\Microsoft\Edge" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\Edge" /deny everyone:F /t /q

rd /s /q "%ProgramFiles%\Microsoft\EdgeUpdate"
md "%ProgramFiles%\Microsoft\EdgeUpdate"
takeown /f "%ProgramFiles%\Microsoft\EdgeUpdate" /a /r /d y
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /inheritance:r
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /grant administrators:F /t /q
icacls "%ProgramFiles%\Microsoft\EdgeUpdate" /deny everyone:F /t /q

:: rd /s /q "%UserProfile%\AppData\Local\Microsoft\Edge"
:: md "%UserProfile%\AppData\Local\Microsoft\Edge"
:: takeown /f "%UserProfile%\AppData\Local\Microsoft\Edge" /a /r /d y
:: icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /inheritance:r
:: icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /grant administrators:F /t /q
:: icacls "%UserProfile%\AppData\Local\Microsoft\Edge" /deny everyone:F /t /q

REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /V NoModify /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /V NoRepair /T REG_dWORD /D 0 /F

REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /F
REG DELETE "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /F
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /F
REG DELETE "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /F
REG DELETE "HKLM\SOFTWARE\Clients\StartMenuInternet\Microsoft Edge" /F
:: -----------------

goto mainFileStart
:: ----------------------------------------------------------------------

:mainFileStart2

echo.
echo Please wait for this batch file to finish
echo.

@echo ON

:: Stop WaaSMedicSvc and DiagTrack
net stop WaaSMedicSvc
net stop DiagTrack

:: Stop Microsoft Edge Chromium and Microsoft Edge Legacy
TASKKILL /F /IM msedge.exe
TASKKILL /F /IM MicrosoftEdge.exe

:: Stop OneDrive
TASKKILL /F /IM OneDrive.exe

:: Stop Skype Background Host
TASKKILL /F /IM SkypeBackgroundHost.exe

goto mainFileStart
:: ----------------------------------------------------------------------
:mainFileStart
:: -------
:: Remove 3D Objects Folder
:: -------
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /F
REG DELETE "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /F
REG DELETE "HKCR\SystemFileAssociations\.3mf\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.bmp\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.fbx\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.gif\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.jfif\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.jpe\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.jpeg\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.jpg\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.png\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.tif\Shell\3D Edit" /F
REG DELETE "HKCR\SystemFileAssociations\.tiff\Shell\3D Edit" /F
:: -------
:: Enable Windows Photo Viewer
:: -------
REG ADD "HKCU\Software\Classes\.jpg" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\Software\Classes\.jpeg" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\Software\Classes\.gif" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\Software\Classes\.png" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\Software\Classes\.bmp" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\Software\Classes\.tiff" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\Software\Classes\.ico" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
:: --
REG ADD "HKCR\Applications\photoviewer.dll\shell\open" /V "MuiVerb" /T REG_SZ /D "@photoviewer.dll,-3043" /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\open\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3056" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap\DefaultIcon" /T REG_SZ /D "%windir%\\System32\\imageres.dll,-70" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap\shell\open\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\print" /V "NeverDefault" /T REG_SZ /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\print\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\print\DropTarget" /V "Clsid" /T REG_SZ /D "{60fd46de-f830-4894-a628-6fa81bc0190d}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF" /V EditFlags /T REG_dWORD /D 10000 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3055" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF\DefaultIcon" /T REG_SZ /D "%windir%\\System32\\imageres.dll,-72" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open" /V "MuiVerb" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg" /V EditFlags /T REG_dWORD /D 10000 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3055" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg\DefaultIcon" /T REG_SZ /D "%windir%\\System32\\imageres.dll,-72" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open" /V "MuiVerb" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3057" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif\DefaultIcon" /T REG_SZ /D "%windir%\\System32\\imageres.dll,-83" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif\shell\open\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3057" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png\DefaultIcon" /T REG_SZ /D "%windir%\\System32\\imageres.dll,-71" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png\shell\open\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp" /V EditFlags /T REG_REG_dWORD /D 10000 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp" /V ImageOptionFlags /T REG_REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp\DefaultIcon" /T REG_SZ /D "%windir%\\System32\\wmphoto.dll,-400" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open" /V "MuiVerb" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
:: --
REG ADD "HKCR\SystemFileAssociations\image\shell\Image Preview\command" /T REG_SZ /D "%windir%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\SystemFileAssociations\image\shell\Image Preview\DropTarget" /V "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /T REG_SZ /F
:: --
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" /V "ApplicationDescription" /T REG_SZ /D "@%ProgramFiles%\\Windows Photo Viewer\\photoviewer.dll,-3069" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" /V "ApplicationName" /T REG_SZ /D "@%ProgramFiles%\\Windows Photo Viewer\\photoviewer.dll,-3009" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".cr2" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".jpg" /T REG_SZ /D "PhotoViewer.FileAssoc.Jpeg" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".wdp" /T REG_SZ /D "PhotoViewer.FileAssoc.Wdp" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".jfif" /T REG_SZ /D "PhotoViewer.FileAssoc.JFIF" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".dib" /T REG_SZ /D "PhotoViewer.FileAssoc.Bitmap" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".png" /T REG_SZ /D "PhotoViewer.FileAssoc.Png" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".jxr" /T REG_SZ /D "PhotoViewer.FileAssoc.Wdp" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".bmp" /T REG_SZ /D "PhotoViewer.FileAssoc.Bitmap" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".jpe" /T REG_SZ /D "PhotoViewer.FileAssoc.Jpeg" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".jpeg" /T REG_SZ /D "PhotoViewer.FileAssoc.Jpeg" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".gif" /T REG_SZ /D "PhotoViewer.FileAssoc.Gif" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".tif" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /V ".tiff" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
:: -------
:: Remove Quick Print on Context Menu
:: -------
REG DELETE "HKCR\SystemFileAssociations\image\shell\print" /F
REG DELETE "HKCR\SystemFileAssociations\text\shell\print" /F
REG DELETE "HKCR\batfile\shell\print" /F
REG DELETE "HKCR\cmdfile\shell\print" /F
REG DELETE "HKCR\docfile\shell\print" /F
REG DELETE "HKCR\fonfile\shell\print" /F
REG DELETE "HKCR\htmlfile\shell\print" /F
REG DELETE "HKCR\inffile\shell\print" /F
REG DELETE "HKCR\inifile\shell\print" /F
REG DELETE "HKCR\JSEFile\shell\print" /F
REG DELETE "HKCR\JSFile\shell\print" /F
REG DELETE "HKCR\MSInfo.Document\shell\print" /F
REG DELETE "HKCR\otffile\shell\print" /F
REG DELETE "HKCR\pfmfile\shell\print" /F
REG DELETE "HKCR\regfile\shell\print" /F
REG DELETE "HKCR\rtffile\shell\print" /F
REG DELETE "HKCR\ttcfile\shell\print" /F
REG DELETE "HKCR\ttffile\shell\print" /F
REG DELETE "HKCR\txtfile\shell\print" /F
REG DELETE "HKCR\VBEFile\shell\print" /F
REG DELETE "HKCR\VBSFile\shell\print" /F
REG DELETE "HKCR\Wordpad.Document.1\shell\print" /F
REG DELETE "HKCR\WPEDoc\shell\print" /F
REG DELETE "HKCR\WPSDoc\shell\print" /F
REG DELETE "HKCR\wrifile\shell\print" /F
REG DELETE "HKCR\WSFFile\shell\print" /F
REG DELETE "HKLM\SOFTWARE\Classes\InternetShortcut\shell\print" /F
:: -------
:: Remove Modern Share on Context Menu
:: -------
REG DELETE "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /F
:: -------
:: Windows 10 Updates Partial Control (Windows Update Not Disabled)
:: -------
:: Target Release Version (Version 21H2)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ProductVersion /T REG_SZ /D "Windows 10" /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D "21H2" /F
:: Defer Updates (Windows Update for Business)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdatesPeriodInDays /T REG_dWORD /D 365 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdatesPeriodInDays /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuilds /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuildsPolicyValue /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableWUfBSafeguards /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /V IsWUfBConfigured /T REG_dWORD /D 1 /F
:: Current Branch Readiness (Semi-Annual Channel for 1903 and above)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V BranchReadinessLevel /T REG_dWORD /D 1 /F
:: Disable Wake Timers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AUPowerManagement /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance" /V WakeUp /T REG_dWORD /D 0 /F
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg -attributes SUB_SLEEP BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D +ATTRIB_HIDE
:: No Windows Update Taskbar Notification
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V TrayIconVisibility /T REG_dWORD /D 0 /F
:: Disable Automatic Active Hours
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V SmartActiveHoursState /T REG_dWORD /D 2 /F
:: Maximum Active Hours
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetActiveHoursMaxRange /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursMaxRange /T REG_dWORD /D 18 /F
:: Set Active Hours
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetActiveHours /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursStart /T REG_dWORD /D 7 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ActiveHoursEnd /T REG_dWORD /D 1 /F
:: Disable Upgrade Message to Windows 10 on Windows 7, Windows 8, and Windows 8.1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableOSUpgrade /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /V DisableOSUpgrade /T REG_dWORD /D 1 /F
:: Disable Delivery Optimization
:: HEX: 64 DECIMAL: 100
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /V DODownloadMode /T REG_dWORD /D 100 /F
:: Pause Updates Indefinitely
:: HEX: 96520 DECIMAL: 615712
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V FlightSettingsMaxPauseDays /T REG_dWORD /D 615712 /F
:: Disable Microsoft Edge Chromium Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F
:: Disable Windows Update Medic Service
:: (Moved to Top of Main File) net stop WaaSMedicSvc
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /V ObjectName /T REG_SZ /D Administrators /F
:: No Auto Reboot
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAutoRebootWithLoggedOnUsers /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAUShutdownOption /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V NoAUAsDefaultShutdownOption /T REG_dWORD /D 1 /F
:: No Metered Connections
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AllowAutoWindowsUpdateDownloadOverMeteredNetwork /T REG_dWORD /D 0 /F
:: Windows 10 Manual Update
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V AUOptions /T REG_dWORD /D 2 /F
:: Windows 10 Update Service Manual Start (Use other option instead)
:: REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V Start /T REG_dWORD /D 3 /F
:: -------
:: Turn Off Fast Startup
:: -------
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /V HiberbootEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V HiberbootEnabled /T REG_dWORD /D 0 /F
:: -------
:: Disable Storage Sense
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /V AllowStorageSenseGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /V ConfigStorageSenseDownloadsCleanupThreshold /T REG_dWORD /D 0 /F
:: -------
:: Disable Wifi Sense and Mobile Hotspot
:: -------
:: Wifi Sense
REG ADD "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /V AutoConnectAllowedOEM /T REG_dWORD /D 0 /F
:: Mobile Hotspot
REG ADD "HKLM\SOFTWARE\Microsoft\WcmSvc\Tethering" /V RemoteStartupDisabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /V NC_ShowSharedAccessUI /T REG_dWORD /D 0 /F
:: -------
:: Hide Network Options and Homegroup on File Explorer
:: -------
:: HEX: b0940064 DECIMAL: 2962489444
REG ADD "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /V Attributes /T REG_dWORD /D 2962489444 /F
REG ADD "HKCR\Wow6432Node\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /V Attributes /T REG_dWORD /D 2962489444 /F
:: HEX: B094010C DECIMAL: 2962489612
REG ADD "HKCR\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /V Attributes /T REG_dWORD /D 2962489612 /F
REG ADD "HKCR\Wow6432Node\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /V Attributes /T REG_dWORD /D 2962489612 /F
:: -------
:: Disable Windows Telemetry and Telemetry Service
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableTailoredExperiencesWithDiagnosticData /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsConsumerFeatures /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V AllowTelemetry /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V AllowTelemetry /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /V TailoredExperiencesWithDiagnosticDataEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /V TailoredExperiencesWithDiagnosticDataEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableTailoredExperiencesWithDiagnosticData /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V DisableEnterpriseAuthproxy /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /V StudyId /T REG_dWORD /D 0 /F
:: Connected User Experiences and Telemetry Service (DiagTrack)
:: (Moved to Top of Main File) net stop DiagTrack
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /V ObjectName /T REG_SZ /D Administrators /F
:: Windows 10 Send Feedback
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V DoNotShowFeedbackNotifications /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V DisableDiagnosticDataViewer /T REG_dWORD /D 1 /F
:: Windows Defender
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /V SpynetReporting /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /V LocalSettingOverrideSpynetReporting /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /V SubmitSamplesConsent /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /V DontReportInfectionInformation /T REG_dWORD /D 1 /F	
:: Windows Error Reporting
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V Disabled /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /V Disabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /V DoReport /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent" /V DefaultConsent /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsMitigation" /V UserPreference /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V DontSendAdditionalData /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V BypassNetworkCostThrottling /T REG_dWORD /D 0 /F

:: -------
:: Disable Inking and Typing
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V DisablePersonalization /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /V AllowSuggestedAppsInWindowsInkWorkspace /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /V AllowWindowsInkWorkspace /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V AllowInputPersonalization /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /V AllowLinguisticDataCollection /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Input\TIPC" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /V PenWorkspaceButtonDesiredVisibility /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /V HarvestContacts /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Personalization\Settings" /V AcceptedPrivacyPolicy /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Input\Settings" /V InsightsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Input\TIPC" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /V PreventhandwritingDataSharing /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /V PreventHandwritingErrorReports /T REG_dWORD /D 1 /F
:: -------
:: Windows Privacy Settings
:: -------
:: Disable Advertising Id
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /V DisabledByGroupPolicy /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /V Enabled /T REG_dWORD /D 0 /F
:: Turn Off Language List website access
REG ADD "HKCU\Control Panel\International\User Profile" /V HttpAcceptLanguageOptOut /T REG_dWORD /D 1 /F
:: Turn off App Launch Tracking
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Start_TrackProgs /T REG_dWORD /D 0 /F
:: Disable Location Services
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /V DisableLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /V DisableLocationScripting /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /V DisableSensors /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /V DisableWindowsLocationProvider /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessLocation /T REG_dWORD /D 2 /F
:: Find My Device Location
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\FindMyDevice" /V AllowFindMyDevice /T REG_dWORD /D 0 /F
:: Restrict Camera
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessCamera /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessCamera_ForceDenyTheseApps /T REG_MULTI_SZ /D Microsoft.MicrosoftEdge_8wekyb3d8bbwe\0Microsoft.Win32WebViewHost_cw5n1h2txyewy\0Microsoft.Windows.Cortana_cw5n1h2txyewy\0Microsoft.WindowsStore_8wekyb3d8bbwe\0Microsoft.Microsoft3DViewer_8wekyb3d8bbwe\0Microsoft.Office.OneNote_8wekyb3d8bbwe\0Microsoft.SkypeApp_kzf8qxf38zg5c\0Microsoft.Win32WebViewHost_cw5n1h2txyewy\0Microsoft.Windows.Photos_8wekyb3d8bbwe\0Microsoft.WindowsCamera_8wekyb3d8bbwe\0Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe\0Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\0Microsoft.Windows.SecureAssessmentBrowser_cw5n1h2txyewy\0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessCamera_UserInControlOfTheseApps /T REG_MULTI_SZ /D NonPackaged\0 /F
:: Restrict Microphone
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessMicrophone /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsActivateWithVoice /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsActivateWithVoiceAboveLock /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessMicrophone_ForceDenyTheseApps /T REG_MULTI_SZ /D Microsoft.MicrosoftEdge_8wekyb3d8bbwe\0Microsoft.Win32WebViewHost_cw5n1h2txyewy\0Microsoft.Windows.Cortana_cw5n1h2txyewy\0Microsoft.WindowsStore_8wekyb3d8bbwe\0Microsoft.Microsoft3DViewer_8wekyb3d8bbwe\0Microsoft.Office.OneNote_8wekyb3d8bbwe\0Microsoft.SkypeApp_kzf8qxf38zg5c\0Microsoft.Win32WebViewHost_cw5n1h2txyewy\0Microsoft.Windows.Photos_8wekyb3d8bbwe\0Microsoft.WindowsCamera_8wekyb3d8bbwe\0Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe\0Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\0Microsoft.Windows.SecureAssessmentBrowser_cw5n1h2txyewy\0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessMicrophone_UserInControlOfTheseApps /T REG_MULTI_SZ /D NonPackaged\0Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\0 /F
:: Headset Button Press Default App
REG ADD "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /V AgentActivationLastUsed /T REG_dWORD /D 0 /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessNotifications /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessAccountInfo /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessContacts /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessCalendar /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessPhone /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessCallHistory /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessEmail /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessTasks /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessMessaging /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessRadios /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessTrustedDevices /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsRunInBackground /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsGetDiagnosticInfo /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsSyncWithDevices /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessMotion /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessGazeInput /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessBackgroundSpatialPerception /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessGraphicsCaptureProgrammatic /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /V Value /T REG_SZ /D Deny /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /V Value /T REG_SZ /D Deny /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /V Value /T REG_SZ /D Deny /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /V Value /T REG_SZ /D Deny /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /V AllowMessageSync /T REG_dWORD /D 0 /F

:: -------
:: Disable Microsoft Annoyances
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableSoftLanding /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsConsumerFeatures /T REG_dWORD /D 1 /F
:: Cloud Consumer Account State Content
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableConsumerAccountStateContent /T REG_dWORD /D 1 /F
:: Cloud Optimized Content
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableCloudOptimizedContent /T REG_dWORD /D 1 /F
:: Microsoft Store Disable Auto Update Apps
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /V AutoDownload /T REG_dWORD /D 2 /F
:: Microsoft Store Disable Push to Install
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\PushToInstall" /V DisablePushToInstall /T REG_dWORD /D 1 /F
:: Microsoft Store Apps
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V ContentDeliveryAllowed /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V OemPreInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V PreInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V PreInstalledAppsEverEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SilentInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SilentInstalledAppsEverEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SoftLandingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SystemPaneSuggestionsEnabled /T REG_dWORD /D 0 /F
:: SubscribedContent Suggestions
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338387Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338388Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338389Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338393Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353694Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353696Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353698Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-310093Enabled /T REG_dWORD /D 0 /F
:: Quick Access Recently Used Files
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V ShowRecent /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /V ShowRecent /T REG_dWORD /D 0 /F
:: Quick Access Frequently Used Folders
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V ShowFrequent /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /V ShowFrequent /T REG_dWORD /D 0 /F
:: File Explorer Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchhistory /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V DisableSearchhistory /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V "Append Completion" /T REG_SZ /D no /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V "Append Completion" /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V "AutoSuggest" /T REG_SZ /D no /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V "AutoSuggest" /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowInfoTip /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowInfoTip /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowSyncProviderNotifications /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowSyncProviderNotifications /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /V DisableMFUTracking /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" /V DisableMFUTracking /T REG_dWORD /D 1 /F
:: File Explorer Clear History
Del /F /Q %UserProfile%\AppData\Microsoft\Windows\Recent\*
Del /F /Q %UserProfile%\AppData\Microsoft\Windows\Recent\AutomaticDestinations\*
Del /F /Q %UserProfile%\AppData\Microsoft\Windows\Recent\CustomDestinations\*
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /VA /F
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery /VA /F
:: Settings Tips
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V AllowOnlineTips /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\EdgeUI " /V DisableHelpSticker /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /V NoActiveHelp /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /V NoUntrustedContent /T REG_dWORD /D 1 /F
:: Keyboard
REG ADD "HKCU\Software\Microsoft\Input\Settings" /V EnableHwkbTextPrediction /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Control Panel\International" /V TurnOffOfferTextPredictions /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Control Panel\International" /V TurnOffInsertSpace /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Control Panel\International" /V TurnOffAutocorrectMisspelledWords /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Control Panel\International" /V TurnOffHighlightMisspelledWords /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\microsoft\TabletTip\1.7" /V Disableprediction /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\microsoft\TabletTip\1.7" /V EnableTextPrediction /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Input\Settings" /V MultilingualEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\TabletTip\1.7" /V EnableDoubleTapSpace /T REG_dWORD /D 0 /F
:: Turn off auto switch to tablet mode
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /V TabletMode /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /V TabletMode /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /V SignInMode /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /V SignInMode /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /V ConvertibleSlateModePromptPreference /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /V ConvertibleSlateModePromptPreference /T REG_dWORD /D 0 /F
:: Windows Spotlight
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightFeatures /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightFeatures /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableThirdPartySuggestions /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableThirdPartySuggestions /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnActionCenter /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnActionCenter /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableSpotlightCollectionOnDesktop /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableSpotlightCollectionOnDesktop /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnSettings /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnSettings /T REG_dWORD /D 1 /F
:: Live Tiles
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /V NoTileApplicationNotification /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V ClearTilesOnExit /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V ClearTilesOnExit /T REG_dWORD /D 1 /F
:: Windows People Bar
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V HidePeopleBar /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /V PeopleBand /T REG_dWORD /D 0 /F
:: Storage Sense
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /V AllowStorageSenseGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /V ConfigStorageSenseDownloadsCleanupThreshold /T REG_dWORD /D 0 /F
:: Project to PC
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Connect" /V AllowProjectionToPC /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\MiracastReceiver" /V "Primary Authorization Method" /T REG_dWORD /D 3 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Connect" /V "Primary Authorization Method" /T REG_dWORD /D 3 /F
REG ADD "HKLM\SOFTWARE\Microsoft\MiracastReceiver" /V ConsentToast /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\NetworkProjector" /V DisableNetworkProjector /T REG_dWORD /D 1 /F
:: Shared Experiences
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V EnableCdp /T REG_dWORD /D 0 /F
:: Offline Maps App
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /V AllowUntriggeredNetworkTrafficOnSettingsPage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /V AutoDownloadAndUpdateMapData /T REG_dWORD /D 0 /F
:: Other
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /V ScoobeSystemSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /V ScoobeSystemSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V NoBalloonFeatureAdvertisements /T REG_dWORD /D 1 /F
:: Disable Java Sponsor offers
:: It is not recommeded to use Java
REG ADD "HKLM\SOFTWARE\JavaSoft" /V "SPONSORS" /T REG_SZ /D "DISABLE" /F
REG ADD "HKLM\SOFTWARE\Wow6432Node\JavaSoft" /V "SPONSORS" /T REG_SZ /D "DISABLE" /F
REG ADD "HKLM\SOFTWARE\JreMetrics" /V "DisableSponsors" /T REG_SZ /D "Y" /F
REG ADD "HKLM\SOFTWARE\Wow6432Node\JreMetrics" /V "DisableSponsors" /T REG_SZ /D "Y" /F
:: Settings Page Visibility
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V SettingsPageVisibility /T REG_SZ /D "hide:workplace;search-permissions;mobile-devices;emailandaccounts;sync;windowsinsider-optin;delivery-optimization;findmydevice;network-mobilehotspot;maps-downloadmaps;maps;mobile-devices-addphone;mobile-devices-addphone-direct;privacy-location;privacy-speechtyping;privacy-notifications;privacy-accountinfo;privacy-contacts;privacy-calendar;privacy-phonecalls;privacy-callhistory;privacy-email;privacy-tasks;privacy-messaging;privacy-radios;privacy-customdevices;privacy-backgroundapps;privacy-appdiagnostics;privacy-general;privacy-speech;privacy-activityhistory;clipboard;crossdevice;project;gaming-xboxnetworking;typing;privacy-documents;privacy-pictures;privacy-videos;privacy-broadfilesystemaccess" /F
:: Alt-Tab Multitasking
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V multitaskingAltTabFilter /T REG_dWORD /D 4 /F
:: Printing Manual Set Default Printer
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /V LegacyDefaultPrinterMode /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /V LegacyDefaultPrinterMode /T REG_dWORD /D 1 /F
:: Device Installation Metadata Retrieval Disabled
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /V PreventDeviceMetadataFromNetwork /T REG_dWORD /D 1 /F
:: Device Installation Metered Network Off
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceSetup" /V CostedNetworkPolicy /T REG_dWORD /D 0 /F
:: Skype Meet Now
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V HideSCAMeetNow /T REG_dWORD /D 1 /F
:: Microsoft Customer Experience Improvement Program
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /V CEIPEnable /T REG_dWORD /D 0 /F
:: Windows Media Player
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /V GroupPrivacyAcceptance /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /V PreventCDDVDMetadataRetrieval /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /V PreventMusicFileMetadataRetrieval /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WMDRM" /V DisableOnline /T REG_dWORD /D 1 /F
:: Taskbar News and Interests
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /V EnableFeeds /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /V ShellFeedsTaskbarViewMode /T REG_dWORD /D 2 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /V ShellFeedsTaskbarContentUpdateMode /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /V ShellFeedsTaskbarOpenOnHover /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.ProjectNewsbar_8wekyb3d8bbwe\msnews-newsbar" /V State /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /V AllowNewsAndInterests /T REG_dWORD /D 0 /F
:: Taskbar Chat Icon
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /V ChatIcon /T REG_dWORD /D 3 /F
:: Remote Assistance Turn Off
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /V fAllowToGetHelp /T REG_DWORD /D 0 /F
:: WPAD (Windows 10 Proxy) Turn Off and Disable (Requires Reboot to take effect)
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V Proxy /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V Autoconfig /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V "Connection Settings" /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V "Connwiz Admin Lock" /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V ConnectionsTab /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /V proxySettingsPerUser /T REG_dWORD /D 0 /F
:: Windows AutoPlay Turn Off
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /V DisableAutoplay /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /V DisableAutoplay /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DontSetAutoplayCheckbox /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DontSetAutoplayCheckbox /T REG_dWORD /D 1 /F
:: System Theme Set Dark
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V SystemUsesLightTheme /T REG_dWORD /D 0 /F
:: Transparency Turn Off
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V EnableTransparency /T REG_dWORD /D 0 /F
:: Disable Family / Parental Options
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\ParentalControls" /V WPCEnableOnDomain /T REG_dWORD /D 0 /F
:: Game Explorer
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameUX" /V DownloadGameInfo /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameUX" /V GameUpdateOptions /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameUX" /V ListRecentlyPlayed /T REG_dWORD /D 0 /F
:: Windows Windows Game Recording and Broadcasting Disable
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /V AllowGameDVR /T REG_dWORD /D 0 /F
:: Windows Calendar
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Windows" /V TurnOffWinCal /T REG_dWORD /D 1 /F
:: Windows Mail
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Mail" /V ManualLaunchAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Mail" /V DisableCommunities /T REG_dWORD /D 1 /F
:: Windows Messanger
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client" /V PreventAutoRun /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client" /V PreventRun /T REG_dWORD /D 1 /F

:: -------
:: Windows Ease of Access
:: -------
:: Sticky Keys
REG ADD "HKCU\Control Panel\Accessibility\StickyKeys" /V "Flags" /T REG_SZ /D "2" /F
:: Fitler Keys
REG ADD "HKCU\Control Panel\Accessibility\Keyboard Response" /V "Flags" /T REG_SZ /D "2" /F
:: Toggle Keys
REG ADD "HKCU\Control Panel\Accessibility\ToggleKeys" /V "Flags" /T REG_SZ /D "34" /F
:: Mouse Keys
REG ADD "HKCU\Control Panel\Accessibility\MouseKeys" /V "Flags" /T REG_SZ /D "2" /F
:: -------
:: Windows Login Experience
:: -------
:: Auto login after Updates
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\S-1-5-21-4053955510-1485632959-3974344530-1001" /V OptOut /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableAutomaticRestartSignOn /T REG_dWORD /D 1 /F
:: Auto Open Apps After Restart
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V RestartApps /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /V RestartApps /T REG_dWORD /D 0 /F

:: ----------------------------
:: Print Spooler Mitigation (July 2021)
:: ----------------------------

:: https://support.microsoft.com/en-us/topic/kb5005010-restricting-installation-of-new-printer-drivers-after-applying-the-july-6-2021-updates-31b91c02-05bc-4ada-a7ea-183b129578a7

::      Computer Configuration > Administrative Templates > Printers >> Allow Print Spooler to accept client connections: DISABLED
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers" /V RegisterSpoolerRemoteRpcEndPoint /T REG_dWORD /D 2 /F

::      Computer Configuration > Administrative Templates > System > Logon >> Point and Print Restrictions: ENABLED 
::                                                            "When installing drivers for a new connection": "Show warning and elevation prompt"
::                                                            "When updating drivers for an existing connection": "Show warning and elevation prompt"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /V NoWarningNoElevationOnInstall /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /V UpdatePromptSettings /T REG_dWORD /D 0 /F

:: Force Driver Installs to Administrators
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /V RestrictDriverInstallationToAdministrators /T REG_dWORD /D 1 /F

:: --------------
:: Windows 10 First Run Screen
:: -------

:: Group Policy: First Login:

::      Computer Configuration > Administrative Templates > System > Logon >> Show First Sign-In Animation: DISABLED
::      Computer Configuration > Administrative Templates > Windows Components > OOBE >> Don't launch privacy settings experience on user logon: ENABLED

:: Login Animation
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V EnableFirstLogonAnimation /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V EnableFirstLogonAnimation /T REG_dWORD /D 0 /F
:: Welcome Experience
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightWindowswelcomeExperience /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /V DisablePrivacyExperience /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\OOBE" /V DisablePrivacyExperience /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /V SkipMachineOOBE /T REG_dWORD /D 1 /F
:: --------------
:: Lock Screen Blur
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V DisableAcrylicBackgroundOnLogon /T REG_dWORD /D 1 /F
:: Block User from showing specific account details on signin
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V BlockUserFromShowingAccountDetailsOnSignin /T REG_dWORD /D 1 /F
:: -------
:: Windows Search
:: -------
:: Cortana
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V AllowCortana /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V AllowcortanaAboveLock /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V AllowCloudSearch /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V AllowSearchToUseLocation /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V DisableWebSearch /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V ConnectedSearchPrivacy /T REG_dWORD /D 3 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V ConnectedSearchUseWeb /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V ConnectedSearchUseWebOverMeteredConnections /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /V BingSearchEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowCortanaButton /T REG_dWORD /D 0 /F
:: Search History
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRecentDocsHistory /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRecentDocsHistory /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ClearRecentDocsOnExit /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ClearRecentDocsOnExit /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ClearRecentProgForNewUserInStartMenu /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /V IsAADCloudSearchEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /V IsDeviceSearchHistoryEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /V IsMSACloudSearchEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /V SafeSearchMode /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Comdlg32" /V NoFileMru /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Comdlg32" /V NoFileMru /T REG_dWORD /D 1 /F
:: Recently Added Apps
REG ADD " HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V HideRecentlyAddedApps /T REG_dWORD /D 1 /F
:: Activity History
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V UploadUserActivities /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V PublishUserActivities /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V EnableActivityFeed /T REG_dWORD /D 0 /F
:: Advanced Clipboard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V AllowClipboardHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V AllowCrossDeviceClipboard /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Start_TrackDocs /T REG_dWORD /D 0 /F
:: Search Highlights
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V EnableDynamicContentInWSB /T REG_dWORD /D 0 /F
:: -------
:: Windows Security and UAC Settings
:: -------
:: Microsoft account
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V NoConnectedUser /T REG_dWORD /D 3 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSync /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableWindowsSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableApplicationSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableAppSyncSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableWebBrowserSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableDesktopThemeSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableCredentialsSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisablePersonalizationSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableStartLayoutSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableSyncOnPaidNetwork /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Microsoftaccount" /V DisableUserAuth /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V MSAOptional /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" /V AllowSharedLocalAppData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Appx" /V BlockNonAdminUserInstall /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Appx" /V RestrictAppDataToSystemVolume /T REG_dWORD /D 1 /F
:: Disable Sign in to Workplace
REG ADD "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowWorkplace" /V value /T REG_dWORD /D 0 /F
:: Disable MDM Enrollment
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\MDM" /V DisableRegistration /T REG_dWORD /D 1 /F
:: Windows Defender
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection" /V UILockdown /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options" /V UILockdown /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /V DisableEnhancedNotifications /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /V HideSystray /T REG_dWORD /D 1 /F
:: Hide Password Reveal
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CredUI" /V DisablePasswordReveal /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CredUI" /V DisablePasswordReveal /T REG_dWORD /D 1 /F
:: Picture Password
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V BlockDomainPicturePassword /T REG_dWORD /D 1 /F
:: Security Questions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V NoLocalPasswordResetQuestions /T REG_dWORD /D 1 /F
:: Network Selection on Lock Screen
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V DontDisplayNetworkSelectionUI /T REG_dWORD /D 1 /F
:: UAC Hide User Accounts
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnumerateAdministrators /T REG_dWORD /D 0 /F
:: Restrict SAS to only manual
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V SoftwareSASGeneration /T REG_dWORD /D 0 /F

:: -------
:: Action Center
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableNotificationcenter /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V DisableNotificationcenter /T REG_dWORD /D 1 /F
:: -------
:: Windows 10 Notifications
:: -------
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /V ToastEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /V ToastEnabled /T REG_dWORD /D 0 /F
:: --
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_GLEAM_ENABLED /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_BADGE_ENABLED /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_TOASTS_ENABLED /T REG_dWORD /D 0 /F
:: --
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.Explorer.Notification.{B2E2D052-B051-D751-3E74-F8D4290BD1BC}" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.Windows.InputSwitchToastHandler" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.WindowsStore_8wekyb3d8bbwe!App" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AudioTroubleshooter" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Explorer" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.LowDisk" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.WindowsUpdate.Notification" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.CommsPhone_8wekyb3d8bbwe!App" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.Messaging_8wekyb3d8bbwe!App" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.Messaging_8wekyb3d8bbwe!SkypeVide" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.Messaging_8wekyb3d8bbwe!x27e26f40ye031y48a6yb130yd1f20388991ax" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.Windows.Cortana_cw5n1h2txyewy!App" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.Windows.Cortana_cw5n1h2txyewy!CortanaUI" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.MobilityExperience" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.LocationManager" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.BackupReminder" /V Enabled /T REG_dWORD /D 0 /F
:: -------
:: Desktop
:: -------
:: Disable Auto Preview Desktop
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DisablePreviewDesktop /T REG_dWORD /D 1 /F
:: Disable Aero Shake
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DisallowShaking /T REG_dWORD /D 1 /F
:: Command Prompt on Win X Shortcut
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DontUsePowerShellOnWinX /T REG_dWORD /D 1 /F
:: -------
:: Start Menu
:: -------
:: Quick Uninstall Apps
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V NoUninstallFromStart /T REG_dWORD /D 1 /F
:: Taskbar Badges
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarBadges /T REG_dWORD /D 0 /F
:: Taskbar searchbox
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /V SearchboxTaskbarMode /T REG_dWORD /D 0 /F
:: Task View Button
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowTaskViewButton /T REG_dWORD /D 0 /F
:: -------
:: File Explorer
:: -------
:: File Name Extensions
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V HideFileExt /T REG_dWORD /D 0 /F
:: Hidden Files
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Hidden /T REG_dWORD /D 1 /F
:: Recycle Bin
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ConfirmFileDelete /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ConfirmFileDelete /T REG_dWORD /D 1 /F

:: -------
:: Microsoft Office
:: -------

:: 2007 - 12.0
:: 2010 - 14.0
:: 2013 - 15.0
:: 2016/2019/365 - 16.0

:: First Run Page
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Common\General" /V ShownOptIn /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Common\General" /V shownfirstrunoptin /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Common\General" /V shownfirstrunoptin /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Common\General" /V shownfirstrunoptin /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\firstrun" /V disablemovie /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\firstrun" /V disablemovie /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\firstrun" /V bootedrtm /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\firstrun" /V bootedrtm /T REG_dWORD /D 1 /F

:: Customer Experience Improvement Program
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Common" /V QMEnable /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Common" /V QMEnable /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Common" /V QMEnable /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Common" /V QMEnable /T REG_dWORD /D 0 /F

:: Office 2007 Disable Application Add-ins
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Access\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Excel\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\InfoPath\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\PowerPoint\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Publisher\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Visio\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Word\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F

:: Office 2007 Disable Macros
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Office\12.0\Common" /V VbaOff /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Common" /V VbaOff /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Outlook\Security" /V Level /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Outlook\Security" /V DontTrustInstalledFiles /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Access\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Excel\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\PowerPoint\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Publisher\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Visio\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Word\Security" /V VBAWarnings /T REG_dWORD /D 4 /F

:: Office 2010 Disable Application Add-ins
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Access\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Excel\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\InfoPath\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\PowerPoint\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Publisher\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Visio\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Word\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F

:: Office 2010 Disable Macros
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Office\14.0\Common" /V VbaOff /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Common" /V VbaOff /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Outlook\Security" /V Level /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Outlook\Security" /V DontTrustInstalledFiles /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Access\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Excel\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\PowerPoint\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Publisher\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Visio\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Word\Security" /V VBAWarnings /T REG_dWORD /D 4 /F

:: Office 2013 Disable Application Add-ins
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Access\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Excel\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\InfoPath\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\PowerPoint\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Publisher\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Visio\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Word\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F

:: Office 2013 Disable Macros
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Office\15.0\Common" /V VbaOff /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Common" /V VbaOff /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Outlook\Security" /V Level /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Outlook\Security" /V DontTrustInstalledFiles /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Access\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Excel\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\PowerPoint\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Publisher\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Visio\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Word\Security" /V VBAWarnings /T REG_dWORD /D 4 /F

:: Office 2016/2019/365 Disable Application Add-ins
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Access\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Excel\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\InfoPath\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\PowerPoint\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Publisher\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Visio\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Word\Security" /V DisableAllAddins /T REG_dWORD /D 1 /F

:: Office 2016/2019/365 Disable Macros
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Office\16.0\Common" /V VbaOff /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Common" /V VbaOff /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Outlook\Security" /V Level /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Outlook\Security" /V DontTrustInstalledFiles /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Access\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Excel\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\PowerPoint\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Publisher\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Visio\Security" /V VBAWarnings /T REG_dWORD /D 4 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Word\Security" /V VBAWarnings /T REG_dWORD /D 4 /F

:: Office 2016 Telemetry
REG ADD "HKCU\Software\Policies\Microsoft\Office\Common\clienttelemetry" /V sendtelemetry /T REG_dWORD /D 3 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\osm" /V enablelogging /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\osm" /V enableupload /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\osm" /V disableonlinemodeauthdiagnostics /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\readinesstoolkit" /V enableusageagent /T REG_dWORD /D 0 /F

:: Office 2016 Feedback
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Common" /V sendcustomerdata /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /V enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /V includescreenshot /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /V msoridsurveyenabled /T REG_dWORD /D 0 /F

:: Office 2013 Telemetry
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\osm" /V enablelogging /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\osm" /V enableupload /T REG_dWORD /D 0 /F

:: Office 2013 Feedback
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Common\Feedback" /V enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Common\Feedback" /V includescreenshot /T REG_dWORD /D 0 /F

:: Office 2007 - Disable Microsoft Office Online featured links
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Common\Internet" /V ShowSpotlight /T REG_dWORD /D 2 /F

:: Office Disable Online Content
REG ADD "HKCU\Software\Policies\Microsoft\Office\12.0\Common\Internet" /V UseOnlineContent /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\14.0\Common\Internet" /V UseOnlineContent /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\15.0\Common\Internet" /V UseOnlineContent /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Internet" /V UseOnlineContent /T REG_dWORD /D 0 /F

:: Office Disable ActiveX
REG ADD "HKCU\Software\Policies\Microsoft\Office\Common\Security" /V DisableAllActiveX /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V groove.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V excel.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V mspub.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V powerpnt.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V pptview.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V visio.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V winproj.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V winword.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V outlook.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V spDesign.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V exprwd.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V msaccess.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V onenote.exe /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\feature_restrict_activexinstall" /V mse7.exe /T REG_dWORD /D 1 /F

:: -------
:: Battery Settings
:: ------- REG ADD "EXAMPLE" /V EXAMPLE /T REG_dWORD /D 999 /F

:: Require Password on Wake-Up
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /V DCSettingIndex /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /V ACSettingIndex /T REG_dWORD /D 1 /F

:: Windows Sideshow Auto Wake Disabled
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SideShow" /V AutoWakeDisabled /T REG_dWORD /D 1 /F

:: Require Password after Display turns off
REG ADD "HKLM\Control Panel\Desktop" /V DelayLockInterval /T REG_dWORD /D 0 /F
REG ADD "HKCU\Control Panel\Desktop" /V DelayLockInterval /T REG_dWORD /D 0 /F

:: Enable Hibernate Option
powercfg -hibernate on
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /V ShowHibernateOption /T REG_dWORD /D 1 /F

:: Automatic Turn Off Display (3 Minutes)
powercfg -change -monitor-timeout-dc 3
powercfg -change -monitor-timeout-ac 3

:: Automatic Sleep (5 Minutes)
powercfg -change -standby-timeout-dc 5
powercfg -change -standby-timeout-ac 5

:: Low Battery Notification
powercfg /SETDCVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 1
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 1

:: Low Battery Percent (10 Percent)
powercfg /SETDCVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 10
powercfg /SETDCVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 10

:: Low Battery Action
powercfg /SETDCVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0

:: Critical Battery Notification
powercfg /SETDCVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 1
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 1

:: Critical Battery Percent (2 Percent)
powercfg /SETDCVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 2
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 2

:: Critical Battery Action
powercfg /SETDCVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 2
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 2

:: ------------------------------------------------------------------------------------
:: Web Browser Policy Settings
:: ------------------------------------------

:: -----------------
:: Chrome
:: -----------------

:: -----
:: Extension Settings
:: 1) "Ublock Origin", 2) "SponsorBlock for YouTube - Skip Sponsorships", 3) "ClearURLs"
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
:: REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V HideWebStoreIcon /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
:: -----
:: CHROME: Auto Sign In
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BrowserSignin /T REG_dWORD /D 0 /F
:: -----
:: DNS Over HTTPS and Proxy
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DnsOverHttpsMode /T REG_SZ /D off /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V NetworkPredictionOptions /T REG_dWORD /D 2 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F
:: -----
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: -----
:: Settings Import
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultSensorsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PaymentMethodQueryEnabled /T REG_dWORD /D 0 /F
:: -----
:: URL Bar
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
:: Background Mode
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: PDF Files
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
:: Media
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AutoplayAllowed /T REG_dWORD /D 0 /F
:: -----
:: URL Blocklist
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\URLBlocklist" /V 1 /T REG_SZ /D "securly.com" /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\URLBlocklist" /V 2 /T REG_SZ /D "goguardian.com" /F
:: -----

:: -----------------
:: Chromium
:: -----------------

:: -----
:: Extension Settings
:: 1) "Ublock Origin", 2) "SponsorBlock for YouTube - Skip Sponsorships", 3) "ClearURLs"
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
:: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V HideWebStoreIcon /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
:: -----
:: CHROMIUM: Auto Sign In
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BrowserSignin /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SyncDisabled /T REG_dWORD /D 1 /F
:: -----
:: DNS Over HTTPS and Proxy
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DnsOverHttpsMode /T REG_SZ /D off /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V NetworkPredictionOptions /T REG_dWORD /D 2 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F
:: -----
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: -----
:: Settings Import
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ChromeCleanupEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultSensorsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PaymentMethodQueryEnabled /T REG_dWORD /D 0 /F
:: -----
:: URL Bar
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
:: Background Mode
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: PDF Files
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
:: Media
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AutoplayAllowed /T REG_dWORD /D 0 /F
:: -----
:: URL Blocklist
REG ADD "HKLM\SOFTWARE\Policies\Chromium\URLBlocklist" /V 1 /T REG_SZ /D "securly.com" /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\URLBlocklist" /V 2 /T REG_SZ /D "goguardian.com" /F
:: -----

:: -----------------
:: Firefox
:: -----------------

:: -----
:: Firefox Extension Settings and force-install
REG DELETE "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_MULTI_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi\"},\"bypasspaywalls@bypasspaywalls\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"allowed\"},\"treestyletab@piro.sakura.ne.jp\":{\"installation_mode\":\"allowed\"},\"adblock-for-ff-lite@addons\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{c8476e35-1a52-831c-487c-86db836cf38c}\":{\"installation_mode\":\"blocked\"},\"jid1-q4sG8pYhq8KGHs@jetpack\":{\"installation_mode\":\"blocked\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"},\"adguardadblocker@adguard.com\":{\"installation_mode\":\"blocked\"},\"{da6554a8-470c-4d6a-a6ca-904740683552}\":{\"installation_mode\":\"blocked\"},\"jid1-93CWPmRbVPjRQA@jetpack\":{\"installation_mode\":\"blocked\"},\"87677a2c52b84ad3a151a4a72f5bd3c4@jetpack\":{\"installation_mode\":\"blocked\"},\"{6601dd36-5bb6-4755-8cd5-f36b59ff5307}\":{\"installation_mode\":\"blocked\"},\"{01e4670b-532b-42ed-88c2-c7b46d05133a}\":{\"installation_mode\":\"blocked\"},\"languagetool-webextension@languagetool.org\":{\"installation_mode\":\"blocked\"},\"abb@amazon.com\":{\"installation_mode\":\"blocked\"},\"{0f929014-5ed2-4527-8b8d-86a9c889b129}\":{\"installation_mode\":\"blocked\"},\"{f9cacf2e-cafc-4f0f-b6ad-8e1a01b4b4d0}\":{\"installation_mode\":\"blocked\"},\"{45c15c03-6d29-45d2-984c-9f1ad34f3f51}\":{\"installation_mode\":\"blocked\"},\"browser@tunnelbear.com\":{\"installation_mode\":\"blocked\"},\"rebingerext@gmail.com\":{\"installation_mode\":\"blocked\"},\"ApplicationGuardRel@microsoft.com\":{\"installation_mode\":\"blocked\"},\"{cfa868c0-6239-47df-bc81-54e13151ec2e}\":{\"installation_mode\":\"blocked\"},\"{a07b7886-3015-4959-9a88-4273860edd6d}\":{\"installation_mode\":\"blocked\"},\"{7e39f3c8-2ef5-46ea-80d0-f8b8f72541c5}\":{\"installation_mode\":\"blocked\"},\"{23bcb1d2-a715-42e2-87c5-43ba10d23ace}\":{\"installation_mode\":\"blocked\"},\"{9b43dad5-885b-4f0d-882f-e945b7e4b96f}\":{\"installation_mode\":\"blocked\"},\"{8d8ca802-6b23-43ed-9445-e05d48579542}\":{\"installation_mode\":\"blocked\"}}" /F

:: Installed Extensions:
:: 1) uBlock Origin - uBlock0@raymondhill.net
::      https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi
:: 2) SponsorBlock for YouTube - sponsorBlocker@ajay.app
::      https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi
:: 3) Bypass Paywalls - bypasspaywalls@bypasspaywalls
::      https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi

:: Allowed Extensions:
:: 1) ClearURLs - {74145f27-f039-47ce-a470-a662b129930a}
::      https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi
:: 2) Tree Style Tabs - treestyletab@piro.sakura.ne.jp
::      https://addons.mozilla.org/firefox/downloads/latest/tree-style-tab/latest.xpi

:: (Other adblockers interfere with ublock origin)
:: Blocked Extension List
:: 1) Adblock: adblock-for-ff-lite@addons ; jid1-NIfFY2CA8fy1tg@jetpack ; {c8476e35-1a52-831c-487c-86db836cf38c} ; jid1-q4sG8pYhq8KGHs@jetpack
:: 2) Adblock Ultimate: adblockultimate@adblockultimate.net
:: 3) Adblock Plus: {d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}
:: 4) Adguard: adguardadblocker@adguard.com
:: 5) Proctor Test: {da6554a8-470c-4d6a-a6ca-904740683552}
:: 6) Honey: jid1-93CWPmRbVPjRQA@jetpack
:: 7) Grammarly: 87677a2c52b84ad3a151a4a72f5bd3c4@jetpack ; {6601dd36-5bb6-4755-8cd5-f36b59ff5307} ; {01e4670b-532b-42ed-88c2-c7b46d05133a} ; languagetool-webextension@languagetool.org
:: 8) Amazon Assistant: abb@amazon.com
:: 9) Nano Adblocker: {0f929014-5ed2-4527-8b8d-86a9c889b129}
:: 10) Nano Defender: {f9cacf2e-cafc-4f0f-b6ad-8e1a01b4b4d0}
:: 11) Hola: {45c15c03-6d29-45d2-984c-9f1ad34f3f51}
:: 12) TunnelBear: browser@tunnelbear.com
:: 13) ReBinger: rebingerext@gmail.com
:: 14) Microsoft Application Guard Extension: ApplicationGuardRel@microsoft.com
:: 15) Microsoft Bing Homepage: {cfa868c0-6239-47df-bc81-54e13151ec2e}
:: 16) Microsoft Bing Homepage and Search Engine: {a07b7886-3015-4959-9a88-4273860edd6d}
:: 17) MSN Homepage, New Tab and Bing Search Engine: {7e39f3c8-2ef5-46ea-80d0-f8b8f72541c5}
:: 18) MSN Homepage and New Tab: {23bcb1d2-a715-42e2-87c5-43ba10d23ace}
:: 19) MSN Homepage and Bing Search Engine: {9b43dad5-885b-4f0d-882f-e945b7e4b96f}
:: 20) Microsoft Bing Search Engine: {8d8ca802-6b23-43ed-9445-e05d48579542}
:: -----

:: About Config Preferences (about:config)
:: Uses setup.reg

REG DELETE "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V Preferences /F
regedit.exe /S %~dpn0.reg

:: -----

:: {"media.eme.enabled":{"Value":false,"Status":"locked"},"media.gmp-widevinecdm.enabled":{"Value":false,"Status":"locked"},"network.http.sendRefererHeader":{"Value":0,"Status":"locked"},"media.hardwaremediakeys.enabled":{"Value":false,"Status":"default"},"browser.search.suggest.enabled":{"Value":false,"Status":"locked"},"browser.search.suggest.enabled.private":{"Value":false,"Status":"locked"},"browser.search.log":{"Value":false,"Status":"locked"},"browser.search.hiddenOneOffs":{"Value":"Google,Amazon.com,Bing,DuckDuckGo,eBay,Wikipedia(en),Wikipedia,Wikipedia(en)","Status":"locked"},"browser.urlbar.groupLabels.enabled":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.bookmark":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.history":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.openpage":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.searches":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.topsites":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.engines":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.calculator":{"Value":false,"Status":"locked"},"browser.urlbar.update1.searchTips":{"Value":false,"Status":"locked"},"browser.urlbar.update1.interventions":{"Value":false,"Status":"locked"},"browser.urlbar.showSearchSuggestionsFirst":{"Value":false,"Status":"locked"},"browser.urlbar.sponsoredTopSites":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.quicksuggest":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.quicksuggest.sponsored":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.enabled":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.scenario":{"Value":"offline","Status":"locked"},"browser.urlbar.quicksuggest.remoteSettings.enabled":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.dataCollection.enabled":{"Value":false,"Status":"locked"},"datareporting.policy.dataSubmissionPolicyBypassNotification":{"Value":true,"Status":"locked"},"browser.urlbar.suggest.quicksuggest.nonsponsored":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.shouldShowOnboardingDialog":{"Value":false,"Status":"locked"},"browser.urlbar.quicksuggest.showOnboardingDialogAfterNRestarts":{"Value":0,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includeBookmarks":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includeDownloads":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includePocket":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includeVisited":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.default.sites":{"Value":"","Status":"locked"},"browser.newtabpage.activity-stream.showSponsored":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.showSponsoredTopSites":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned":{"Value":"","Status":"locked"},"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines":{"Value":"","Status":"locked"},"browser.contentblocking.report.vpn-promo.url":{"Value":"","Status":"locked"},"browser.privatebrowsing.infoEnabled":{"Value":false,"Status":"locked"},"browser.privatebrowsing.promoEnabled":{"Value":false,"Status":"locked"},"browser.privatebrowsing.vpnpromourl":{"Value":"","Status":"locked"},"browser.contentblocking.report.hide_vpn_banner":{"Value":true,"Status":"locked"},"browser.contentblocking.report.vpn.enabled":{"Value":false,"Status":"locked"},"browser.contentblocking.report.hide_lockwise_app":{"Value":true,"Status":"locked"},"browser.contentblocking.report.lockwise.enabled":{"Value":false,"Status":"locked"},"browser.contentblocking.report.monitor.enabled":{"Value":false,"Status":"locked"},"browser.contentblocking.report.show_mobile_app":{"Value":false,"Status":"locked"},"browser.aboutConfig.showWarning":{"Value":false,"Status":"default"},"browser.tabs.warnOnClose":{"Value":false,"Status":"default"},"browser.tabs.warnOnCloseOtherTabs":{"Value":false,"Status":"default"},"browser.urlbar.trimURLs":{"Value":false,"Status":"locked"},"extensions.htmlaboutaddons.recommendations.enabled":{"Value":false,"Status":"locked"},"extensions.htmlaboutaddons.discover.enabled":{"Value":false,"Status":"locked"},"extensions.getAddons.showPane":{"Value":false,"Status":"locked"},"extensions.pocket.onSaveRecs":{"Value":false,"Status":"locked"},"extensions.pocket.onSaveRecs.locales":{"Value":"","Status":"locked"},"extensions.pocket.showHome":{"Value":false,"Status":"locked"},"browser.tabs.crashReporting.sendReport":{"Value":false,"Status":"locked"},"geo.enabled":{"Value":false,"Status":"locked"},"geo.provider.ms-windows-location":{"Value":false,"Status":"locked"},"security.insecure_connection_text.enabled":{"Value":true,"Status":"locked"},"security.insecure_connection_text.pbmode.enabled":{"Value":true,"Status":"locked"},"security.warn_submit_secure_to_insecure":{"Value":true,"Status":"locked"},"security.mixed_content.block_active_content":{"Value":true,"Status":"locked"},"security.insecure_field_warning.contextual.enabled":{"Value":true,"Status":"locked"},"browser.safebrowsing.phishing.enabled":{"Value":true,"Status":"locked"},"browser.safebrowsing.malware.enabled":{"Value":true,"Status":"locked"},"extensions.blocklist.enabled":{"Value":true,"Status":"locked"},"accessibility.force_disabled":{"Value":1,"Status":"locked"},"dom.battery.enabled":{"Value":false,"Status":"locked"},"media.videocontrols.picture-in-picture.keyboard-controls.enabled":{"Value":true,"Status":"default"},"browser.formfill.enable":{"Value":false,"Status":"default"},"network.prefetch-next":{"Value":false,"Status":"locked"},"network.predictor.enabled":{"Value":false,"Status":"locked"},"network.predictor.enable-prefetch":{"Value":false,"Status":"locked"},"browser.urlbar.speculativeConnect.enabled":{"Value":false,"Status":"locked"},"browser.send_pings":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.telemetrybrowser.newtabpage.activity-stream.telemetry":{"Value":false,"Status":"locked"},"browser.pingcentre.telemetry":{"Value":false,"Status":"locked"},"media.wmf.deblacklisting-for-telemetry-in-gpu-process":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons":{"Value":false,"Status":"locked"},"browser.aboutwelcome.enabled":{"Value":false,"Status":"locked"},"browser.messaging-system.whatsNewPanel.enabled":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.section.topstories":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.snippets":{"Value":false,"Status":"locked"},"browser.ctrlTab.recentlyUsedOrder":{"Value":false,"Status":"default"},"browser.crashReports.unsubmittedCheck.enabled":{"Value":false,"Status":"locked"},"browser.crashReports.unsubmittedCheck.autoSubmit":{"Value":false,"Status":"locked"},"browser.crashReports.unsubmittedCheck.autoSubmit2":{"Value":false,"Status":"locked"},"browser.tabs.crashReporting.includeURL":{"Value":false,"Status":"locked"},"print.always_print_silent":{"Value":false,"Status":"locked"},"print.save_print_settings":{"Value":false,"Status":"locked"},"print.tab_modal.enabled":{"Value":true,"Status":"locked"},"accessibility.blockautorefresh":{"Value":false,"Status":"locked"},"extensions.formautofill.creditCards.enabled":{"Value":false,"Status":"default"},"extensions.formautofill.addresses.enabled":{"Value":false,"Status":"default"},"ui.key.menuAccessKeyFocuses":{"Value":false,"Status":"locked"},"browser.backspace_action":{"Value":2,"Status":"locked"},"extensions.allowPrivateBrowsingByDefault":{"Value":true,"Status":"locked"},"browser.urlbar.eventTelemetry.enabled":{"Value":false,"Status":"locked"},"browser.urlbar.richSuggestions.tail":{"Value":false,"Status":"locked"},"browser.urlbar.autoFill":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.telemetry":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.telemetry":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.discoverystream.spocs.personalized":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.aboutpreferences":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.discoverystreamfeed":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.favicon":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.newtabinit":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.places":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.recommendationproviderswitcher":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.sections":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts":{"Value":false,"Status":"locked"},"browser.urlbar.shortcuts.bookmarks":{"Value":false,"Status":"default"},"browser.urlbar.shortcuts.history":{"Value":false,"Status":"default"},"browser.urlbar.shortcuts.tabs":{"Value":false,"Status":"default"},"accessibility.typeaheadfind.manual":{"Value":false,"Status":"default"},"media.navigator.enabled":{"Value":false,"Status":"default"},"pdfjs.enableScripting":{"Value":false,"Status":"locked"},"dom.payments.defaults.saveAddress":{"Value":false,"Status":"default"},"dom.payments.defaults.saveCreditCard":{"Value":false,"Status":"default"},"browser.preferences.moreFromMozilla":{"Value":false,"Status":"locked"},"signon.autofillForms":{"Value":false,"Status":"default"},"browser.ctrlTab.sortByRecentlyUsed":{"Value":false,"Status":"locked"},"browser.sessionstore.resuming_after_os_restart":{"Value":false,"Status":"locked"},"browser.startup.page":{"Value":1,"Status":"locked"},"media.videocontrols.picture-in-picture.video-toggle.enabled":{"Value":false,"Status":"default"}}

:: -----
:: DNS Over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS" /V Locked /T REG_dWORD /D 1 /F
:: Proxy
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Proxy" /V Mode /T REG_SZ /D none /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Proxy" /V Locked /T REG_dWORD /D 1 /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V NetworkPrediction /T REG_dWORD /D 0 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverrideFirstRunPage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverridePostUpdatePage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V NoDefaultBookmarks /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DontCheckDefaultBrowser /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V Locked /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V Locked /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin" /V Default /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin" /V Locked /T REG_dWORD /D 1 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableTelemetry /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxStudies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFeedbackCommands /T REG_dWORD /D 1 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Cookies" /V AcceptThirdParty /T REG_SZ /D never /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Cookies" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /V "Default" /T REG_SZ /D "block-audio-video" /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /V Locked /T REG_dWORD /D 0 /F
:: -----
:: Tracking Protection
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\EnableTrackingProtection" /V Value /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\EnableTrackingProtection" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\EnableTrackingProtection" /V Cryptomining /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\EnableTrackingProtection" /V Fingerprinting /T REG_dWORD /D 1 /F
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Search /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V TopSites /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Highlights /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Pocket /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Snippets /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Locked /T REG_dWORD /D 1 /F
:: -----
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions" /V DisableDeveloperTools /T REG_dWORD /D 0 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisplayBookmarksToolbar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V "DisplayMenuBar" /T REG_SZ /D "default-off" /F
:: Pocket
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisablePocket /T REG_dWORD /D 1 /F
:: Refresh Profile Suggestion
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableProfileRefresh /T REG_dWORD /D 1 /F
:: Safe Mode Disabled
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSafeMode /T REG_dWORD /D 1 /F
:: Windows SSO
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V WindowsSSO /T REG_dWORD /D 0 /F
:: -----
:: Quick Set Desktop Background
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSetDesktopBackground /T REG_dWORD /D 1 /F
:: Import Bookmarks Icon on Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableProfileImport /T REG_dWORD /D 1 /F
:: Other
REG DELETE "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /F
:: -----

:: -----------------
:: Brave
:: -----------------

:: -----
:: Extension Settings
:: 1) "Ublock Origin", 2) "SponsorBlock for YouTube - Skip Sponsorships", 3) "ClearURLs"
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
:: REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V HideWebStoreIcon /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
:: -----
:: DNS Over HTTPS and Proxy
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DnsOverHttpsMode /T REG_SZ /D off /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V NetworkPredictionOptions /T REG_dWORD /D 2 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F
:: -----
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: -----
:: Settings Import
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultSensorsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PaymentMethodQueryEnabled /T REG_dWORD /D 0 /F
:: -----
:: URL Bar
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
:: Background Mode
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: PDF Files
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
:: Media
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AutoplayAllowed /T REG_dWORD /D 0 /F
:: -----
:: Brave: Tor
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V TorDisabled /T REG_dWORD /D 1 /F
:: -----
:: URL Blocklist
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\URLBlocklist" /V 1 /T REG_SZ /D "securly.com" /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\URLBlocklist" /V 2 /T REG_SZ /D "goguardian.com" /F
:: -----

:: -----------------
:: Microsoft Edge Chromium
:: -----------------

REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F

:: Extension Settings
:: 1) "Ublock Origin", 2) "SponsorBlock for YouTube - Skip Sponsorships", 3) "ClearURLs"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D odfafepnkmbhccpbejgmiehpchacaeak /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mbmgnelfcpoecdepckhlhegpcehmpmji /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D mdkdmaickkfdekbjdoojfalpbkgaddei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 1 /T REG_SZ /D odfafepnkmbhccpbejgmiehpchacaeak;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mbmgnelfcpoecdepckhlhegpcehmpmji;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 3 /T REG_SZ /D mdkdmaickkfdekbjdoojfalpbkgaddei;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"odfafepnkmbhccpbejgmiehpchacaeak\": {},\"mdkdmaickkfdekbjdoojfalpbkgaddei\": {}}" /F
:: -----
:: DNS Over HTTPS and Proxy
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DnsOverHttpsMode /T REG_SZ /D off /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BuiltInDnsClientEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Network Prefetch
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NetworkPredictionOptions /T REG_dWORD /D 2 /F
:: -----
:: First Run and Default Browser
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V HideFirstRunExperience /T REG_dWORD /D 1 /F
:: -----
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AllowSurfGame /T REG_dWORD /D 1 /F
:: -----
:: Notification / Location / Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: -----
:: Settings Import
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AutoImportAtFirstRun /T REG_dWORD /D 4 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportBrowserSettings /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportCookies /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportExtensions /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportFavorites /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportOpenTabs /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportPaymentInfo /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportShortcuts /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ShowRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PersonalizationReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V TrackingPrevention /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultSensorsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PaymentMethodQueryEnabled /T REG_dWORD /D 0 /F
:: -----
:: Background Mode
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
:: Inspect Element
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F
:: Download Prompt
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
:: PDF Files
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
:: Media
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AutoplayAllowed /T REG_dWORD /D 0 /F
:: -----
:: Collections and Shopping
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EdgeCollectionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\CollectionsServicesAndExportsBlockList" /V 1 /T REG_SZ /D pinterest_suggestions /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EdgeShoppingAssistantEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ShowMicrosoftRewards /T REG_dWORD /D 0 /F
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageHideDefaultTopSites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPagePrerenderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageAllowedBackgroundTypes /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageSearchBox /T REG_SZ /D redirect /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SpotlightExperiencesAndRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AddressBarMicrosoftSearchInBingProviderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageQuickLinksEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageContentEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageHideDefaultTopSites /T REG_dWORD /D 1 /F
:: Family Settings Disable
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V FamilySafetySettingsEnabled /T REG_dWORD /D 0 /F
:: Internet Explorer Mode
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V HideInternetExplorerRedirectUXForIncompatibleSitesEnabled /T REG_dWORD /D 1 /F
:: Edge Bar / Web Widget
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V WebWidgetIsEnabledOnStartup /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V WebWidgetAllowed /T REG_dWORD /D 0 /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ResolveNavigationErrorsUseWebService /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AlternateErrorPagesEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V LocalProvidersEnabled /T REG_dWORD /D 0 /F
:: -----
:: URL Blocklist
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\URLBlocklist" /V 1 /T REG_SZ /D "securly.com" /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\URLBlocklist" /V 2 /T REG_SZ /D "goguardian.com" /F
:: -----

:: -----------------
:: Microsoft Edge Legacy
:: -----------------

:: -----
:: First Run
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AllowPrelaunch /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventFirstRunPage /T REG_dWORD /D 1 /F
:: Default Browser
REG ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
:: -----
:: Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" /V FlashPlayerEnabled /T REG_dWORD /D 0 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V EnableExtendedBooksTelemetry /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventLiveTileDataCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V MicrosoftEdgeDataOptIn /T REG_dWORD /D 0 /F
:: -----
:: Other Content Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V Cookies /T REG_dWORD /D 1 /F
:: -----
:: Bookmark Bar
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Internet Settings" /V ConfigureHomeButton /T REG_dWORD /D 1 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V "Use FormSuggest" /T REG_SZ /D no /F
:: -----
:: Books Library
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AlwaysEnableBooksLibrary /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V UseSharedFolderForBooks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V AllowConfigurationUpdateForBooksLibrary /T REG_dWORD /D 0 /F
:: -----
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI" /V ShowOneBox /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI" /V AllowWebContentOnNewTabPage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V AllowTabPreloading /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V PreventTabPreloading /T REG_dWORD /D 1 /F
:: -----
:: Internet Explorer Switch
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V SyncFavoritesBetweenIEAndMicrosoftEdge /T REG_dWORD /D 0 /F
:: -----
:: Sync
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSyn /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableWebBrowserSettingSyncUserOverride /T REG_dWORD /D 2 /F
:: -----
:: Browsing History
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\KioskMode" /V ConfigureKioskMode /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AllowSavingHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Privacy" /V ClearBrowsingHistoryOnExit /T REG_dWORD /D 1 /F
:: -----
:: Phishing Filter
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /V PreventOverride /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /V PreventOverrideAppRepUnknown /T REG_dWORD /D 1 /F
:: -----

:: -----------------
:: Internet Explorer
:: -----------------

:: -----
:: First Run
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V DisableImportExportFavorites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V DisableFirstRunCustomize /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V DisableFirstRunCustomize /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /V ShowMessageWhenOpeningSitesInMicrosoftEdge /T REG_dWORD /D 0 /F
:: Default Browser
REG ADD "HKLM\Default\Software\Microsoft\Internet Explorer\Main" /V "Check_Associations" /T REG_SZ /D "no" /F
REG ADD "HKCU\Default\Software\Microsoft\Internet Explorer\Main" /V "Check_Associations" /T REG_SZ /D "no" /F
:: -----
:: Location
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Geolocation" /V PolicyDisableGeolocation /T REG_dWORD /D 1 /F
:: Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V DisableFlashInIE /T REG_dWORD /D 1 /F
:: -----
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" /V DisableLogging /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpItemSendFeedback /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpItemSendFeedback /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /V DisableCustomerImprovementProgram /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V NoReportSiteProblems /T REG_SZ /D yes /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\WindowsSearch" /V EnabledScopes /T REG_dWORD /D 0 /F
:: -----
:: Search Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V ShowContentAdvisor /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\DomainSuggestion" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpMenu /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V DisplayQuickPick /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V TopResult /T REG_dWORD /D 0 /F
:: -----
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\ContinuousBrowsing" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Recovery" /V NoReopenLastSession /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing" /V NewTabPageShow /T REG_dWORD /D 0 /F
:: -----
:: Browsing History
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V DisableDeleteBrowsingHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V DisableDeleteForms /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /V History /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V ClearBrowsingHistoryOnExit /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanDownloadHistory /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanHistory /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanInPrivateBlocking /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanTrackingProtection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V CleanTIF /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy" /V UseAllowList /T REG_dWORD /D 0 /F
:: -----
:: Phishing Filter
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V Enabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V PreventOverride /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V PreventOverrideAppRepUnknown /T REG_dWORD /D 1 /F
:: -----
:: Send All Sites to Microsoft Edge
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /V RestrictIE /T REG_dWORD /D 1 /F
:: -----
:: Popups
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V RestrictPopupExceptionList /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing" /V PopupsUseNewWindow /T REG_dWORD /D 2 /F
:: -----
:: Hide New Edge Button
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V HideNewEdgeButton /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /V HideNewEdgeButton /T REG_dWORD /D 1 /F
:: -----
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /V NoSearchBox /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /V NoSplash /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V EnableAutoUpgrade /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V AllowWindowReuse /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\FormatDetection" /V PhoneNumberEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V DisableFixSecuritySettings /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V DisableSecuritySettingsCheck /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V AllowServicePoweredQSA /T REG_dWORD /D 0 /F
:: -----

:: --------------------------------------------------------------------
:: Block Bad Extensions/Addons (Chrome, Chromium, Firefox, Brave, and Edge Chromium)
:: ----------------------------------

:: -----------------
:: Chrome
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 2 /T REG_SZ /D cfhdojbkjhnklbpkdaibdccddilifddb /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 3 /T REG_SZ /D gighmmpiobklfepjocnamgkkbiglidom /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 4 /T REG_SZ /D lgblnfidahcdcjddiepkckcfdhpknnjh /F
:: uBlock (non-origin)
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 5 /T REG_SZ /D epcnnfbjfcgphgdmggkamkmgojdagdnn /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 6 /T REG_SZ /D ohahllgiabjaoigichmmfljhkcfikeof /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 7 /T REG_SZ /D bgnkhhnnamicmpeenaelnjfhikgbkllg /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 8 /T REG_SZ /D kbfnbcaeplbcioakkpcpgfkobkghlhen /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 9 /T REG_SZ /D noojmhngiheennhgaffkfboanjpbkpep /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 10 /T REG_SZ /D bjodbpcjeogaihbekannledankhcjbgo /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 11 /T REG_SZ /D bmnlcjabgnpnenekpadlanbbkooimhnj /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 12 /T REG_SZ /D gomekmidlodglbbmalcneegieacbdmki /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 13 /T REG_SZ /D eofcbnmajmjmplflapaojjnihcjkigck /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 14 /T REG_SZ /D nbmoafcmbajniiapeidgficgifbfmjfo /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 15 /T REG_SZ /D mbckjcfnjmoiinpgddefodcighgikkgn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 16 /T REG_SZ /D ggimcfhnklgjpgehibgfmoidcgmbhppm /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 17 /T REG_SZ /D kcdahmgmaagjhocpipbodaokikjkampi /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 18 /T REG_SZ /D gkojfkhlekighikafcpjkiklfbnlmeio /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 19 /T REG_SZ /D lpognpnpncelknkahlngpojfjgdmkodn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 20 /T REG_SZ /D eoigllimhcllmhedfbmahegmoakcdakd /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 21 /T REG_SZ /D napjheenlliimoedooldaalpjfidlidp /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 22 /T REG_SZ /D klekeajafkkpokaofllcadenjdckhinm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 23 /T REG_SZ /D cmendinpapjjojakimjlmkkkcmnojefg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 24 /T REG_SZ /D jjkchpdmjjdmalgembblgafllbpcjlei /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 25 /T REG_SZ /D lkdiimaiohgpacfbgedcipmgigppaofn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 26 /T REG_SZ /D kaedchgajfpgipflgbgeeiiajekblklm /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 27 /T REG_SZ /D bhmmomiinigofkjcapegjjndpbikblnp /F
:: Adobe
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 28 /T REG_SZ /D efaidnbmnnnibpcajpcglclefindmkaj /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 29 /T REG_SZ /D pedmlpceiodameienmmkpkkpilgklmfh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 30 /T REG_SZ /D fbgcedjacmlbgleddnoacbnijgmiolem /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 31 /T REG_SZ /D dhelmjcpoddajfaldodimlaehbalhgag /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 32 /T REG_SZ /D obdappnhkfoejojnmcohppfnoeagadna /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 33 /T REG_SZ /D bkbeeeffjjeopflfhgeknacdieedcoml /F
:: -----
:: Fake TikTok
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 34 /T REG_SZ /D bjflcommipadapdldncoacffcccldlkm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 35 /T REG_SZ /D niljfkkadomdhekbkamcdlmokhnklign /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 36 /T REG_SZ /D agnbmfinlfpgonkehceknkpapgoibdno /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 37 /T REG_SZ /D dedphjedjalglppdfpmmibdbbkmifnbb /F
:: Fake Flash 
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 38 /T REG_SZ /D mcakfkioeanhfiojkchcndahgagcidbd /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 39 /T REG_SZ /D nddmmcpmdbkooddfjcohmlcfclhllgeh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 40 /T REG_SZ /D fnipglnbhfacfmefbgiiodalehbcgcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 41 /T REG_SZ /D fldkdmkgnlbehfgeifjpjabmandnchpe /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 42 /T REG_SZ /D aiccdefnpjkolgnpdamdimejlfmopcca /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 43 /T REG_SZ /D mdjjpkalmajfkhnamkekeljbfenponih /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 44 /T REG_SZ /D kppfgjkgimgbanjbbgpmccbkagcebnid /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 45 /T REG_SZ /D omimccinlhlkpjaeaocglgmkbelejlhj /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 46 /T REG_SZ /D cngjoacjdpnadhhjpdppcdjboiclnclc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 47 /T REG_SZ /D hloblpeplfiajnfdengendhdnpmdgagn /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 48 /T REG_SZ /D gmdffbblaahnjmpcjaenakkdplibibge /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 49 /T REG_SZ /D maekfnoeejhpjfkfmdlckioggdcdofpg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 50 /T REG_SZ /D cmedhionkhpnakcndndgjdbohmhepckk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 51 /T REG_SZ /D gpbfjnhlnemfnhajnmkjicfmbagfbejm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 52 /T REG_SZ /D gkhnanmhgeggclieoggjehkloolfkbdo /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 53 /T REG_SZ /D oldifepkckfmnlokobgdbjjfjjmhfgag /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 54 /T REG_SZ /D megdnjjcjgoiacejpegmfoeooleddmeb /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 55 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 56 /T REG_SZ /D khnleagcghdbpphacgjjkcoceilngecl /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 57 /T REG_SZ /D cegbjdefhfnbphoghdgcapnliodjbncp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 58 /T REG_SZ /D emngkmlligggbbiioginlkphcmffbncb /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 59 /T REG_SZ /D jompdinfdpijbcngkadcdaladbochoae /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 60 /T REG_SZ /D pkocadmokmpjeeaimigjpmfpdaighkga /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 61 /T REG_SZ /D jaeigffnocnbblojlfmiimdocmfcjkii /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 62 /T REG_SZ /D ppdonaappkjkbgbncmmjencphdclioab /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 63 /T REG_SZ /D lalfpjdbhpmnhfofkckdpkljeilmogfl /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D alcmakjhknigccfidaelkafjmfifkhkc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D fmaicbnbcbjgbpecclcnaehmbpjpdane /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D icegedoajhdclokfmeobnnbalabmpehm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D jhpheijfhpbkaejncokigfaihgdndjhg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D jbbmlecgjpijkeelnebilpekpnkaoool /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D gokhabgljglbmjilkmelajgkkhofeeij /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D klapabjimnakejfmpdolgamfplaondck /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D pclbpfjdhojdfcojcmmgggaanfnmhifk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D dhdpjhfemdchgdfngofnkgmabdmchoii /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D ckjbcmkjhocgdhmkkkieknbmhdnjanoh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D fkjdaikpmbninlknfjgehkoggdgmknel /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D eilkefcdofnagepelocjipipghaalkam /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D ocbcobiceiagblnejkcekbpgpakolhff /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D lkcohpjckebdgmdofkdfppgeejccjmnl /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D fhjieeiddoiibfbdknfligkjlpihnmjc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D bkalmigiilcgdihccnaonhnkdhpfbaam /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D gkkehpomgpdgkdmbdfkangmbafecdhhd /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D inejjjikomlbaahobecdaoaillmfejil /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D kllohiclobgoaffphlofnjdlabflpgha /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D ececmkgelhdncajgmofiffjmhojnimmb /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D fjadbbodmeifhkgepjjkeneeojammfag /F
:: VPN
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D kalfeohpimfncbfhjhanngehpbfilokk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D nlbejmccbhkncgokjcmghpfloaajcffj /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D ejkaocphofnobjdedneohbbiilggdlbi /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D bihmplhobchoageeokmgbdihknkjbknd /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D aleggpabliehgbeagmfhnodcijcmbonb /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D fpmapakogndmenjcfoajifaaonnkpkei /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D llkbempahblbohpipifajipejjackemi /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D nplnfhpilojbbcnjpiaoecppkkicfgfp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D jeajkcogjepdpppofeocjpejdckbgdco /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D eekepadogplleogcggcjkfebfjhihlnm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D mmknfaojcgjcelkoabokhaljjapiogbg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D jalmmnpclgbgcphkbnglcnlobgcbhkki /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D hkegehhbmbongohpgmdadkbkmnfokicn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D odfnofpjippoimohokldpheacfenmfch /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D oobhlpildfogoccaffnfckililknpcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D jmgacjgobknfojonlckhndlamkfcjofm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D gfceeghcoekcmlpgonlplkpmakdmpgmg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kfgffakpbnpfonmljmpfamjpnjbhfiij /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D bbebbhmelpcfmijoanocdliephmoahln /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
:: Amazon Assistant
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D pbjikboenpfhbbejgkoklgkhjpfogcam /F
:: College Board Secure Test
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D lhfmngifffjhdjdgkfdhbifhndddmjko /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D hblfbmjdaalalhifaajnnodlkiloengc /F
:: ProctorU
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D kbmmbecgmmkedcifdommembgkeomigjf /F
:: Nano Adblocker / Nano Defender
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D gabbbocakeomblphkmmnoamkioajlkfo /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 121 /T REG_SZ /D ggolfgbegefeeoocgjbmkembbncoadlb /F
:: Grammer Check Software Block
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 122 /T REG_SZ /D kdfieneakcjfaiglcfcgkidlkmlijjnh /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 123 /T REG_SZ /D oldceeleldhonbafppcapldpdifcinji /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 124 /T REG_SZ /D pjpgohokimaldkikgejifibjdpbopfdc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 125 /T REG_SZ /D gpaiobkfhnonedkhhfjpmhdalgeoebfa /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 126 /T REG_SZ /D npnbdojkgkbcdfdjlfdmplppdphlhhcf /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 127 /T REG_SZ /D hamhaljjdpcgkelbadepgmnocknejief /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 128 /T REG_SZ /D ifajfiofeifbbhbionejdliodenmecna /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 129 /T REG_SZ /D dmngfggkdcjejjgbfemebfomkphgcena /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 130 /T REG_SZ /D mpeepmfabickbdbckcejbflkpfamgcon /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 131 /T REG_SZ /D dmgkiikdlhmpikkhpiplldicbnicmboc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 132 /T REG_SZ /D ndgklmlnheedegipcohgcbjhhgddendc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 134 /T REG_SZ /D ecpbljknammclncihheaiehdahccgmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 135 /T REG_SZ /D nohphjepbjannpjpmodlcgdlialokkpd /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 136 /T REG_SZ /D oidhbpddkfhmipanjccneeifmmiabjng /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 137 /T REG_SZ /D nngceafehcgnogadphbkblijebijibkj /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 138 /T REG_SZ /D fkjahhehbehlijcehipnhpjhldcajban /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 139 /T REG_SZ /D ljgdcokhgjdpghmhdkbolccfcfdbklpo /F
:: Tunnelbear
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 140 /T REG_SZ /D omdakjcmkglenbhjadbccaookpfjihpa /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 141 /T REG_SZ /D njglkaigokomacaljolalkopeonkpbik /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 142 /T REG_SZ /D obhacaboehinamiaoafpljgofoapchgf /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 143 /T REG_SZ /D cccmaneagdjeppggplfjbemndmknmdib /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 144 /T REG_SZ /D kgddnoifhgfdhcpbkkjdgokfnkkmdcen /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 145 /T REG_SZ /D jaohnaoeopobbpjdeglffjnaclhifabp /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 146 /T REG_SZ /D fnkihbploojbmldhgdfpalkoifmegfpn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 147 /T REG_SZ /D kdmoafnhillldhoddnccefecelkofphm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 148 /T REG_SZ /D keghjkfdmmdkneijbbbnopeglnakbphn /F
:: Securly Classroom
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 149 /T REG_SZ /D jfbecfmiegcjddenjhlbhlikcbfmnafd /F
:: Securly for Chromebooks (This extension force reloads tabs when extension restarts)
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 150 /T REG_SZ /D iheobagjkfklnlikgihanlhcddjoihkg /F
:: Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites
:: lanschool student
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 151 /T REG_SZ /D ifeifkfohlobcbhmlfkenopaimbmnahb /F
:: lanschool web helper
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 152 /T REG_SZ /D honjcnefekfnompampcpmcdadibmjhlk /F
:: Read and Write
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 153 /T REG_SZ /D inoeonmfapjbbkmdafoankkfajkcphgd /F
:: Other 2
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 154 /T REG_SZ /D kgeglempfkhalebjlogemlmeakondflc /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 155 /T REG_SZ /D hmkphiklpggiafkgpmdekkofbadkffnn /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 156 /T REG_SZ /D jdfhadodhoabdfkgkclcdpocjffadkne /F

:: -----------------
:: Chromium
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 2 /T REG_SZ /D cfhdojbkjhnklbpkdaibdccddilifddb /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 3 /T REG_SZ /D gighmmpiobklfepjocnamgkkbiglidom /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 4 /T REG_SZ /D lgblnfidahcdcjddiepkckcfdhpknnjh /F
:: uBlock (non-origin)
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 5 /T REG_SZ /D epcnnfbjfcgphgdmggkamkmgojdagdnn /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 6 /T REG_SZ /D ohahllgiabjaoigichmmfljhkcfikeof /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 7 /T REG_SZ /D bgnkhhnnamicmpeenaelnjfhikgbkllg /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 8 /T REG_SZ /D kbfnbcaeplbcioakkpcpgfkobkghlhen /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 9 /T REG_SZ /D noojmhngiheennhgaffkfboanjpbkpep /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 10 /T REG_SZ /D bjodbpcjeogaihbekannledankhcjbgo /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 11 /T REG_SZ /D bmnlcjabgnpnenekpadlanbbkooimhnj /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 12 /T REG_SZ /D gomekmidlodglbbmalcneegieacbdmki /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 13 /T REG_SZ /D eofcbnmajmjmplflapaojjnihcjkigck /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 14 /T REG_SZ /D nbmoafcmbajniiapeidgficgifbfmjfo /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 15 /T REG_SZ /D mbckjcfnjmoiinpgddefodcighgikkgn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 16 /T REG_SZ /D ggimcfhnklgjpgehibgfmoidcgmbhppm /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 17 /T REG_SZ /D kcdahmgmaagjhocpipbodaokikjkampi /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 18 /T REG_SZ /D gkojfkhlekighikafcpjkiklfbnlmeio /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 19 /T REG_SZ /D lpognpnpncelknkahlngpojfjgdmkodn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 20 /T REG_SZ /D eoigllimhcllmhedfbmahegmoakcdakd /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 21 /T REG_SZ /D napjheenlliimoedooldaalpjfidlidp /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 22 /T REG_SZ /D klekeajafkkpokaofllcadenjdckhinm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 23 /T REG_SZ /D cmendinpapjjojakimjlmkkkcmnojefg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 24 /T REG_SZ /D jjkchpdmjjdmalgembblgafllbpcjlei /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 25 /T REG_SZ /D lkdiimaiohgpacfbgedcipmgigppaofn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 26 /T REG_SZ /D kaedchgajfpgipflgbgeeiiajekblklm /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 27 /T REG_SZ /D bhmmomiinigofkjcapegjjndpbikblnp /F
:: Adobe
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 28 /T REG_SZ /D efaidnbmnnnibpcajpcglclefindmkaj /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 29 /T REG_SZ /D pedmlpceiodameienmmkpkkpilgklmfh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 30 /T REG_SZ /D fbgcedjacmlbgleddnoacbnijgmiolem /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 31 /T REG_SZ /D dhelmjcpoddajfaldodimlaehbalhgag /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 32 /T REG_SZ /D obdappnhkfoejojnmcohppfnoeagadna /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 33 /T REG_SZ /D bkbeeeffjjeopflfhgeknacdieedcoml /F
:: -----
:: Fake TikTok
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 34 /T REG_SZ /D bjflcommipadapdldncoacffcccldlkm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 35 /T REG_SZ /D niljfkkadomdhekbkamcdlmokhnklign /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 36 /T REG_SZ /D agnbmfinlfpgonkehceknkpapgoibdno /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 37 /T REG_SZ /D dedphjedjalglppdfpmmibdbbkmifnbb /F
:: Fake Flash 
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 38 /T REG_SZ /D mcakfkioeanhfiojkchcndahgagcidbd /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 39 /T REG_SZ /D nddmmcpmdbkooddfjcohmlcfclhllgeh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 40 /T REG_SZ /D fnipglnbhfacfmefbgiiodalehbcgcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 41 /T REG_SZ /D fldkdmkgnlbehfgeifjpjabmandnchpe /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 42 /T REG_SZ /D aiccdefnpjkolgnpdamdimejlfmopcca /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 43 /T REG_SZ /D mdjjpkalmajfkhnamkekeljbfenponih /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 44 /T REG_SZ /D kppfgjkgimgbanjbbgpmccbkagcebnid /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 45 /T REG_SZ /D omimccinlhlkpjaeaocglgmkbelejlhj /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 46 /T REG_SZ /D cngjoacjdpnadhhjpdppcdjboiclnclc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 47 /T REG_SZ /D hloblpeplfiajnfdengendhdnpmdgagn /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 48 /T REG_SZ /D gmdffbblaahnjmpcjaenakkdplibibge /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 49 /T REG_SZ /D maekfnoeejhpjfkfmdlckioggdcdofpg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 50 /T REG_SZ /D cmedhionkhpnakcndndgjdbohmhepckk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 51 /T REG_SZ /D gpbfjnhlnemfnhajnmkjicfmbagfbejm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 52 /T REG_SZ /D gkhnanmhgeggclieoggjehkloolfkbdo /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 53 /T REG_SZ /D oldifepkckfmnlokobgdbjjfjjmhfgag /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 54 /T REG_SZ /D megdnjjcjgoiacejpegmfoeooleddmeb /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 55 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 56 /T REG_SZ /D khnleagcghdbpphacgjjkcoceilngecl /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 57 /T REG_SZ /D cegbjdefhfnbphoghdgcapnliodjbncp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 58 /T REG_SZ /D emngkmlligggbbiioginlkphcmffbncb /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 59 /T REG_SZ /D jompdinfdpijbcngkadcdaladbochoae /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 60 /T REG_SZ /D pkocadmokmpjeeaimigjpmfpdaighkga /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 61 /T REG_SZ /D jaeigffnocnbblojlfmiimdocmfcjkii /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 62 /T REG_SZ /D ppdonaappkjkbgbncmmjencphdclioab /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 63 /T REG_SZ /D lalfpjdbhpmnhfofkckdpkljeilmogfl /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D alcmakjhknigccfidaelkafjmfifkhkc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D fmaicbnbcbjgbpecclcnaehmbpjpdane /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D icegedoajhdclokfmeobnnbalabmpehm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D jhpheijfhpbkaejncokigfaihgdndjhg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D jbbmlecgjpijkeelnebilpekpnkaoool /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D gokhabgljglbmjilkmelajgkkhofeeij /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D klapabjimnakejfmpdolgamfplaondck /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D pclbpfjdhojdfcojcmmgggaanfnmhifk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D dhdpjhfemdchgdfngofnkgmabdmchoii /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D ckjbcmkjhocgdhmkkkieknbmhdnjanoh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D fkjdaikpmbninlknfjgehkoggdgmknel /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D eilkefcdofnagepelocjipipghaalkam /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D ocbcobiceiagblnejkcekbpgpakolhff /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D lkcohpjckebdgmdofkdfppgeejccjmnl /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D fhjieeiddoiibfbdknfligkjlpihnmjc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D bkalmigiilcgdihccnaonhnkdhpfbaam /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D gkkehpomgpdgkdmbdfkangmbafecdhhd /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D inejjjikomlbaahobecdaoaillmfejil /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D kllohiclobgoaffphlofnjdlabflpgha /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D ececmkgelhdncajgmofiffjmhojnimmb /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D fjadbbodmeifhkgepjjkeneeojammfag /F
:: VPN
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D kalfeohpimfncbfhjhanngehpbfilokk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D nlbejmccbhkncgokjcmghpfloaajcffj /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D ejkaocphofnobjdedneohbbiilggdlbi /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D bihmplhobchoageeokmgbdihknkjbknd /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D aleggpabliehgbeagmfhnodcijcmbonb /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D fpmapakogndmenjcfoajifaaonnkpkei /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D llkbempahblbohpipifajipejjackemi /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D nplnfhpilojbbcnjpiaoecppkkicfgfp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D jeajkcogjepdpppofeocjpejdckbgdco /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D eekepadogplleogcggcjkfebfjhihlnm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D mmknfaojcgjcelkoabokhaljjapiogbg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D jalmmnpclgbgcphkbnglcnlobgcbhkki /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D hkegehhbmbongohpgmdadkbkmnfokicn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D odfnofpjippoimohokldpheacfenmfch /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D oobhlpildfogoccaffnfckililknpcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D jmgacjgobknfojonlckhndlamkfcjofm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D gfceeghcoekcmlpgonlplkpmakdmpgmg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kfgffakpbnpfonmljmpfamjpnjbhfiij /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D bbebbhmelpcfmijoanocdliephmoahln /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
:: Amazon Assistant
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D pbjikboenpfhbbejgkoklgkhjpfogcam /F
:: College Board Browser
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D lhfmngifffjhdjdgkfdhbifhndddmjko /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D hblfbmjdaalalhifaajnnodlkiloengc /F
:: ProctorU
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D kbmmbecgmmkedcifdommembgkeomigjf /F
:: Nano Adblocker / Nano Defender
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D gabbbocakeomblphkmmnoamkioajlkfo /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 121 /T REG_SZ /D ggolfgbegefeeoocgjbmkembbncoadlb /F
:: Grammer Check Software Block
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 122 /T REG_SZ /D kdfieneakcjfaiglcfcgkidlkmlijjnh /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 123 /T REG_SZ /D oldceeleldhonbafppcapldpdifcinji /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 124 /T REG_SZ /D pjpgohokimaldkikgejifibjdpbopfdc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 125 /T REG_SZ /D gpaiobkfhnonedkhhfjpmhdalgeoebfa /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 126 /T REG_SZ /D npnbdojkgkbcdfdjlfdmplppdphlhhcf /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 127 /T REG_SZ /D hamhaljjdpcgkelbadepgmnocknejief /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 128 /T REG_SZ /D ifajfiofeifbbhbionejdliodenmecna /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 129 /T REG_SZ /D dmngfggkdcjejjgbfemebfomkphgcena /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 130 /T REG_SZ /D mpeepmfabickbdbckcejbflkpfamgcon /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 131 /T REG_SZ /D dmgkiikdlhmpikkhpiplldicbnicmboc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 132 /T REG_SZ /D ndgklmlnheedegipcohgcbjhhgddendc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 134 /T REG_SZ /D ecpbljknammclncihheaiehdahccgmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 135 /T REG_SZ /D nohphjepbjannpjpmodlcgdlialokkpd /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 136 /T REG_SZ /D oidhbpddkfhmipanjccneeifmmiabjng /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 137 /T REG_SZ /D nngceafehcgnogadphbkblijebijibkj /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 138 /T REG_SZ /D fkjahhehbehlijcehipnhpjhldcajban /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 139 /T REG_SZ /D ljgdcokhgjdpghmhdkbolccfcfdbklpo /F
:: Tunnelbear
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 140 /T REG_SZ /D omdakjcmkglenbhjadbccaookpfjihpa /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 141 /T REG_SZ /D njglkaigokomacaljolalkopeonkpbik /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 142 /T REG_SZ /D obhacaboehinamiaoafpljgofoapchgf /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 143 /T REG_SZ /D cccmaneagdjeppggplfjbemndmknmdib /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 144 /T REG_SZ /D kgddnoifhgfdhcpbkkjdgokfnkkmdcen /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 145 /T REG_SZ /D jaohnaoeopobbpjdeglffjnaclhifabp /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 146 /T REG_SZ /D fnkihbploojbmldhgdfpalkoifmegfpn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 147 /T REG_SZ /D kdmoafnhillldhoddnccefecelkofphm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 148 /T REG_SZ /D keghjkfdmmdkneijbbbnopeglnakbphn /F
:: Securly Classroom
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 149 /T REG_SZ /D jfbecfmiegcjddenjhlbhlikcbfmnafd /F
:: Securly for Chromebooks (This extension force reloads tabs when extension restarts)
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 150 /T REG_SZ /D iheobagjkfklnlikgihanlhcddjoihkg /F
:: Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites
:: lanschool student
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 151 /T REG_SZ /D ifeifkfohlobcbhmlfkenopaimbmnahb /F
:: lanschool web helper
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 152 /T REG_SZ /D honjcnefekfnompampcpmcdadibmjhlk /F
:: Read and Write
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 153 /T REG_SZ /D inoeonmfapjbbkmdafoankkfajkcphgd /F
:: Other 2
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 154 /T REG_SZ /D kgeglempfkhalebjlogemlmeakondflc /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 155 /T REG_SZ /D hmkphiklpggiafkgpmdekkofbadkffnn /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 156 /T REG_SZ /D jdfhadodhoabdfkgkclcdpocjffadkne /F

:: -----------------
:: Brave
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 2 /T REG_SZ /D cfhdojbkjhnklbpkdaibdccddilifddb /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 3 /T REG_SZ /D gighmmpiobklfepjocnamgkkbiglidom /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 4 /T REG_SZ /D lgblnfidahcdcjddiepkckcfdhpknnjh /F
:: uBlock (non-origin)
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 5 /T REG_SZ /D epcnnfbjfcgphgdmggkamkmgojdagdnn /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 6 /T REG_SZ /D ohahllgiabjaoigichmmfljhkcfikeof /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 7 /T REG_SZ /D bgnkhhnnamicmpeenaelnjfhikgbkllg /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 8 /T REG_SZ /D kbfnbcaeplbcioakkpcpgfkobkghlhen /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 9 /T REG_SZ /D noojmhngiheennhgaffkfboanjpbkpep /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 10 /T REG_SZ /D bjodbpcjeogaihbekannledankhcjbgo /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 11 /T REG_SZ /D bmnlcjabgnpnenekpadlanbbkooimhnj /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 12 /T REG_SZ /D gomekmidlodglbbmalcneegieacbdmki /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 13 /T REG_SZ /D eofcbnmajmjmplflapaojjnihcjkigck /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 14 /T REG_SZ /D nbmoafcmbajniiapeidgficgifbfmjfo /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 15 /T REG_SZ /D mbckjcfnjmoiinpgddefodcighgikkgn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 16 /T REG_SZ /D ggimcfhnklgjpgehibgfmoidcgmbhppm /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 17 /T REG_SZ /D kcdahmgmaagjhocpipbodaokikjkampi /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 18 /T REG_SZ /D gkojfkhlekighikafcpjkiklfbnlmeio /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 19 /T REG_SZ /D lpognpnpncelknkahlngpojfjgdmkodn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 20 /T REG_SZ /D eoigllimhcllmhedfbmahegmoakcdakd /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 21 /T REG_SZ /D napjheenlliimoedooldaalpjfidlidp /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 22 /T REG_SZ /D klekeajafkkpokaofllcadenjdckhinm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 23 /T REG_SZ /D cmendinpapjjojakimjlmkkkcmnojefg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 24 /T REG_SZ /D jjkchpdmjjdmalgembblgafllbpcjlei /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 25 /T REG_SZ /D lkdiimaiohgpacfbgedcipmgigppaofn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 26 /T REG_SZ /D kaedchgajfpgipflgbgeeiiajekblklm /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 27 /T REG_SZ /D bhmmomiinigofkjcapegjjndpbikblnp /F
:: Adobe
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 28 /T REG_SZ /D efaidnbmnnnibpcajpcglclefindmkaj /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 29 /T REG_SZ /D pedmlpceiodameienmmkpkkpilgklmfh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 30 /T REG_SZ /D fbgcedjacmlbgleddnoacbnijgmiolem /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 31 /T REG_SZ /D dhelmjcpoddajfaldodimlaehbalhgag /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 32 /T REG_SZ /D obdappnhkfoejojnmcohppfnoeagadna /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 33 /T REG_SZ /D bkbeeeffjjeopflfhgeknacdieedcoml /F
:: -----
:: Fake TikTok
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 34 /T REG_SZ /D bjflcommipadapdldncoacffcccldlkm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 35 /T REG_SZ /D niljfkkadomdhekbkamcdlmokhnklign /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 36 /T REG_SZ /D agnbmfinlfpgonkehceknkpapgoibdno /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 37 /T REG_SZ /D dedphjedjalglppdfpmmibdbbkmifnbb /F
:: Fake Flash 
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 38 /T REG_SZ /D mcakfkioeanhfiojkchcndahgagcidbd /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 39 /T REG_SZ /D nddmmcpmdbkooddfjcohmlcfclhllgeh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 40 /T REG_SZ /D fnipglnbhfacfmefbgiiodalehbcgcbm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 41 /T REG_SZ /D fldkdmkgnlbehfgeifjpjabmandnchpe /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 42 /T REG_SZ /D aiccdefnpjkolgnpdamdimejlfmopcca /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 43 /T REG_SZ /D mdjjpkalmajfkhnamkekeljbfenponih /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 44 /T REG_SZ /D kppfgjkgimgbanjbbgpmccbkagcebnid /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 45 /T REG_SZ /D omimccinlhlkpjaeaocglgmkbelejlhj /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 46 /T REG_SZ /D cngjoacjdpnadhhjpdppcdjboiclnclc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 47 /T REG_SZ /D hloblpeplfiajnfdengendhdnpmdgagn /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 48 /T REG_SZ /D gmdffbblaahnjmpcjaenakkdplibibge /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 49 /T REG_SZ /D maekfnoeejhpjfkfmdlckioggdcdofpg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 50 /T REG_SZ /D cmedhionkhpnakcndndgjdbohmhepckk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 51 /T REG_SZ /D gpbfjnhlnemfnhajnmkjicfmbagfbejm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 52 /T REG_SZ /D gkhnanmhgeggclieoggjehkloolfkbdo /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 53 /T REG_SZ /D oldifepkckfmnlokobgdbjjfjjmhfgag /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 54 /T REG_SZ /D megdnjjcjgoiacejpegmfoeooleddmeb /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 55 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 56 /T REG_SZ /D khnleagcghdbpphacgjjkcoceilngecl /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 57 /T REG_SZ /D cegbjdefhfnbphoghdgcapnliodjbncp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 58 /T REG_SZ /D emngkmlligggbbiioginlkphcmffbncb /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 59 /T REG_SZ /D jompdinfdpijbcngkadcdaladbochoae /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 60 /T REG_SZ /D pkocadmokmpjeeaimigjpmfpdaighkga /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 61 /T REG_SZ /D jaeigffnocnbblojlfmiimdocmfcjkii /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 62 /T REG_SZ /D ppdonaappkjkbgbncmmjencphdclioab /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 63 /T REG_SZ /D lalfpjdbhpmnhfofkckdpkljeilmogfl /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D alcmakjhknigccfidaelkafjmfifkhkc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D fmaicbnbcbjgbpecclcnaehmbpjpdane /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D icegedoajhdclokfmeobnnbalabmpehm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D jhpheijfhpbkaejncokigfaihgdndjhg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D jbbmlecgjpijkeelnebilpekpnkaoool /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D gokhabgljglbmjilkmelajgkkhofeeij /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D klapabjimnakejfmpdolgamfplaondck /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D pclbpfjdhojdfcojcmmgggaanfnmhifk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D dhdpjhfemdchgdfngofnkgmabdmchoii /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D ckjbcmkjhocgdhmkkkieknbmhdnjanoh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D fkjdaikpmbninlknfjgehkoggdgmknel /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D eilkefcdofnagepelocjipipghaalkam /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D ocbcobiceiagblnejkcekbpgpakolhff /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D lkcohpjckebdgmdofkdfppgeejccjmnl /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D fhjieeiddoiibfbdknfligkjlpihnmjc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D bkalmigiilcgdihccnaonhnkdhpfbaam /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D gkkehpomgpdgkdmbdfkangmbafecdhhd /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D inejjjikomlbaahobecdaoaillmfejil /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D kllohiclobgoaffphlofnjdlabflpgha /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D ececmkgelhdncajgmofiffjmhojnimmb /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D fjadbbodmeifhkgepjjkeneeojammfag /F
:: VPN
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D kalfeohpimfncbfhjhanngehpbfilokk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D nlbejmccbhkncgokjcmghpfloaajcffj /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D ejkaocphofnobjdedneohbbiilggdlbi /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D bihmplhobchoageeokmgbdihknkjbknd /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D aleggpabliehgbeagmfhnodcijcmbonb /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D fpmapakogndmenjcfoajifaaonnkpkei /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D llkbempahblbohpipifajipejjackemi /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D nplnfhpilojbbcnjpiaoecppkkicfgfp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D jeajkcogjepdpppofeocjpejdckbgdco /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D eekepadogplleogcggcjkfebfjhihlnm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D mmknfaojcgjcelkoabokhaljjapiogbg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D jalmmnpclgbgcphkbnglcnlobgcbhkki /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D hkegehhbmbongohpgmdadkbkmnfokicn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D odfnofpjippoimohokldpheacfenmfch /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D oobhlpildfogoccaffnfckililknpcbm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D jmgacjgobknfojonlckhndlamkfcjofm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D gfceeghcoekcmlpgonlplkpmakdmpgmg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kfgffakpbnpfonmljmpfamjpnjbhfiij /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D bbebbhmelpcfmijoanocdliephmoahln /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
:: Amazon Assistant
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D pbjikboenpfhbbejgkoklgkhjpfogcam /F
:: College Board Browser
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D lhfmngifffjhdjdgkfdhbifhndddmjko /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D hblfbmjdaalalhifaajnnodlkiloengc /F
:: ProctorU
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D kbmmbecgmmkedcifdommembgkeomigjf /F
:: Nano Adblocker / Nano Defender
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D gabbbocakeomblphkmmnoamkioajlkfo /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 121 /T REG_SZ /D ggolfgbegefeeoocgjbmkembbncoadlb /F
:: Grammer Check Software Block
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 122 /T REG_SZ /D kdfieneakcjfaiglcfcgkidlkmlijjnh /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 123 /T REG_SZ /D oldceeleldhonbafppcapldpdifcinji /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 124 /T REG_SZ /D pjpgohokimaldkikgejifibjdpbopfdc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 125 /T REG_SZ /D gpaiobkfhnonedkhhfjpmhdalgeoebfa /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 126 /T REG_SZ /D npnbdojkgkbcdfdjlfdmplppdphlhhcf /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 127 /T REG_SZ /D hamhaljjdpcgkelbadepgmnocknejief /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 128 /T REG_SZ /D ifajfiofeifbbhbionejdliodenmecna /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 129 /T REG_SZ /D dmngfggkdcjejjgbfemebfomkphgcena /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 130 /T REG_SZ /D mpeepmfabickbdbckcejbflkpfamgcon /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 131 /T REG_SZ /D dmgkiikdlhmpikkhpiplldicbnicmboc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 132 /T REG_SZ /D ndgklmlnheedegipcohgcbjhhgddendc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 134 /T REG_SZ /D ecpbljknammclncihheaiehdahccgmnk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 135 /T REG_SZ /D nohphjepbjannpjpmodlcgdlialokkpd /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 136 /T REG_SZ /D oidhbpddkfhmipanjccneeifmmiabjng /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 137 /T REG_SZ /D nngceafehcgnogadphbkblijebijibkj /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 138 /T REG_SZ /D fkjahhehbehlijcehipnhpjhldcajban /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 139 /T REG_SZ /D ljgdcokhgjdpghmhdkbolccfcfdbklpo /F
:: Tunnelbear
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 140 /T REG_SZ /D omdakjcmkglenbhjadbccaookpfjihpa /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 141 /T REG_SZ /D njglkaigokomacaljolalkopeonkpbik /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 142 /T REG_SZ /D obhacaboehinamiaoafpljgofoapchgf /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 143 /T REG_SZ /D cccmaneagdjeppggplfjbemndmknmdib /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 144 /T REG_SZ /D kgddnoifhgfdhcpbkkjdgokfnkkmdcen /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 145 /T REG_SZ /D jaohnaoeopobbpjdeglffjnaclhifabp /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 146 /T REG_SZ /D fnkihbploojbmldhgdfpalkoifmegfpn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 147 /T REG_SZ /D kdmoafnhillldhoddnccefecelkofphm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 148 /T REG_SZ /D keghjkfdmmdkneijbbbnopeglnakbphn /F
:: Securly Classroom
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 149 /T REG_SZ /D jfbecfmiegcjddenjhlbhlikcbfmnafd /F
:: Securly for Chromebooks (This extension force reloads tabs when extension restarts)
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 150 /T REG_SZ /D iheobagjkfklnlikgihanlhcddjoihkg /F
:: Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites
:: lanschool student
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 151 /T REG_SZ /D ifeifkfohlobcbhmlfkenopaimbmnahb /F
:: lanschool web helper
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 152 /T REG_SZ /D honjcnefekfnompampcpmcdadibmjhlk /F
:: Read and Write
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 153 /T REG_SZ /D inoeonmfapjbbkmdafoankkfajkcphgd /F
:: Other 2
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 154 /T REG_SZ /D kgeglempfkhalebjlogemlmeakondflc /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 155 /T REG_SZ /D hmkphiklpggiafkgpmdekkofbadkffnn /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 156 /T REG_SZ /D jdfhadodhoabdfkgkclcdpocjffadkne /F

:: -----------------
:: Microsoft Edge Chromium
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 2 /T REG_SZ /D cfhdojbkjhnklbpkdaibdccddilifddb /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 3 /T REG_SZ /D gighmmpiobklfepjocnamgkkbiglidom /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 4 /T REG_SZ /D lgblnfidahcdcjddiepkckcfdhpknnjh /F
:: uBlock (non-origin)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 5 /T REG_SZ /D epcnnfbjfcgphgdmggkamkmgojdagdnn /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 6 /T REG_SZ /D ohahllgiabjaoigichmmfljhkcfikeof /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 7 /T REG_SZ /D bgnkhhnnamicmpeenaelnjfhikgbkllg /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 8 /T REG_SZ /D kbfnbcaeplbcioakkpcpgfkobkghlhen /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 9 /T REG_SZ /D noojmhngiheennhgaffkfboanjpbkpep /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 10 /T REG_SZ /D bjodbpcjeogaihbekannledankhcjbgo /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 11 /T REG_SZ /D bmnlcjabgnpnenekpadlanbbkooimhnj /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 12 /T REG_SZ /D gomekmidlodglbbmalcneegieacbdmki /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 13 /T REG_SZ /D eofcbnmajmjmplflapaojjnihcjkigck /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 14 /T REG_SZ /D nbmoafcmbajniiapeidgficgifbfmjfo /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 15 /T REG_SZ /D mbckjcfnjmoiinpgddefodcighgikkgn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 16 /T REG_SZ /D ggimcfhnklgjpgehibgfmoidcgmbhppm /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 17 /T REG_SZ /D kcdahmgmaagjhocpipbodaokikjkampi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 18 /T REG_SZ /D gkojfkhlekighikafcpjkiklfbnlmeio /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 19 /T REG_SZ /D lpognpnpncelknkahlngpojfjgdmkodn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 20 /T REG_SZ /D eoigllimhcllmhedfbmahegmoakcdakd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 21 /T REG_SZ /D napjheenlliimoedooldaalpjfidlidp /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 22 /T REG_SZ /D klekeajafkkpokaofllcadenjdckhinm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 23 /T REG_SZ /D cmendinpapjjojakimjlmkkkcmnojefg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 24 /T REG_SZ /D jjkchpdmjjdmalgembblgafllbpcjlei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 25 /T REG_SZ /D lkdiimaiohgpacfbgedcipmgigppaofn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 26 /T REG_SZ /D kaedchgajfpgipflgbgeeiiajekblklm /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 27 /T REG_SZ /D bhmmomiinigofkjcapegjjndpbikblnp /F
:: Adobe
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 28 /T REG_SZ /D efaidnbmnnnibpcajpcglclefindmkaj /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 29 /T REG_SZ /D pedmlpceiodameienmmkpkkpilgklmfh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 30 /T REG_SZ /D fbgcedjacmlbgleddnoacbnijgmiolem /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 31 /T REG_SZ /D dhelmjcpoddajfaldodimlaehbalhgag /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 32 /T REG_SZ /D obdappnhkfoejojnmcohppfnoeagadna /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 33 /T REG_SZ /D bkbeeeffjjeopflfhgeknacdieedcoml /F
:: -----
:: Fake TikTok
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 34 /T REG_SZ /D bjflcommipadapdldncoacffcccldlkm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 35 /T REG_SZ /D niljfkkadomdhekbkamcdlmokhnklign /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 36 /T REG_SZ /D agnbmfinlfpgonkehceknkpapgoibdno /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 37 /T REG_SZ /D dedphjedjalglppdfpmmibdbbkmifnbb /F
:: Fake Flash 
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 38 /T REG_SZ /D mcakfkioeanhfiojkchcndahgagcidbd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 39 /T REG_SZ /D nddmmcpmdbkooddfjcohmlcfclhllgeh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 40 /T REG_SZ /D fnipglnbhfacfmefbgiiodalehbcgcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 41 /T REG_SZ /D fldkdmkgnlbehfgeifjpjabmandnchpe /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 42 /T REG_SZ /D aiccdefnpjkolgnpdamdimejlfmopcca /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 43 /T REG_SZ /D mdjjpkalmajfkhnamkekeljbfenponih /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 44 /T REG_SZ /D kppfgjkgimgbanjbbgpmccbkagcebnid /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 45 /T REG_SZ /D omimccinlhlkpjaeaocglgmkbelejlhj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 46 /T REG_SZ /D cngjoacjdpnadhhjpdppcdjboiclnclc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 47 /T REG_SZ /D hloblpeplfiajnfdengendhdnpmdgagn /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 48 /T REG_SZ /D gmdffbblaahnjmpcjaenakkdplibibge /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 49 /T REG_SZ /D maekfnoeejhpjfkfmdlckioggdcdofpg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 50 /T REG_SZ /D cmedhionkhpnakcndndgjdbohmhepckk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 51 /T REG_SZ /D gpbfjnhlnemfnhajnmkjicfmbagfbejm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 52 /T REG_SZ /D gkhnanmhgeggclieoggjehkloolfkbdo /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 53 /T REG_SZ /D oldifepkckfmnlokobgdbjjfjjmhfgag /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 54 /T REG_SZ /D megdnjjcjgoiacejpegmfoeooleddmeb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 55 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 56 /T REG_SZ /D khnleagcghdbpphacgjjkcoceilngecl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 57 /T REG_SZ /D cegbjdefhfnbphoghdgcapnliodjbncp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 58 /T REG_SZ /D emngkmlligggbbiioginlkphcmffbncb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 59 /T REG_SZ /D jompdinfdpijbcngkadcdaladbochoae /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 60 /T REG_SZ /D pkocadmokmpjeeaimigjpmfpdaighkga /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 61 /T REG_SZ /D jaeigffnocnbblojlfmiimdocmfcjkii /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 62 /T REG_SZ /D ppdonaappkjkbgbncmmjencphdclioab /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 63 /T REG_SZ /D lalfpjdbhpmnhfofkckdpkljeilmogfl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D alcmakjhknigccfidaelkafjmfifkhkc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D fmaicbnbcbjgbpecclcnaehmbpjpdane /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D icegedoajhdclokfmeobnnbalabmpehm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D jhpheijfhpbkaejncokigfaihgdndjhg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D jbbmlecgjpijkeelnebilpekpnkaoool /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D gokhabgljglbmjilkmelajgkkhofeeij /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D klapabjimnakejfmpdolgamfplaondck /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D pclbpfjdhojdfcojcmmgggaanfnmhifk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D dhdpjhfemdchgdfngofnkgmabdmchoii /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D ckjbcmkjhocgdhmkkkieknbmhdnjanoh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D fkjdaikpmbninlknfjgehkoggdgmknel /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D eilkefcdofnagepelocjipipghaalkam /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D ocbcobiceiagblnejkcekbpgpakolhff /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D lkcohpjckebdgmdofkdfppgeejccjmnl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D pedpfddehkfmobhbnccdcbhidojinimh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D fhjieeiddoiibfbdknfligkjlpihnmjc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D bkalmigiilcgdihccnaonhnkdhpfbaam /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D gkkehpomgpdgkdmbdfkangmbafecdhhd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D inejjjikomlbaahobecdaoaillmfejil /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D kllohiclobgoaffphlofnjdlabflpgha /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D ececmkgelhdncajgmofiffjmhojnimmb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D fjadbbodmeifhkgepjjkeneeojammfag /F
:: VPN
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D kalfeohpimfncbfhjhanngehpbfilokk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D nlbejmccbhkncgokjcmghpfloaajcffj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D ejkaocphofnobjdedneohbbiilggdlbi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D bihmplhobchoageeokmgbdihknkjbknd /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D aleggpabliehgbeagmfhnodcijcmbonb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D fpmapakogndmenjcfoajifaaonnkpkei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D llkbempahblbohpipifajipejjackemi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D nplnfhpilojbbcnjpiaoecppkkicfgfp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D jeajkcogjepdpppofeocjpejdckbgdco /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D eekepadogplleogcggcjkfebfjhihlnm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D mmknfaojcgjcelkoabokhaljjapiogbg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D jalmmnpclgbgcphkbnglcnlobgcbhkki /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D hkegehhbmbongohpgmdadkbkmnfokicn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D odfnofpjippoimohokldpheacfenmfch /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D oobhlpildfogoccaffnfckililknpcbm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D hkjemkcbndldepdbnbdnibeppofoooio /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D nlhaleloflnhpemagojabiikkkejjlgp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D jmgacjgobknfojonlckhndlamkfcjofm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D gfceeghcoekcmlpgonlplkpmakdmpgmg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kfgffakpbnpfonmljmpfamjpnjbhfiij /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D bbebbhmelpcfmijoanocdliephmoahln /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D igcpjndghfaebohjdanobonebnejppej /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
:: Amazon Assistant (Chrome Store Version)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 177 /T REG_SZ /D pbjikboenpfhbbejgkoklgkhjpfogcam /F
:: College Board Browser
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 178 /T REG_SZ /D lhfmngifffjhdjdgkfdhbifhndddmjko /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 179 /T REG_SZ /D hblfbmjdaalalhifaajnnodlkiloengc /F
:: ProctorU
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 180 /T REG_SZ /D goobgennebinldhonaajgafidboenlkl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 181 /T REG_SZ /D digojkgonhgmnohbapdfjllpnmjmdhpg /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 182 /T REG_SZ /D kbmmbecgmmkedcifdommembgkeomigjf /F
:: Nano Adblocker / Nano Defender (Chrome Store Version)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 183 /T REG_SZ /D gabbbocakeomblphkmmnoamkioajlkfo /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 184 /T REG_SZ /D ggolfgbegefeeoocgjbmkembbncoadlb /F

:: -----------------
:: Microsoft Edge Chromium Add-on Store
:: -----------------

:: Fake Tiktok
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D eamchpjkhdjbbhdanfngombbbafoopbm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D pdjhconnbgkdigcldclgbgihmjokldbe /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D mipfipmcmnedgckncckicogmnncflhhk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D goepanlbnhiiaopmfcniejcbhgolcllb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D ccjbgffbjdbnnpdnopghofogcfeopdmn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D celdediiemogjpfcjocdbildilkccepl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D ofbgciponmcpbencjjhomeoekhnlnppj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 121 /T REG_SZ /D clklfdpdakpekcamjgiedicfnikeajcl /F
:: Fake Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 122 /T REG_SZ /D omhnkkegfjjhpkobpjdiokemdecmmebb /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 123 /T REG_SZ /D oakdjiehbhihbklollmmmkhfilbklgkf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 124 /T REG_SZ /D ffnfbjmflmibccofnlgeolaoamencnpf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 125 /T REG_SZ /D bpllndkbconceaidgcllkolimbbiojic /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 126 /T REG_SZ /D lmfhgdeejhbbcagkkbefkkgkfofjhfch /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 127 /T REG_SZ /D efpgcmfgkpmogadebodiegjleafcmdcb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 128 /T REG_SZ /D onlofoccaenllpjmalbnilfacjmcfhfk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 129 /T REG_SZ /D bpffhahkoibohjndinfiimfomedmgnme /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 130 /T REG_SZ /D kkkldohdhcfhpjchcefpkfhjfeapdmek /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 131 /T REG_SZ /D gaobomhkmmnbjgehdfjeklkbfddhjbfi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 132 /T REG_SZ /D fbobegkkdmmcnmoplkgdmfhdlkjfelnb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 133 /T REG_SZ /D jlfbbmbfbkkilahjmbjehndogohpbfmf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 134 /T REG_SZ /D bbocfgcdelebeaboidkmglbdkimdpojb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 135 /T REG_SZ /D dckihkcdmjmlkndgmmgplpcnkmdpangb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 136 /T REG_SZ /D gclhifbbggfamoojmienffegbmmfnfll /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 137 /T REG_SZ /D pafjohfpgafakkaoccipcknnaoneopei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 138 /T REG_SZ /D oggghceenfdiodiakhigmpamjpcnilin /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 139 /T REG_SZ /D lojfohldolbkplldokkjgjmcffealmka /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 140 /T REG_SZ /D nipggfgilmoiofmnkbeabghbcaohmjih /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 141 /T REG_SZ /D obmbbppggfnabhdbepdbmpcjfckkoljl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 142 /T REG_SZ /D pejdjolhgfenbjfjoejgllffflbbgecm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 143 /T REG_SZ /D kjdjplhnalcgkamkcidihcodlblkihon /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 144 /T REG_SZ /D mbdlpgncclnhomdpmicmgdihapedhhak /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 145 /T REG_SZ /D odiffgppifkpehahdcafnkloapoblbkj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 146 /T REG_SZ /D fhhdniedlnfoenmhbajomdablgpbhnad /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 147 /T REG_SZ /D bhhjenbjldcljpdofmhkdcdfmbagoong /F
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Chrome Web Store Version of force installed extensions (Microsoft addons versions already installed)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 148 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 149 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 150 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 151 /T REG_SZ /D gmgoamodcdcjnbaobigkjelfplakmdhh /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 152 /T REG_SZ /D ndcileolkflehcjpmjnfbnaibdcgglog /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 153 /T REG_SZ /D jccfboncbdccgbgcbhickioeailgpkgb /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 154 /T REG_SZ /D pciakllldcajllepkbbihkmfkikheffb /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 155 /T REG_SZ /D pdffkfellgipmhklpdmokmckkkfcopbh /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 156 /T REG_SZ /D cnlefmmeadmemmdciolhbnfeacpdfbkd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 157 /T REG_SZ /D kljjdbdffnbengiilkaiblpinbhfcfnc /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 158 /T REG_SZ /D amnbcmdbanbkjhnfoeceemmmdiepnbpp /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 159 /T REG_SZ /D fdgpikaaheckgdijjmepmdjjkbceakif /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 160 /T REG_SZ /D phhhmbgggfifgikoihlakngnngdehhfe /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 161 /T REG_SZ /D lacbjnnibafcbpogdcpfdpmajfkdampi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 162 /T REG_SZ /D iffhejniciepiiafcfhhapiidaomcdam /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 163 /T REG_SZ /D nfjgmgjhcihmkobljembcfodkajehoej /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 164 /T REG_SZ /D bdaafgjhhjkdplpffldcncdignokfkbo /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 165 /T REG_SZ /D fdhgeoginicibhagdmblfikbgbkahibd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 166 /T REG_SZ /D lamehkegphbbfdailghaeeleoajilfho /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 167 /T REG_SZ /D iiclaphjclecagpkkaacljnpcppnoibi /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 168 /T REG_SZ /D jebegceanihjkbdfnjelignmnclhpnfh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 169 /T REG_SZ /D bnplfnhcidhhdapmblniehfaaompjlck /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 170 /T REG_SZ /D eghmccdcabhgeigmkhfbnioepobdhhab /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 171 /T REG_SZ /D cjmjijnpnollocennnapedpaeecninea /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 172 /T REG_SZ /D acgiggmcehhbhfnedfkcgenplgkjddef /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 173 /T REG_SZ /D hcfdaddfkgbmekbgcepcnpfiopaigpnn /F
:: Amazon Assistant (Edge Addon Version)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 174 /T REG_SZ /D hkmnokmdbkkafgmpfhhiniclfnfpmogj /F
:: Nano Adblocker / Nano Defender (Edge Addon Version)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 175 /T REG_SZ /D epbkapkgcmdmfpogenoebpdeibmfinpf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 176 /T REG_SZ /D ijfkmnlofajajikjhfiigelipempcklj /F
:: Grammer Check Software Block
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 177 /T REG_SZ /D blnfpbeiknacmjcafapeejaljddgoain /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 178 /T REG_SZ /D kdfieneakcjfaiglcfcgkidlkmlijjnh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 179 /T REG_SZ /D oldceeleldhonbafppcapldpdifcinji /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 180 /T REG_SZ /D pjpgohokimaldkikgejifibjdpbopfdc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 181 /T REG_SZ /D gpaiobkfhnonedkhhfjpmhdalgeoebfa /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 182 /T REG_SZ /D npnbdojkgkbcdfdjlfdmplppdphlhhcf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 183 /T REG_SZ /D hamhaljjdpcgkelbadepgmnocknejief /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 184 /T REG_SZ /D ifajfiofeifbbhbionejdliodenmecna /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 185 /T REG_SZ /D dmngfggkdcjejjgbfemebfomkphgcena /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 186 /T REG_SZ /D mpeepmfabickbdbckcejbflkpfamgcon /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 187 /T REG_SZ /D dmgkiikdlhmpikkhpiplldicbnicmboc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 188 /T REG_SZ /D ndgklmlnheedegipcohgcbjhhgddendc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 189 /T REG_SZ /D ecpbljknammclncihheaiehdahccgmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 190 /T REG_SZ /D nohphjepbjannpjpmodlcgdlialokkpd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 191 /T REG_SZ /D oidhbpddkfhmipanjccneeifmmiabjng /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 192 /T REG_SZ /D nngceafehcgnogadphbkblijebijibkj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 193 /T REG_SZ /D fkjahhehbehlijcehipnhpjhldcajban /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 194 /T REG_SZ /D ljgdcokhgjdpghmhdkbolccfcfdbklpo /F
:: Tunnelbear
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 195 /T REG_SZ /D omdakjcmkglenbhjadbccaookpfjihpa /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 196 /T REG_SZ /D njglkaigokomacaljolalkopeonkpbik /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 197 /T REG_SZ /D obhacaboehinamiaoafpljgofoapchgf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 198 /T REG_SZ /D cccmaneagdjeppggplfjbemndmknmdib /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 199 /T REG_SZ /D kgddnoifhgfdhcpbkkjdgokfnkkmdcen /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 200 /T REG_SZ /D jaohnaoeopobbpjdeglffjnaclhifabp /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 201 /T REG_SZ /D fnkihbploojbmldhgdfpalkoifmegfpn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 202 /T REG_SZ /D kdmoafnhillldhoddnccefecelkofphm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 203 /T REG_SZ /D keghjkfdmmdkneijbbbnopeglnakbphn /F
:: Securly Classroom
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 204 /T REG_SZ /D jfbecfmiegcjddenjhlbhlikcbfmnafd /F
:: Securly for Chromebooks (This extension force reloads tabs when extension restarts)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 205 /T REG_SZ /D iheobagjkfklnlikgihanlhcddjoihkg /F
:: Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites
:: lanschool student
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 206 /T REG_SZ /D ifeifkfohlobcbhmlfkenopaimbmnahb /F
:: lanschool web helper
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 207 /T REG_SZ /D honjcnefekfnompampcpmcdadibmjhlk /F
:: Read and Write Extension Chromium and Edge
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 208 /T REG_SZ /D inoeonmfapjbbkmdafoankkfajkcphgd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 209 /T REG_SZ /D bjglhpoliipklkfjcahfefdlfpifcinb /F
:: Other 2
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 210 /T REG_SZ /D kgeglempfkhalebjlogemlmeakondflc /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 211 /T REG_SZ /D hmkphiklpggiafkgpmdekkofbadkffnn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 212 /T REG_SZ /D jdfhadodhoabdfkgkclcdpocjffadkne /F

:: -----------------

:: -------
:: Take Ownership and Full Control under administrators group
:: -------

:: Windows 10 Update Notifications
takeown /f musnotification.exe /a /r /d y
icacls musnotification.exe /inheritance:r
icacls musnotification.exe /grant administrators:F /t /q
icacls musnotification.exe /deny everyone:F /t /q

takeown /f musnotificationux.exe /a /r /d y
icacls musnotificationux.exe /inheritance:r
icacls musnotificationux.exe /grant administrators:F /t /q
icacls musnotificationux.exe /deny everyone:F /t /q

:: Microsoft Connect App (Removed in Version 2004/20H1)
:: 		Disables the Microsoft Connect App

takeown /f "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /grant administrators:F /t /q
rd /s /q "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" && md "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy"
takeown /f "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /grant administrators:F /t /q
icacls "%windir%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /deny everyone:F /t /q

:: Holographic First Run (Removed in Version 1809)
:: 		Disables the Holographic App / Windows Mixed Reality App

takeown /f "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /grant administrators:F /t /q
rd /s /q "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" && md "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy"
takeown /f "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /grant administrators:F /t /q
icacls "%windir%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /deny everyone:F /t /q

:: -----------------
:: Remove Microsoft Edge Chromium has been moved to top of main section of batch file

:: -----------------
:: Remove Microsoft Edge Legacy
:: -----------------

TASKKILL /F /IM MicrosoftEdge.exe
TASKKILL /F /IM MicrosoftEdgeUpdate.exe

takeown /f "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" && md "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
takeown /f "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /deny everyone:F /t /q

takeown /f "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" && md "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
takeown /f "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%windir%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /deny everyone:F /t /q

:: takeown /f "%UserProfile%\AppData\Local\MicrosoftEdge" /a /r /d y
:: icacls "%UserProfile%\AppData\Local\MicrosoftEdge" /grant administrators:F /t /q
:: rd /s /q "%UserProfile%\AppData\Local\MicrosoftEdge"

:: takeown /f "%UserProfile%\MicrosoftEdgeBackups" /a /r /d y
:: icacls "%UserProfile%\MicrosoftEdgeBackups" /grant administrators:F /t /q
:: rd /s /q "%UserProfile%\MicrosoftEdgeBackups"

:: -----------------
:: Uninstall and Disable OneDrive
:: -----------------

REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /V System.IsPinnedToNameSpaceTree /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSyncNGSC /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSync /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Microsoft\OneDrive" /V PreventNetworkTrafficPreUserSignIn /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableMeteredNetworkFileSync /T REG_dWORD /D 0 /F

%windir%\SysWOW64\OneDriveSetup.exe /uninstall

%windir%\System32\OneDriveSetup.exe /uninstall

takeown /f "%UserProfile%\AppData\Local\Microsoft\OneDrive" /a /r /d y
icacls "%UserProfile%\AppData\Local\Microsoft\OneDrive" /grant administrators:F /t /q
rd /s /q "%UserProfile%\AppData\Local\Microsoft\OneDrive"

takeown /f "%ProgramData%\Microsoft OneDrive" /a /r /d y
icacls "%ProgramData%\Microsoft OneDrive" /grant administrators:F /t /q
rd /s /q "%ProgramData%\Microsoft OneDrive"

takeown /f "%UserProfile%\OneDrive" /a /r /d y
icacls "%UserProfile%\OneDrive" /grant administrators:F /t /q
rd /s /q "%UserProfile%\OneDrive"

:: -----------------

:: Lock Screen Pictures Location
:: 		Takes over permissions over SystemData Folder, lets administrator accounts change the lock screen
::			In order to change lock screen image, replace old image with new image under the same name

takeown /f "%ProgramData%\Microsoft\Windows\SystemData" /a /r /d y
icacls "%ProgramData%\Microsoft\Windows\SystemData" /inheritance:d
icacls "%ProgramData%\Microsoft\Windows\SystemData" /grant administrators:F /t /q

:: -------

:: Remove Other Folders

:: 3D Objects Folder
takeown /f "%UserProfile%\3D Objects" /a /r /d y
icacls "%UserProfile%\3D Objects" /grant administrators:F /t /q
rd /s /q "%UserProfile%\3D Objects"

:: Adobe Flash Player
takeown /f "%UserProfile%\AppData\Roaming\Adobe\Flash Player" /a /r /d y
icacls "%UserProfile%\AppData\Roaming\Adobe\Flash Player" /grant administrators:F /t /q
rd /s /q "%UserProfile%\AppData\Roaming\Adobe\Flash Player"

:: Mixed Reality Viewer
takeown /f "%ProgramData%\WindowsHolographicDevices" /a /r /d y
icacls "%ProgramData%\WindowsHolographicDevices" /grant administrators:F /t /q
rd /s /q "%ProgramData%\WindowsHolographicDevices"

:: Disable Windows XPS Document Writer
DISM /online /Disable-Feature /FeatureName:Printing-XPSServices-Features -NoRestart

:: -------
:: Disable Internet Explorer
:: -------

DISM /online /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0 -NoRestart

:: https://docs.microsoft.com/en-us/troubleshoot/browsers/disable-internet-explorer-windows

:: -------
:: Set Time Zone (United States Eastern Time)
:: -------

net stop tzautoupdate

:: Disable Auto Select Time Zone
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate" /V start /T REG_dWORD /D 4 /F

:: Set Time to United States Eastern Time
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /V "TimeZoneKeyName" /T REG_SZ /D "Eastern Standard Time" /F

:: Auto Set Daylight Savings Time
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /V "DynamicDaylightTimeDisabled" /T REG_dWORD /D 0 /F

:: Sync Time
timeout /t 2 /nobreak
w32tm /resync
timeout /t 2 /nobreak
w32tm /resync
timeout /t 2 /nobreak

:: Set Short Date Format
REG ADD "HKCU\Control Panel\International" /V "sShortDate" /T REG_SZ /D "MMMM dd, yyyy" /F

:: Set Long Date Format
REG ADD "HKCU\Control Panel\International" /V "sLongDate" /T REG_SZ /D "dddd, MMMM dd, yyyy" /F

:: -----------------
:: Powershell Command to Remove UWP Apps (Except Microsoft Store, Calculator, and Windows Terminal)
:: Powershell Command to Prompt to Restart Computer
:: Redirects to powershell script (setup.ps1)
:: -----------------

powershell.exe -ExecutionPolicy Unrestricted -Command ". '%~dpn0.ps1'"

powershell.exe -ExecutionPolicy AllSigned -Command Write-Output "Complete"

@echo OFF

goto RestartPrompt

:: -------

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
:: Other Messages
:: --------------
:: Non-Admin Message
:adminfailed
echo.
echo -------
echo.
echo This batch file requires admin permission
goto end1
:: --------------
:: Deny Message
:deny
echo.
echo -------
echo.
echo You have denied permissions
goto end1
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
:: End of File Message
:end
echo.
echo -------
:end1
echo.
echo Press Any Key to End
echo.
echo -------
echo.
PAUSE
goto :EOF
:: --------------

:: ----------------------------------------------------------------------
:: ----- OPTIONAL -----
:: -----------------

:: ----- Securly and GoGuardian Weakness
:: Blocklists are not stored through extension, if their servers cannot be reached (securly.com and goguardian.com), extension is unable to block or monitor websites

:: ----- Chrome

:: Disable Automatic Google Account Browser Signin (non-forced option) - (Google Chrome Only)
:: REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BrowserSignin /T REG_dWORD /D 0 /F

:: Disable Sync (Google Chrome)
:: REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SyncDisabled /T REG_dWORD /D 1 /F

:: ----- Chromium

:: Disable Guest Mode (All Chromium-based Browsers)
:: REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BrowserGuestModeEnabled /T REG_dWORD /D 0 /F

:: Disable Incognito Mode (All Chromium-based Browsers EXCEPT Microsoft Edge Chromium)
:: REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V IncognitoModeAvailability /T REG_dWORD /D 1 /F
:: 0 - User Choice, 1 - Force Disable, 2 - Force Enabled

:: Disable Sync (Already Included in Main)
:: REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SyncDisabled /T REG_dWORD /D 1 /F

    :: Chromium Clear Browsing History on EXIT
    :: (Make Sure to DISABLE SYNC)

    :: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ClearBrowsingDataOnExitList" /V "1" /T REG_SZ /D "browsing_history" /F
    :: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ClearBrowsingDataOnExitList" /V "2" /T REG_SZ /D "download_history" /F
    :: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ClearBrowsingDataOnExitList" /V "3" /T REG_SZ /D "cookies_and_other_site_data" /F
    :: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ClearBrowsingDataOnExitList" /V "4" /T REG_SZ /D "cached_images_and_files" /F
    :: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ClearBrowsingDataOnExitList" /V "5" /T REG_SZ /D "autofill" /F
    :: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ClearBrowsingDataOnExitList" /V "6" /T REG_SZ /D "hosted_app_data" /F
    :: REG ADD "HKLM\SOFTWARE\Policies\Chromium\ClearBrowsingDataOnExitList" /V "7" /T REG_SZ /D "site_settings" /F

    :: Chromium Clear Browsing History after certain time (Set on 1 Hour)
    :: (Make Sure to DISABLE SYNC)

    :: REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V "BrowsingDataLifetime" /T REG_SZ /D "{\"data_types\":[\"browsing_history\",\"download_history\",\"cookies_and_other_site_data\",\"cached_images_and_files\",\"autofill\",\"site_settings\",\"hosted_app_data\"],\"time_to_live_in_hours\":1}" /F

:: Disable Security Bypass
:: REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SafeBrowsingProtectionLevel /T REG_dWORD /D 1 /F

:: Disable Download Security Bypass
:: REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DownloadRestrictions /T REG_dWORD /D 4 /F

:: Block All Downloads
:: REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DownloadRestrictions /T REG_dWORD /D 3 /F

:: ----- Edge Chromium

:: Allow Microsoft Edge Chromium and Microsoft Edge Legacy to run at the same time
:: (Only Works if they are both installed - Default Already uninstalls both Microsoft Edge Chromium and Microsoft Edge Legacy)
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /V Allowsxs /T REG_dWORD /D 1 /F

:: Disable InPrivate Mode (Microsoft Edge Chromium)
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V InPrivateModeAvailability /T REG_dWORD /D 1 /F
:: 0 - User Choice, 1 - Force Disable, 2 - Force Enabled

:: ----- Firefox

:: Disable Private Browsing (Firefox)
:: REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisablePrivateBrowsing /T REG_dWORD /D 1 /F

:: Disable Firefox Accounts
:: REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxAccounts /T REG_dWORD /D 1 /F

:: Disable Firefox Security Bypass
:: REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DisableSecurityBypass" /V InvalidCertificate /T REG_dWORD /D 1 /F
:: REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DisableSecurityBypass" /V SafeBrowsing /T REG_dWORD /D 1 /F

:: ----- Windows 10

:: Alt-Tab Multitasking (non-forced option) (setup.bat main file uses forced option instead)
:: REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /V MultiTaskingAltTabFilter /T REG_dWORD /D 3 /F

:: Device Installation Metadata Retrieval Off (non-forced option) (setup.bat main file uses forced option instead)
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /V PreventDeviceMetadataFromNetwork /T REG_dWORD /D 1 /F

:: Force Hide Start Menu App List
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoStartMenuMoreprograms /T REG_dWORD /D 1 /F
:: REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoStartMenuMoreprograms /T REG_dWORD /D 1 /F

:: Force Show Start Menu App List
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoStartMenuMoreprograms /T REG_dWORD /D 2 /F
:: REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoStartMenuMoreprograms /T REG_dWORD /D 2 /F

:: Disable Modify Toolbar (Taskbar)
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V TaskbarNoAddRemoveToolbar /T REG_dWORD /D 1 /F
:: REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V TaskbarNoAddRemoveToolbar /T REG_dWORD /D 1 /F

:: Force Lock Toolbar (Taskbar)
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V LockTaskbar /T REG_dWORD /D 1 /F
:: REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V LockTaskbar /T REG_dWORD /D 1 /F

:: Date Time Format
:: HKCU\Control Panel\International
::      Control Panel - Date Time Formats

:: ----- Windows 10 Update

:: Enable Receive updates for other Microsoft Products when you update windows
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V AllowMUUpdateService /T REG_dWORD /D 1 /F

:: Do Not Include Drivers with Windows Update
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ExcludeWUDriversInQualityUpdate /T REG_dWORD /D 1 /F

:: --------------

:: Group Policy: First Login (Registry Equivalent already included):

::      Computer Configuration > Administrative Templates > System > Logon >> Show First Sign-In Animation: DISABLED

::      Computer Configuration > Administrative Templates > Windows Components > OOBE >> Don't launch privacy settings experience on user logon: ENABLED

:: Group Policy: Windows 10 Update

::      Computer Configuration > Administrative Templates > Windows Components > Windows Update

::      Computer Configuration > Administrative Templates > Windows Components > Windows Update > Windows Update for Business

:: ----------------------------------------------------------------------
