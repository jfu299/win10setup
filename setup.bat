@echo OFF

:: setup.bat
:: Custom Setup for Windows 10 (Windows 10 Version 20H2 - OS Build 19042)
:: 		https://github.com/jfu299/win10setup
:: 		https://raw.githubusercontent.com/jfu299/win10setup/main/setup.bat
:: By: Justin Fu
:: Updated: December 28, 2020

echo.
echo -------
echo Custom Setup for Windows 10 (Windows 10 Version 20H2 - OS Build 19042)
echo 	https://github.com/jfu299/win10setup
echo 	https://raw.githubusercontent.com/jfu299/win10setup/main/setup.bat
echo By: Justin Fu
echo Updated: December 28, 2020
echo -------
echo MAKE SURE YOU READ THIS BATCH FILE BEFORE YOU RUN IT - THIS BATCH FILE WILL CHANGE MANY SETTINGS
echo.
echo RUN THIS BATCH FILE AS ADMINISTRATOR
echo -------
PAUSE

:: --------------

:mainMenu
echo -------
echo Select a task:
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

:: Ctrl-Alt-Del Requirement on Login
:: Ctrl-Alt-Del Requirement on UAC
:: Ability to change password on Ctrl-Alt-Del Screen

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
:: Target Release Version (Version 20H2)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D "20H2" /F
:: Defer Updates (Windows Update for Business)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdatesPeriodInDays /T REG_dWORD /D 365 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdatesPeriodInDays /T REG_dWORD /D 30 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuilds /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuildsPolicyValue /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableWUfBSafeguards /T REG_dWORD /D 0 /F
:: Disable Wake Timers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AUPowerManagement /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance" /V WakeUp /T REG_dWORD /D 0 /F
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
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
:: Target Release Version (Version 20H2)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D "20H2" /F
:: Defer Updates (Windows Update for Business)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdatesPeriodInDays /T REG_dWORD /D 365 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdatesPeriodInDays /T REG_dWORD /D 30 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuilds /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuildsPolicyValue /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableWUfBSafeguards /T REG_dWORD /D 0 /F
:: Disable Wake Timers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AUPowerManagement /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance" /V WakeUp /T REG_dWORD /D 0 /F
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
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

:: Extensions
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
:: Extension Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"mnjggcdmjocbbbhaepdhchncahnbgone\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
:: Import Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: Disable Notifications and Location
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DnsOverHttpsMode /T REG_SZ /D off /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: Disable Automatic Google Account Browser Signin
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BrowserSignin /T REG_dWORD /D 0 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutoplayAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V HideWebStoreIcon /T REG_dWORD /D 1 /F

:: -----------------
:: Chromium
:: -----------------

:: Extensions
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
:: Extension Settings
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"mnjggcdmjocbbbhaepdhchncahnbgone\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
:: Import Settings
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: Disable Notifications and Location
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DnsOverHttpsMode /T REG_SZ /D off /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: Disable Automatic Google Account Browser Signin
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BrowserSignin /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SyncDisabled /T REG_dWORD /D 1 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ChromeCleanupEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutoplayAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V HideWebStoreIcon /T REG_dWORD /D 1 /F

:: -----------------
:: Firefox
:: -----------------

:: Extension Settings and force-install
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"},\"{da6554a8-470c-4d6a-a6ca-904740683552}\":{\"installation_mode\":\"blocked\"}}" /F
:: Disable Notfications and Location
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V Locked /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V Locked /T REG_dWORD /D 1 /F
:: Default Permissions
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /V "Default" /T REG_SZ /D "block-audio-video" /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions" /V DisableDeveloperTools /T REG_dWORD /D 0 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS" /V Locked /T REG_dWORD /D 1 /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Proxy" /V Mode /T REG_SZ /D none /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Proxy" /V Locked /T REG_dWORD /D 1 /F
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DontCheckDefaultBrowser /T REG_dWORD /D 1 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin" /V Default /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin" /V Locked /T REG_dWORD /D 1 /F
:: Disable Pocket and Clean Home Page
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisablePocket /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Search /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V TopSites /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Highlights /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Pocket /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Snippets /T REG_dWORD /D 0 /F
:: About Config Settings
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V Preferences /T REG_SZ /D "{\"browser.search.suggest.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.search.suggest.enabled.private\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.bookmark\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.history\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.openpage\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.searches\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.topsites\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.update1.searchTips\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.update1.interventions\":{\"Value\":false,\"Status\":\"locked\"},\"browser.aboutConfig.showWarning\":{\"Value\":false,\"Status\":\"default\"},\"browser.tabs.warnOnClose\":{\"Value\":false,\"Status\":\"default\"},\"browser.tabs.warnOnCloseOtherTabs\":{\"Value\":false,\"Status\":\"default\"},\"browser.urlbar.trimURLs\":{\"Value\":false,\"Status\":\"locked\"},\"browser.disableResetPrompt\":{\"Value\":true,\"Status\":\"default\"},\"browser.newtabpage.activity-stream.section.highlights.includeBookmarks\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeDownloads\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includePocket\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeVisited\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.showSponsored\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.showSponsoredTopSites\":{\"Value\":false,\"Status\":\"locked\"},\"browser.tabs.crashReporting.sendReport\":{\"Value\":false,\"Status\":\"locked\"},\"geo.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"geo.provider.ms-windows-location\":{\"Value\":false,\"Status\":\"locked\"},\"security.insecure_connection_text.enabled\":{\"Value\":true,\"Status\":\"locked\"},\"security.insecure_connection_text.pbmode.enabled\":{\"Value\":true,\"Status\":\"locked\"},\"accessibility.force_disabled\":{\"Value\":1,\"Status\":\"locked\"},\"dom.battery.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"network.http.sendRefererHeader\":{\"Value\":0,\"Status\":\"default\"},\"media.videocontrols.picture-in-picture.keyboard-controls.enabled\":{\"Value\":true,\"Status\":\"default\"},\"browser.formfill.enable\":{\"Value\":false,\"Status\":\"default\"},\"network.dns.disablePrefetch\":{\"Value\":true,\"Status\":\"locked\"},\"network.dns.disablePrefetchFromHTTPS\":{\"Value\":true,\"Status\":\"locked\"},\"network.prefetch-next\":{\"Value\":false,\"Status\":\"locked\"},\"network.predictor.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"network.predictor.enable-prefetch\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.speculativeConnect.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.send_pings\":{\"Value\":false,\"Status\":\"locked\"},\"media.eme.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.gmp-widevinecdm.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.navigator.enabled\":{\"Value\":false,\"Status\":\"default\"},\"browser.newtabpage.activity-stream.feeds.telemetrybrowser.newtabpage.activity-stream.telemetry\":{\"Value\":false,\"Status\":\"locked\"},\"browser.pingcentre.telemetry\":{\"Value\":false,\"Status\":\"locked\"},\"media.wmf.deblacklisting-for-telemetry-in-gpu-process\":{\"Value\":false,\"Status\":\"locked\"},\"extensions.htmlaboutaddons.recommendations.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons\":{\"Value\":false,\"Status\":\"locked\"},\"browser.messaging-system.whatsNewPanel.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.feeds.section.topstories\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.feeds.snippets\":{\"Value\":false,\"Status\":\"locked\"},\"browser.ctrlTab.recentlyUsedOrder\":{\"Value\":false,\"Status\":\"default\"},\"browser.crashReports.unsubmittedCheck.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.crashReports.unsubmittedCheck.autoSubmit2\":{\"Value\":false,\"Status\":\"locked\"},\"print.always_print_silent\":{\"Value\":false,\"Status\":\"locked\"},\"print.tab_modal.enabled\":{\"Value\":true,\"Status\":\"default\"},\"media.hardwaremediakeys.enabled\":{\"Value\":false,\"Status\":\"default\"},\"accessibility.blockautorefresh\":{\"Value\":false,\"Status\":\"locked\"},\"extensions.formautofill.creditCards.enabled\":{\"Value\":false,\"Status\":\"default\"},\"extensions.formautofill.addresses.enabled\":{\"Value\":false,\"Status\":\"default\"},\"ui.key.menuAccessKeyFocuses\":{\"Value\":false,\"Status\":\"locked\"}}" /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Cookies" /V AcceptThirdParty /T REG_SZ /D never /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxStudies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSetDesktopBackground /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableTelemetry /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V BlockAboutSupport /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFeedbackCommands /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverrideFirstRunPage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverridePostUpdatePage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V NoDefaultBookmarks /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisplayBookmarksToolbar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V "DisplayMenuBar" /T REG_SZ /D "default-off" /F
REG DELETE "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /F

:: -----------------
:: Brave
:: -----------------

:: Extensions
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
:: Extension Settings
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"mnjggcdmjocbbbhaepdhchncahnbgone\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
:: Import Settings
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: Disable Notifications and Location
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DnsOverHttpsMode /T REG_SZ /D off /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Brave Tor
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V TorDisabled /T REG_dWORD /D 1 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutoplayAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F

:: -----------------
:: Microsoft Edge Chromium
:: -----------------

:: Disable Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F
:: Extensions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D odfafepnkmbhccpbejgmiehpchacaeak /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mbmgnelfcpoecdepckhlhegpcehmpmji /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D mdkdmaickkfdekbjdoojfalpbkgaddei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 1 /T REG_SZ /D odfafepnkmbhccpbejgmiehpchacaeak;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mbmgnelfcpoecdepckhlhegpcehmpmji;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 3 /T REG_SZ /D mdkdmaickkfdekbjdoojfalpbkgaddei;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
:: Extension Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"odfafepnkmbhccpbejgmiehpchacaeak\": {},\"mbmgnelfcpoecdepckhlhegpcehmpmji\": {},\"mdkdmaickkfdekbjdoojfalpbkgaddei\": {}}" /F
:: Import Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AutoImportAtFirstRun /T REG_dWORD /D 4 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /V CreateDesktopShortcutDefault /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V HideFirstRunExperience /T REG_dWORD /D 1 /F
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
:: Disable Notifications and Location
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DnsOverHttpsMode /T REG_SZ /D off /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Disable ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AllowSurfGame /T REG_dWORD /D 1 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AddressBarMicrosoftSearchInBingProviderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AlternateErrorPagesEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V LocalProvidersEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PersonalizationReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ResolveNavigationErrorsUseWebService /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageHideDefaultTopSites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPagePrerenderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageAllowedBackgroundTypes /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DiagnosticData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EdgeCollectionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EdgeShoppingAssistantEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\CollectionsServicesAndExportsBlockList" /V 1 /T REG_SZ /D pinterest_suggestions /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V NewTabPagePrerenderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageHideDefaultTopSites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AllowWebContentOnNewTabPage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SpotlightExperiencesAndRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPagePrerenderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PersonalizationReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageSearchBox /T REG_SZ /D redirect /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V HideInternetExplorerRedirectUXForIncompatibleSitesEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ShowMicrosoftRewards /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V familySafetySettingsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutoplayAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F

:: -----------------
:: Microsoft Edge Legacy
:: -----------------

:: First Run
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AllowPrelaunch /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V AllowTabPreloading /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V PreventTabPreloading /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventFirstRunPage /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V SyncFavoritesBetweenIEAndMicrosoftEdge /T REG_dWORD /D 0 /F
:: Sync
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSyn /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableWebBrowserSettingSyncUserOverride /T REG_dWORD /D 2 /F
:: Browsing History
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\KioskMode" /V ConfigureKioskMode /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AllowSavingHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Privacy" /V ClearBrowsingHistoryOnExit /T REG_dWORD /D 1 /F
:: Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" /V FlashPlayerEnabled /T REG_dWORD /D 0 /F
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI" /V ShowOneBox /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI" /V AllowWebContentOnNewTabPage /T REG_dWORD /D 0 /F
:: Default Browser Prompt
REG ADD "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
:: Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V "Use FormSuggest" /T REG_SZ /D no /F
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V EnableExtendedBooksTelemetry /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventLiveTileDataCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V MicrosoftEdgeDataOptIn /T REG_dWORD /D 0 /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V AllowConfigurationUpdateForBooksLibrary /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V UseSharedFolderForBooks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Internet Settings" /V ConfigureHomeButton /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AlwaysEnableBooksLibrary /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventAccessToAboutFlagsInMicrosoftEdge /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /V PreventOverride /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /V PreventOverrideAppRepUnknown /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V Cookies /T REG_dWORD /D 1 /F

:: -----------------
:: Internet Explorer
:: -----------------

:: First Run
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V DisableImportExportFavorites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V DisableFirstRunCustomize /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /V ShowMessageWhenOpeningSitesInMicrosoftEdge /T REG_dWORD /D 0 /F
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
:: Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V DisableFlashInIE /T REG_dWORD /D 1 /F
:: Start Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\ContinuousBrowsing" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKU\Default\Software\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKU\Default\Software\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Recovery" /V NoReopenLastSession /T REG_dWORD /D 1 /F
:: Default Browser Prompt
REG ADD "HKLM\Default\Software\Microsoft\Internet Explorer\Main" /V "Check_Associations" /T REG_SZ /D "no" /F
REG ADD "HKCU\Default\Software\Microsoft\Internet Explorer\Main" /V "Check_Associations" /T REG_SZ /D "no" /F
:: Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpItemSendFeedback /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpItemSendFeedback /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V ShowContentAdvisor /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\DomainSuggestion" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpMenu /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /V DisableCustomerImprovementProgram /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V DisplayQuickPick /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V TopResult /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V HideNewEdgeButton /T REG_dWORD /D 0 /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Geolocation" /V PolicyDisableGeolocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /V NoSearchBox /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /V NoSplash /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V EnableAutoUpgrade /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V AllowWindowReuse /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V NoReportSiteProblems /T REG_SZ /D yes /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /V RestrictIE /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\FormatDetection" /V PhoneNumberEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\WindowsSearch" /V EnabledScopes /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V PreventOverride /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V PreventOverrideAppRepUnknown /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V Enabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V RestrictPopupExceptionList /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" /V DisableLogging /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V DisableFixSecuritySettings /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V DisableSecuritySettingsCheck /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing" /V NewTabPageShow /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing" /V PopupsUseNewWindow /T REG_dWORD /D 2 /F

:: -----------------
:: Block Bad Extensions/Addons (Chrome, Chromium, Firefox, and Edge Chromium)
:: -----------------
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
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
:: Chromium
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
:: Firefox
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"blocked\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"}}" /F
:: Brave
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
:: Microsoft Edge Chromium
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
:: Microsoft Edge Legacy
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /T REG_dWORD /D 0 /F
:: Internet Explorer
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /T REG_dWORD /D 1 /F

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
REG DELETE "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKLM\SOFTWARE\Policies\Google\Chrome" /V BlockExternalExtensions /F
:: Chromium
REG DELETE "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKLM\SOFTWARE\Policies\Chromium" /V BlockExternalExtensions /F
:: Firefox
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"}}" /F
:: Brave
REG DELETE "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V BlockExternalExtensions /F
:: Microsoft Edge Chromium
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BlockExternalExtensions /F
:: Microsoft Edge Legacy
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /F
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /F
:: Internet Explorer
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /F
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /F
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /F

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

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option4.2redo

:: --------------

:option4.1Start
@echo ON

:: Uninstall and Disable OneDrive

%SystemRoot%\System32\OneDriveSetup.exe /uninstall
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall

REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /V System.IsPinnedToNameSpaceTree /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSyncNGSC /T REG_dWORD /D 1 /F

takeown /f "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /a /r /d y
icacls "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /inheritance:r
icacls "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /grant administrators:F /t /q
icacls "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /deny everyone:F /t /q

takeown /f "%SystemRoot%\System32\OneDriveSetup.exe" /a /r /d y
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /inheritance:r
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /grant administrators:F /t /q
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /deny everyone:F /t /q

rd /s /q "%UserProfile%\AppData\Local\Microsoft\OneDrive"
rd /s /q "%ProgramData%\Microsoft OneDrive"
rd /s /q "%UserProfile%\OneDrive"

@echo OFF
goto option4

:: --------------

:option4.2Start
@echo ON

:: Enable OneDrive

:: When enabling OneDrive, you will need to manually re-install OneDrive

REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /V System.IsPinnedToNameSpaceTree /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSyncNGSC /T REG_dWORD /D 0 /F

takeown /f "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /a /r /d y
icacls "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /grant administrators:F /t /q
icacls "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /inheritance:e
icacls "%SystemRoot%\SysWOW6\OneDriveSetup.exe" /reset /t /q

takeown /f "%SystemRoot%\System32\OneDriveSetup.exe" /a /r /d y
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /grant administrators:F /t /q
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /inheritance:e
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /reset /t /q

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
echo Windows 10 will view it as ms-resource:AppName, and move it to the bottom of the app list
echo.
echo To fully remove Microsoft Edge Chromium from the Control Panel List, taking over and deleting registry keys is required
echo This only removes the pre-installed Microsoft Edge Chromium
echo.
echo ----------------------------
echo.
echo Select a task:
echo.
echo 1) (Already Included in Main) Remove Microsoft Edge Chromium and Microsoft Edge Legacy
echo.
echo 2) Remove Microsoft Edge Chromium only
echo.
echo 3) Remove Microsoft Edge Legacy only
echo.
echo 4) Return
echo.
echo 5) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option5.1
if "%op%"=="2" goto option5.2
if "%op%"=="3" goto option5.3
if "%op%"=="4" goto option5.4

if "%op%"=="5" goto mainMenu
if "%op%"=="6" goto end
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
echo This only removes the pre-installed Microsoft Edge Chromium
echo 	Please Check the Version Number of Microsoft Edge Chromium that is installed, otherwise this batch script will not work properly
echo.
echo Go To (x64 OS): %ProgramFiles(x86)%\Microsoft\Edge\Application
echo Go To (x86 OS): %ProgramFiles%\Microsoft\Edge\Application
echo.
echo 	This batch script uses Edge Version: 84.0.522.52
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
echo To fully remove Microsoft Edge Chromium from the Control Panel List, taking over and deleting registry keys is required
echo.
echo Microsoft Edge Chromium Registry Keys:
echo	Take over control and delete these registry keys
echo.
echo	HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
echo.
echo	HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
echo.
echo This only removes the pre-installed Microsoft Edge Chromium
echo 	Please Check the Version Number of Microsoft Edge Chromium that is installed, otherwise this batch script will not work properly
echo.
echo Go To (x64 OS): %ProgramFiles(x86)%\Microsoft\Edge\Application
echo Go To (x86 OS): %ProgramFiles%\Microsoft\Edge\Application
echo.
echo 	This batch script uses Edge Version: 84.0.522.52
echo.
echo ----------------------------

set /p op="Remove Microsoft Edge Chromium Only? (y/n) "
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

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option5.2redo

:: --------------

:option5.3
echo.
echo -------
echo.

:option5.3redo

echo ------- IMPORTANT ----------
echo.
echo The Start Menu Icon for Microsoft Edge Legacy cannot be removed, 
echo Windows 10 will view it as ms-resource:AppName, and move it to the bottom of the app list
echo.
echo ----------------------------

set /p op="Remove Microsoft Edge Legacy Only? (y/n) "
if "%op%"=="y" goto option5.3Start
if "%op%"=="yes" goto option5.3Start
if "%op%"=="Yes" goto option5.3Start
if "%op%"=="Y" goto option5.3Start
if "%op%"=="YES" goto option5.3Start

if "%op%"=="n" goto option5
if "%op%"=="no" goto option5
if "%op%"=="No" goto option5
if "%op%"=="N" goto option5
if "%op%"=="NO" goto option5

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto option5.3redo

:: --------------
:option5.1Start
@echo ON
:: Remove Microsoft Edge Chromium and Microsoft Edge Legacy

:: Microsoft Edge Chromium

:: Disable Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F

:: Uninstall
%ProgramFiles(x86)%\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%ProgramFiles%\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

rd /s /q "%SystemDrive%\Program Files (x86)\Microsoft\Edge"
rd /s /q "%SystemDrive%\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "%SystemDrive%\Program Files\Microsoft\Edge"
rd /s /q "%SystemDrive%\Program Files\Microsoft\EdgeUpdate"
rd /s /q "%UserProfile%\Local\Microsoft\Edge"

:: Microsoft Edge Legacy
takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" && md "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /deny everyone:F /t /q

takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" && md "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /deny everyone:F /t /q

rd /s /q "%UserProfile%\Local\MicrosoftEdge"
rd /s /q "%UserProfile%\MicrosoftEdgeBackups"


@echo OFF
goto option5

:: --------------
:option5.2Start
@echo ON
:: Remove Microsoft Edge Chromium Only

:: Disable Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F

:: Uninstall
%ProgramFiles(x86)%\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%ProgramFiles%\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

rd /s /q "%SystemDrive%\Program Files (x86)\Microsoft\Edge"
rd /s /q "%SystemDrive%\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "%SystemDrive%\Program Files\Microsoft\Edge"
rd /s /q "%SystemDrive%\Program Files\Microsoft\EdgeUpdate"
rd /s /q "%UserProfile%\Local\Microsoft\Edge"

@echo OFF
goto option5
:: --------------
:option5.3Start
@echo ON
:: Remove Microsoft Edge Legacy Only

takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" && md "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /deny everyone:F /t /q

takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" && md "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /deny everyone:F /t /q

rd /s /q "%UserProfile%\Local\MicrosoftEdge"
rd /s /q "%UserProfile%\MicrosoftEdgeBackups"

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
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableChangePassword /T REG_dWORD /D 1 /F

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
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableChangePassword /T REG_dWORD /D 0 /F


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
:: if "%op%"=="3" goto option8.3

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
REG ADD "HKCU\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Chromium
REG ADD "HKCU\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Firefox
REG ADD "HKCU\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"blocked\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"}}" /F

:: Brave
REG ADD "HKCU\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Microsoft Edge Chromium
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F

:: Microsoft Edge Legacy
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /T REG_dWORD /D 0 /F

:: Internet Explorer
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /T REG_SZ /D no /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /T REG_dWORD /D 1 /F

:: ---
:: Block Settings and Control Panel
:: ---
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoControlPanel /T REG_dWORD /D 1 /F

:: ---
:: Block Run
:: ---
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRun /T REG_dWORD /D 1 /F

:: ---
:: Block Powershell and Registry
:: ---

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun /T REG_dWORD /D 1 /F

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 1 /T REG_SZ /D "powershell.exe" /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 2 /T REG_SZ /D "powershell_ise.exe" /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 3 /T REG_SZ /D "regedit.exe" /F

:: ---
:: Block Command Prompt
:: ---
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\System" /V DisableCMD /T REG_dWORD /D 1 /F

:: ---

@echo OFF
goto end

:: --------------

:option8.2Start
@echo ON



@echo OFF
goto option8

:: --------------

:option8.3Start
@echo ON

:: ---
:: Undo Restrict Extension/Addon Install
:: ---

:: Chrome
REG DELETE "HKCU\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /F

:: Chromium
REG DELETE "HKCU\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /F

:: Firefox
REG DELETE "HKCU\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /F

:: Brave
REG DELETE "HKCU\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist" /V 1 /F

:: Microsoft Edge Chromium
REG DELETE "HKCU\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /F

:: Microsoft Edge Legacy
REG DELETE "HKCU\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /F
REG DELETE "HKCU\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /F

:: Internet Explorer
REG DELETE "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /F
REG DELETE "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /F
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /F

:: ---
:: Undo Block Settings and Control Panel
:: ---
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoControlPanel /F



:: ---
:: Undo Block Run
:: ---
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRun /F

:: ---
:: Undo Block Powershell and Registry
:: ---

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun /T REG_dWORD /D 0 /F

REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 1 /F
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 2 /F
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /V 3 /T /F

REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /F
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun /F

:: ---
:: Undo Block Command Prompt
:: ---
REG DELETE "HKCU\SOFTWARE\Policies\Microsoft\Windows\System" /V DisableCMD /F

:: ---

@echo OFF
goto option8
:: ------------------------------------------------------------------------------------


:: ------------------------------------------------------------------------------------

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
echo HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc
echo.
echo HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack
echo.
echo HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
echo.
echo HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
echo.
PAUSE
echo -------
echo This also sets some Windows 10 Updates policies, sets up policies on major web browsers,
echo hides user accounts on a non-admin User Account Control prompt, uninstall and disable OneDrive,
echo remove the pre-installed Microsoft Edge Chromium and Microsoft Edge Legacy,
echo and removes/disables various Windows 10 annoyances.
echo To stop or disable the Windows Update service (wuauserv), use the other options.
echo To fully disable the Windows Update Medic Service (WaaSMedicSvc), 
echo (HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc) you must take over its registry key and deny full access to everyone
echo.
PAUSE
echo -------
:mainFileredo
echo MAKE SURE YOU READ THIS BATCH FILE BEFORE YOU RUN IT - THIS BATCH FILE WILL CHANGE MANY SETTINGS
echo.
echo RUN THIS BATCH FILE AS ADMINISTRATOR
echo -------
echo.
set /p op="RUN THIS BATCH FILE (Main File): (y/n) "
if "%op%"=="y" goto mainFileStart
if "%op%"=="yes" goto mainFileStart
if "%op%"=="Yes" goto mainFileStart
if "%op%"=="Y" goto mainFileStart
if "%op%"=="YES" goto mainFileStart

if "%op%"=="n" goto deny
if "%op%"=="no" goto deny
if "%op%"=="No" goto deny
if "%op%"=="N" goto deny
if "%op%"=="NO" goto deny

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
echo.
goto mainFileredo

:: --------------

:mainFileStart

echo.
echo Please wait for this batch file to finish
echo.

@echo ON

:: -------
:: Stop WaaSMedicSvc and DiagTrack
:: -------
net stop WaaSMedicSvc
net stop DiagTrack

:: -------
:: Uninstall Microsoft Edge Chromium
:: -------

%ProgramFiles(x86)%\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
%ProgramFiles%\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

:: -------
:: Uninstall OneDrive
:: -------

%SystemRoot%\System32\OneDriveSetup.exe /uninstall
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall


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
REG ADD "HKCU\SOFTWARE\Classes\.jpg" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\SOFTWARE\Classes\.jpeg" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\SOFTWARE\Classes\.gif" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\SOFTWARE\Classes\.png" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\SOFTWARE\Classes\.bmp" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\SOFTWARE\Classes\.tiff" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
REG ADD "HKCU\SOFTWARE\Classes\.ico" /T REG_SZ /D "PhotoViewer.FileAssoc.Tiff" /F
:: --
REG ADD "HKCR\Applications\photoviewer.dll\shell\open" /V "MuiVerb" /T REG_SZ /D "@photoviewer.dll,-3043" /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\open\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3056" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap\DefaultIcon" /T REG_SZ /D "%SystemRoot%\\System32\\imageres.dll,-70" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap\shell\open\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Bitmap\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\print" /V "NeverDefault" /T REG_SZ /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\print\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\Applications\photoviewer.dll\shell\print\DropTarget" /V "Clsid" /T REG_SZ /D "{60fd46de-f830-4894-a628-6fa81bc0190d}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF" /V EditFlags /T REG_dWORD /D 10000 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3055" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF\DefaultIcon" /T REG_SZ /D "%SystemRoot%\\System32\\imageres.dll,-72" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open" /V "MuiVerb" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg" /V EditFlags /T REG_dWORD /D 10000 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3055" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg\DefaultIcon" /T REG_SZ /D "%SystemRoot%\\System32\\imageres.dll,-72" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open" /V "MuiVerb" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3057" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif\DefaultIcon" /T REG_SZ /D "%SystemRoot%\\System32\\imageres.dll,-83" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif\shell\open\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Gif\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png" /V ImageOptionFlags /T REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png" /V "FriendlyTypeName" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3057" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png\DefaultIcon" /T REG_SZ /D "%SystemRoot%\\System32\\imageres.dll,-71" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png\shell\open\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Png\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp" /V EditFlags /T REG_REG_dWORD /D 10000 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp" /V ImageOptionFlags /T REG_REG_dWORD /D 1 /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp\DefaultIcon" /T REG_SZ /D "%SystemRoot%\\System32\\wmphoto.dll,-400" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open" /V "MuiVerb" /T REG_SZ /D "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
REG ADD "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open\DropTarget" /V "Clsid" /T REG_SZ /D "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /F
:: --
REG ADD "HKCR\SystemFileAssociations\image\shell\Image Preview\command" /T REG_SZ /D "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1" /F
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
:: Windows 10 Updates Partial Control (Windows Update Not Disabled)
:: -------
:: Target Release Version (Version 20H2)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D "20H2" /F
:: Defer Updates (Windows Update for Business)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferFeatureUpdatesPeriodInDays /T REG_dWORD /D 365 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdates /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DeferQualityUpdatesPeriodInDays /T REG_dWORD /D 30 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuilds /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V ManagePreviewBuildsPolicyValue /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V DisableWUfBSafeguards /T REG_dWORD /D 0 /F
:: Disable Wake Timers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V AUPowerManagement /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance" /V WakeUp /T REG_dWORD /D 0 /F
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
:: Disable Delivery Optimization
:: HEX: 64 DECIMAL: 100
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /V DODownloadMode /T REG_dWORD /D 100 /F
:: Pause Updates Indefinitely
:: HEX: 96520 DECIMAL: 615712
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V FlightSettingsMaxPauseDays /T REG_dWORD /D 615712 /F
:: Disable Microsoft Edge Chromium Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F
:: Disable Windows Update Medic Service
:: Moved to Top of Main File
:: net stop WaaSMedicSvc
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
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /V TailoredExperiencesWithDiagnosticDataEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableTailoredExperiencesWithDiagnosticData /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V DisableEnterpriseAuthproxy /T REG_dWORD /D 1 /F
:: Connected User Experiences and Telemetry Service (DiagTrack)
:: Moved to Top of Main File
:: net stop DiagTrack
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /V ObjectName /T REG_SZ /D Administrators /F
:: Windows 10 Send Feedback
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V DoNotShowFeedbackNotifications /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V DisableDiagnosticDataViewer /T REG_dWORD /D 1 /F
:: Windows Defender Automatic Sample Submission
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /V SubmitSamplesConsent /T REG_dWORD /D 2 /F
:: Windows Error Reporting
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V Disabled /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V Disabled /T REG_dWORD /D 1 /F
:: -------
:: Disable Inking and Typing
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V DisablePersonalization /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /V AllowWindowsInkWorkspace /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V AllowInputPersonalization /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /V AllowLinguisticDataCollection /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Input\TIPC" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace" /V PenWorkspaceButtonDesiredVisibility /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /V HarvestContacts /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /V AcceptedPrivacyPolicy /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Input\Settings" /V InsightsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Input\TIPC" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /V PreventhandwritingDataSharing /T REG_dWORD /D 1 /F
:: -------
:: Windows Privacy Settings
:: -------
:: Disable Advertising Id
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /V DisabledByGroupPolicy /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /V Enabled /T REG_dWORD /D 0 /F
:: Turn Off Language List website access
REG ADD "HKCU\Control Panel\International\User Profile" /V HttpAcceptLanguageOptOut /T REG_dWORD /D 1 /F
:: Turn off App Launch Tracking
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Start_TrackProgs /T REG_dWORD /D 0 /F
:: Disable Location Services
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /V DisableLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /V DisableLocationScripting /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /V DisableSensors /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessLocation /T REG_dWORD /D 2 /F
:: Find My Device Location
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\FindMyDevice" /V AllowFindMyDevice /T REG_dWORD /D 0 /F
:: Restrict Camera
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessCamera /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessCamera_ForceDenyTheseApps /T REG_MULTI_SZ /D Microsoft.MicrosoftEdge_8wekyb3d8bbwe\0Microsoft.Win32WebViewHost_cw5n1h2txyewy\0Microsoft.Windows.Cortana_cw5n1h2txyewy\0Microsoft.WindowsStore_8wekyb3d8bbwe\0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessCamera_UserInControlOfTheseApps /T REG_MULTI_SZ /D NonPackaged\0 /F
:: Restrict Microphone
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessMicrophone /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsActivateWithVoice /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsActivateWithVoiceAboveLock /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /V LetAppsAccessMicrophone_UserInControlOfTheseApps /T REG_MULTI_SZ /D NonPackaged\0Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\0 /F
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
:: -------
:: Disable Microsoft Annoyances
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableSoftLanding /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsConsumerFeatures /T REG_dWORD /D 1 /F
:: Microsoft Store Apps
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V ContentDeliveryAllowed /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V OemPreInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V PreInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V PreInstalledAppsEverEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SilentInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SilentInstalledAppsEverEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SoftLandingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SystemPaneSuggestionsEnabled /T REG_dWORD /D 0 /F
:: SubscribedContent Suggestions
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338387Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338388Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338389Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338393Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353694Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353696Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353698Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-310093Enabled /T REG_dWORD /D 0 /F
:: File Explorer Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchhistory /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchhistory /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V "Append Completion" /T REG_SZ /D no /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V "Append Completion" /T REG_SZ /D no /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V AutoSuggest /T REG_SZ /D no /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V AutoSuggest /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V "Append Completion" /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V "Append Completion" /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V AutoSuggest /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V AutoSuggest /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowInfoTip /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowSyncProviderNotifications /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowInfoTip /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowSyncProviderNotifications /T REG_dWORD /D 0 /F
:: Settings Tips
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V AllowOnlineTips /T REG_dWORD /D 0 /F
:: Keyboard
REG ADD "HKCU\SOFTWARE\Microsoft\Input\Settings" /V EnableHwkbTextPrediction /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Control Panel\International" /V TurnOffOfferTextPredictions /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Control Panel\International" /V TurnOffInsertSpace /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Control Panel\International" /V TurnOffAutocorrectMisspelledWords /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\policies\microsoft\TabletTip\1.7" /V Disableprediction /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\policies\microsoft\TabletTip\1.7" /V EnableTextPrediction /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Input\Settings" /V MultilingualEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /V EnableDoubleTapSpace /T REG_dWORD /D 0 /F
:: Windows Spotlight
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableThirdPartySuggestions /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnactioncenter /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnSettings /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableThirdPartySuggestions /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnactioncenter /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnSettings /T REG_dWORD /D 1 /F
:: Live Tiles
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /V NoTileApplicationNotification /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V ClearTilesOnExit /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V ClearTilesOnExit /T REG_dWORD /D 1 /F
:: Windows People Bar
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V HidePeopleBar /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /V PeopleBand /T REG_dWORD /D 0 /F
:: Storage Sense
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /V AllowStorageSenseGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /V ConfigStorageSenseDownloadsCleanupThreshold /T REG_dWORD /D 0 /F
:: Project to PC
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Connect" /V AllowProjectionToPC /T REG_dWORD /D 0 /F
:: Shared Experiences
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V EnableCdp /T REG_dWORD /D 0 /F
:: Offline Maps App
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /V AllowUntriggeredNetworkTrafficOnSettingsPage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /V AutoDownloadAndUpdateMapData /T REG_dWORD /D 0 /
:: Disable Microsoft Skype Meet Now
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V HideSCAMeetNow /T REG_dWORD /D 1 /F
:: Other
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /V ScoobeSystemSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /V ScoobeSystemSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V NoBalloonFeatureAdvertisements /T REG_dWORD /D 1 /F
:: Disable Java sponsor offers
:: It is not recommeded to use Java
REG ADD "HKLM\SOFTWARE\JavaSoft" /V SPONSORS /T REG_SZ /D DISABLE /F
REG ADD "HKLM\SOFTWARE\Wow6432Node\JavaSoft" /V SPONSORS /T REG_SZ /D DISABLE /F
:: Settings Page Visibility
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V SettingsPageVisibility /T REG_SZ /D "hide:workplace;mobile-devices;emailandaccounts;sync;windowsinsider-optin;delivery-optimization;findmydevice;network-mobilehotspot;maps-downloadmaps;maps;mobile-devices-addphone;mobile-devices-addphone-direct" /F
:: Alt-Tab Multitasking
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V multitaskingAltTabFilter /T REG_dWORD /D 4 /F

:: -------
:: Windows Login Experience
:: -------
:: Auto login after Updates
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\S-1-5-21-4053955510-1485632959-3974344530-1001" /V OptOut /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableAutomaticRestartSignOn /T REG_dWORD /D 1 /F
:: Login Animation
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V EnableFirstLogonAnimation /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V EnableFirstLogonAnimation /T REG_dWORD /D 0 /F
:: Welcome Experience
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightWindowswelcomeExperience /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /V DisablePrivacyExperience /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\OOBE" /V DisablePrivacyExperience /T REG_dWORD /D 1 /F
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
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /V BingSearchEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowCortanaButton /T REG_dWORD /D 0 /F
:: Search History
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRecentDocsHistory /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRecentDocsHistory /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ClearRecentDocsOnExit /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ClearRecentDocsOnExit /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ClearRecentProgForNewUserInStartMenu /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /V IsAADCloudSearchEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /V IsDeviceSearchHistoryEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /V IsMSACloudSearchEnabled /T REG_dWORD /D 0 /F
:: Recently Added Apps
REG ADD " HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V HideRecentlyAddedApps /T REG_dWORD /D 1 /F
:: Activity History
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V UploadUserActivities /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V PublishUserActivities /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V EnableActivityFeed /T REG_dWORD /D 0 /F
:: Advanced Clipboard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V AllowClipboardHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V AllowCrossDeviceClipboard /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Start_TrackDocs /T REG_dWORD /D 0 /F
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
:: Disable Sign in to Workplace
REG ADD "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowWorkplace" /V value /T REG_dWORD /D 0 /F
:: Windows Defender
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection" /V UILockdown /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options" /V UILockdown /T REG_dWORD /D 1 /F
:: Hide Password Reveal
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\CredUI" /V DisablePasswordReveal /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CredUI" /V DisablePasswordReveal /T REG_dWORD /D 1 /F
:: Picture Password
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V BlockDomainPicturePassword /T REG_dWORD /D 1 /F
:: Security Questions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V NoLocalPasswordResetQuestions /T REG_dWORD /D 1 /F
:: Network Selection on Lock Screen
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V DontDisplayNetworkSelectionUI /T REG_dWORD /D 1 /F
:: UAC Hide User Accounts
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnumerateAdministrators /T REG_dWORD /D 0 /F

:: -------
:: Action Center and Notifications
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableNotificationcenter /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableNotificationcenter /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /V ToastEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_GLEAM_ENABLED /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_BADGE_ENABLED /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_TOASTS_ENABLED /T REG_dWORD /D 0 /F
:: -------
:: Desktop
:: -------
:: Disable Auto Preview Desktop
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DisablePreviewDesktop /T REG_dWORD /D 1 /F
:: Disable Aero Shake
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DisallowShaking /T REG_dWORD /D 1 /F
:: Command Prompt on Win X Shortcut
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DontUsePowerShellOnWinX /T REG_dWORD /D 1 /F
:: -------
:: Start Menu
:: -------
:: Quick Uninstall Apps
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V NoUninstallFromStart /T REG_dWORD /D 1 /F
:: Taskbar Badges
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarBadges /T REG_dWORD /D 0 /F
:: Taskbar searchbox
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /V SearchboxTaskbarMode /T REG_dWORD /D 0 /F
:: Task View Button
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowTaskViewButton /T REG_dWORD /D 0 /F
:: -------
:: File Explorer
:: -------
:: Files show extensions
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V HideFileExt /T REG_dWORD /D 0 /F
:: Recycle Bin
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ConfirmFileDelete /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ConfirmFileDelete /T REG_dWORD /D 1 /F

:: ------------------------------------------------------------------------------------
:: Web Browser Policy Settings
:: ------------------------------------------

:: -----------------
:: Chrome
:: -----------------

:: Extensions
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
:: Extension Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"mnjggcdmjocbbbhaepdhchncahnbgone\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
:: Import Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: Disable Notifications and Location
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DnsOverHttpsMode /T REG_SZ /D off /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: Disable Automatic Google Account Browser Signin
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BrowserSignin /T REG_dWORD /D 0 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutoplayAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V HideWebStoreIcon /T REG_dWORD /D 1 /F

:: -----------------
:: Chromium
:: -----------------

:: Extensions
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
:: Extension Settings
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"mnjggcdmjocbbbhaepdhchncahnbgone\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
:: Import Settings
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: Disable Notifications and Location
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DnsOverHttpsMode /T REG_SZ /D off /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: Disable Automatic Google Account Browser Signin
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BrowserSignin /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SyncDisabled /T REG_dWORD /D 1 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ChromeCleanupEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutoplayAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V HideWebStoreIcon /T REG_dWORD /D 1 /F

:: -----------------
:: Firefox
:: -----------------

:: Extension Settings and force-install
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"},\"{da6554a8-470c-4d6a-a6ca-904740683552}\":{\"installation_mode\":\"blocked\"}}" /F
:: Disable Notfications and Location
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V Locked /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V Locked /T REG_dWORD /D 1 /F
:: Default Permissions
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /V "Default" /T REG_SZ /D "block-audio-video" /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /V Locked /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions" /V DisableDeveloperTools /T REG_dWORD /D 0 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS" /V Locked /T REG_dWORD /D 1 /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Proxy" /V Mode /T REG_SZ /D none /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Proxy" /V Locked /T REG_dWORD /D 1 /F
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DontCheckDefaultBrowser /T REG_dWORD /D 1 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin" /V Default /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin" /V Locked /T REG_dWORD /D 1 /F
:: Disable Pocket and Clean Home Page
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisablePocket /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Search /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V TopSites /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Highlights /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Pocket /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /V Snippets /T REG_dWORD /D 0 /F
:: About Config Settings
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V Preferences /T REG_SZ /D "{\"browser.search.suggest.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.search.suggest.enabled.private\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.bookmark\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.history\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.openpage\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.searches\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.topsites\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.update1.searchTips\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.update1.interventions\":{\"Value\":false,\"Status\":\"locked\"},\"browser.aboutConfig.showWarning\":{\"Value\":false,\"Status\":\"default\"},\"browser.tabs.warnOnClose\":{\"Value\":false,\"Status\":\"default\"},\"browser.tabs.warnOnCloseOtherTabs\":{\"Value\":false,\"Status\":\"default\"},\"browser.urlbar.trimURLs\":{\"Value\":false,\"Status\":\"locked\"},\"browser.disableResetPrompt\":{\"Value\":true,\"Status\":\"default\"},\"browser.newtabpage.activity-stream.section.highlights.includeBookmarks\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeDownloads\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includePocket\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeVisited\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.showSponsored\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.showSponsoredTopSites\":{\"Value\":false,\"Status\":\"locked\"},\"browser.tabs.crashReporting.sendReport\":{\"Value\":false,\"Status\":\"locked\"},\"geo.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"geo.provider.ms-windows-location\":{\"Value\":false,\"Status\":\"locked\"},\"security.insecure_connection_text.enabled\":{\"Value\":true,\"Status\":\"locked\"},\"security.insecure_connection_text.pbmode.enabled\":{\"Value\":true,\"Status\":\"locked\"},\"accessibility.force_disabled\":{\"Value\":1,\"Status\":\"locked\"},\"dom.battery.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"network.http.sendRefererHeader\":{\"Value\":0,\"Status\":\"default\"},\"media.videocontrols.picture-in-picture.keyboard-controls.enabled\":{\"Value\":true,\"Status\":\"default\"},\"browser.formfill.enable\":{\"Value\":false,\"Status\":\"default\"},\"network.dns.disablePrefetch\":{\"Value\":true,\"Status\":\"locked\"},\"network.dns.disablePrefetchFromHTTPS\":{\"Value\":true,\"Status\":\"locked\"},\"network.prefetch-next\":{\"Value\":false,\"Status\":\"locked\"},\"network.predictor.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"network.predictor.enable-prefetch\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.speculativeConnect.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.send_pings\":{\"Value\":false,\"Status\":\"locked\"},\"media.eme.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.gmp-widevinecdm.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.navigator.enabled\":{\"Value\":false,\"Status\":\"default\"},\"browser.newtabpage.activity-stream.feeds.telemetrybrowser.newtabpage.activity-stream.telemetry\":{\"Value\":false,\"Status\":\"locked\"},\"browser.pingcentre.telemetry\":{\"Value\":false,\"Status\":\"locked\"},\"media.wmf.deblacklisting-for-telemetry-in-gpu-process\":{\"Value\":false,\"Status\":\"locked\"},\"extensions.htmlaboutaddons.recommendations.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons\":{\"Value\":false,\"Status\":\"locked\"},\"browser.messaging-system.whatsNewPanel.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.feeds.section.topstories\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.feeds.snippets\":{\"Value\":false,\"Status\":\"locked\"},\"browser.ctrlTab.recentlyUsedOrder\":{\"Value\":false,\"Status\":\"default\"},\"browser.crashReports.unsubmittedCheck.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.crashReports.unsubmittedCheck.autoSubmit2\":{\"Value\":false,\"Status\":\"locked\"},\"print.always_print_silent\":{\"Value\":false,\"Status\":\"locked\"},\"print.tab_modal.enabled\":{\"Value\":true,\"Status\":\"default\"},\"media.hardwaremediakeys.enabled\":{\"Value\":false,\"Status\":\"default\"},\"accessibility.blockautorefresh\":{\"Value\":false,\"Status\":\"locked\"},\"extensions.formautofill.creditCards.enabled\":{\"Value\":false,\"Status\":\"default\"},\"extensions.formautofill.addresses.enabled\":{\"Value\":false,\"Status\":\"default\"},\"ui.key.menuAccessKeyFocuses\":{\"Value\":false,\"Status\":\"locked\"}}" /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Cookies" /V AcceptThirdParty /T REG_SZ /D never /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxStudies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSetDesktopBackground /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableTelemetry /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V BlockAboutSupport /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFeedbackCommands /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverrideFirstRunPage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverridePostUpdatePage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V NoDefaultBookmarks /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisplayBookmarksToolbar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V "DisplayMenuBar" /T REG_SZ /D "default-off" /F
REG DELETE "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /F

:: -----------------
:: Brave
:: -----------------

:: Extensions
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 1 /T REG_SZ /D cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist" /V 3 /T REG_SZ /D lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx /F
:: Extension Settings
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {},\"mnjggcdmjocbbbhaepdhchncahnbgone\": {},\"lckanjgmijmafbedllaakclkaicjfmnk\": {}}" /F
:: Import Settings
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportAutofillFormData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportBookmarks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportHomepage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportSavedPasswords /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ImportSearchEngine /T REG_dWORD /D 0 /F
:: Disable Notifications and Location
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DnsOverHttpsMode /T REG_SZ /D off /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Brave Tor
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V TorDisabled /T REG_dWORD /D 1 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V WebRtcEventLogCollectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutoplayAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\BraveSoftware\Brave\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F

:: -----------------
:: Microsoft Edge Chromium
:: -----------------

:: Disable Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F
:: Extensions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 1 /T REG_SZ /D odfafepnkmbhccpbejgmiehpchacaeak /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 2 /T REG_SZ /D mbmgnelfcpoecdepckhlhegpcehmpmji /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" /V 3 /T REG_SZ /D mdkdmaickkfdekbjdoojfalpbkgaddei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 1 /T REG_SZ /D odfafepnkmbhccpbejgmiehpchacaeak;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 2 /T REG_SZ /D mbmgnelfcpoecdepckhlhegpcehmpmji;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /V 3 /T REG_SZ /D mdkdmaickkfdekbjdoojfalpbkgaddei;https://edge.microsoft.com/extensionwebstorebase/v1/crx /F
:: Extension Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"odfafepnkmbhccpbejgmiehpchacaeak\": {},\"mbmgnelfcpoecdepckhlhegpcehmpmji\": {},\"mdkdmaickkfdekbjdoojfalpbkgaddei\": {}}" /F
:: Import Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AutoImportAtFirstRun /T REG_dWORD /D 4 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /V CreateDesktopShortcutDefault /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V HideFirstRunExperience /T REG_dWORD /D 1 /F
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
:: Disable Notifications and Location
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultNotificationsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultGeolocationSetting /T REG_dWORD /D 2 /F
:: Disable DNS over HTTPS
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DnsOverHttpsMode /T REG_SZ /D off /F
:: Disable Proxy
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V "ProxySettings" /T REG_SZ /D "{\"ProxyMode\":\"direct\"}" /F
:: Disable ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AllowSurfGame /T REG_dWORD /D 1 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AddressBarMicrosoftSearchInBingProviderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AlternateErrorPagesEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V LocalProvidersEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PersonalizationReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ResolveNavigationErrorsUseWebService /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageHideDefaultTopSites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPagePrerenderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageAllowedBackgroundTypes /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DiagnosticData /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EdgeCollectionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V EdgeShoppingAssistantEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\CollectionsServicesAndExportsBlockList" /V 1 /T REG_SZ /D pinterest_suggestions /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V NewTabPagePrerenderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageHideDefaultTopSites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AllowWebContentOnNewTabPage /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SpotlightExperiencesAndRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPagePrerenderEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V PersonalizationReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V NewTabPageSearchBox /T REG_SZ /D redirect /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V HideInternetExplorerRedirectUXForIncompatibleSitesEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ShowMicrosoftRewards /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V familySafetySettingsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V DeveloperToolsAvailability /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V MediaRecommendationsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V AdvancedProtectionAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V SuppressUnsupportedOSWarning /T REG_dWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V BookmarkBarEnabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AlwaysOpenPdfExternally /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultFileSystemReadGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultFileSystemWriteGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultInsecureContentSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultPopupsSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultSerialGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultWebBluetoothGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V DefaultWebUsbGuardSetting /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V EnableMediaRouter /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V ShowCastIconInToolbar /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutoplayAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutofillAddressEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /V AutofillCreditCardEnabled /T REG_dWORD /D 0 /F

:: -----------------
:: Microsoft Edge Legacy
:: -----------------

:: First Run
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AllowPrelaunch /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V AllowTabPreloading /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V PreventTabPreloading /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventFirstRunPage /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V SyncFavoritesBetweenIEAndMicrosoftEdge /T REG_dWORD /D 0 /F
:: Sync
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSyn /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /V DisableWebBrowserSettingSyncUserOverride /T REG_dWORD /D 2 /F
:: Browsing History
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\KioskMode" /V ConfigureKioskMode /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AllowSavingHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Privacy" /V ClearBrowsingHistoryOnExit /T REG_dWORD /D 1 /F
:: Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" /V FlashPlayerEnabled /T REG_dWORD /D 0 /F
:: New Tab Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI" /V ShowOneBox /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI" /V AllowWebContentOnNewTabPage /T REG_dWORD /D 0 /F
:: Default Browser Prompt
REG ADD "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
:: Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V "Use FormSuggest" /T REG_SZ /D no /F
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V EnableExtendedBooksTelemetry /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventLiveTileDataCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V MicrosoftEdgeDataOptIn /T REG_dWORD /D 0 /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V AllowConfigurationUpdateForBooksLibrary /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V UseSharedFolderForBooks /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Internet Settings" /V ConfigureHomeButton /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V AlwaysEnableBooksLibrary /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventAccessToAboutFlagsInMicrosoftEdge /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /V PreventOverride /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /V PreventOverrideAppRepUnknown /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V Cookies /T REG_dWORD /D 1 /F

:: -----------------
:: Internet Explorer
:: -----------------

:: First Run
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V DisableImportExportFavorites /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V DisableFirstRunCustomize /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /V ShowMessageWhenOpeningSitesInMicrosoftEdge /T REG_dWORD /D 0 /F
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
:: Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /V DisableFlashInIE /T REG_dWORD /D 1 /F
:: Start Page
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\ContinuousBrowsing" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKU\Default\Software\Microsoft\Internet Explorer\Main" /V "Start Page" /T REG_SZ /D about:blank /F
REG ADD "HKU\Default\Software\Microsoft\Internet Explorer\Main" /V Default /T REG_SZ /D about:blank /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Recovery" /V NoReopenLastSession /T REG_dWORD /D 1 /F
:: Default Browser Prompt
REG ADD "HKLM\Default\Software\Microsoft\Internet Explorer\Main" /V "Check_Associations" /T REG_SZ /D "no" /F
REG ADD "HKCU\Default\Software\Microsoft\Internet Explorer\Main" /V "Check_Associations" /T REG_SZ /D "no" /F
:: Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpItemSendFeedback /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpItemSendFeedback /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V ShowContentAdvisor /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\DomainSuggestion" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoHelpMenu /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /V DisableCustomerImprovementProgram /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V DisplayQuickPick /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes" /V TopResult /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V HideNewEdgeButton /T REG_dWORD /D 0 /F
:: Other
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Geolocation" /V PolicyDisableGeolocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /V NoSearchBox /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /V NoSplash /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V EnableAutoUpgrade /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V AllowWindowReuse /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V NoReportSiteProblems /T REG_SZ /D yes /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /V RestrictIE /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\FormatDetection" /V PhoneNumberEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\WindowsSearch" /V EnabledScopes /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V PreventOverride /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V PreventOverrideAppRepUnknown /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter" /V Enabled /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V RestrictPopupExceptionList /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" /V DisableLogging /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V DisableFixSecuritySettings /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V DisableSecuritySettingsCheck /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing" /V NewTabPageShow /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing" /V PopupsUseNewWindow /T REG_dWORD /D 2 /F

:: -----------------
:: Block Bad Extensions/Addons (Chrome, Chromium, Firefox, Brave, and Edge Chromium)
:: -----------------
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

takeown /f "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /grant administrators:F /t /q
rd /s /q "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" && md "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy"
takeown /f "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /grant administrators:F /t /q
icacls "%SystemRoot%\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy" /deny everyone:F /t /q

:: Holographic First Run (Removed in Version 1809)
:: 		Disables the Holographic App / Windows Mixed Reality App

takeown /f "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /grant administrators:F /t /q
rd /s /q "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" && md "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy"
takeown /f "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /grant administrators:F /t /q
icacls "%SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy" /deny everyone:F /t /q

:: -----------------
:: Remove Microsoft Edge Chromium and Microsoft Edge Legacy
:: -----------------

:: Microsoft Edge Chromium

:: Moved to Top of Main File
:: %ProgramFiles(x86)%\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
:: %ProgramFiles%\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

rd /s /q "%SystemDrive%\Program Files (x86)\Microsoft\Edge"
rd /s /q "%SystemDrive%\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "%SystemDrive%\Program Files\Microsoft\Edge"
rd /s /q "%SystemDrive%\Program Files\Microsoft\EdgeUpdate"
rd /s /q "%UserProfile%\Local\Microsoft\Edge"

:: Microsoft Edge Legacy
takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" && md "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /deny everyone:F /t /q

takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
rd /s /q "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" && md "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
takeown /f "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /a /r /d y
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /inheritance:r
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant administrators:F /t /q
icacls "%SystemRoot%\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /deny everyone:F /t /q

rd /s /q "%UserProfile%\Local\MicrosoftEdge"
rd /s /q "%UserProfile%\MicrosoftEdgeBackups"

:: -----------------
:: Uninstall and Disable OneDrive
:: -----------------

:: Moved to Top of Main File
:: %SystemRoot%\System32\OneDriveSetup.exe /uninstall
:: %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall

REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /V System.IsPinnedToNameSpaceTree /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /V DisableFileSyncNGSC /T REG_dWORD /D 1 /F

takeown /f "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /a /r /d y
icacls "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /inheritance:r
icacls "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /grant administrators:F /t /q
icacls "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /deny everyone:F /t /q

takeown /f "%SystemRoot%\System32\OneDriveSetup.exe" /a /r /d y
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /inheritance:r
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /grant administrators:F /t /q
icacls "%SystemRoot%\System32\OneDriveSetup.exe" /deny everyone:F /t /q

rd /s /q "%UserProfile%\AppData\Local\Microsoft\OneDrive"
rd /s /q "%ProgramData%\Microsoft OneDrive"
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
rd /s /q "%UserProfile%\3D Objects"

:: Adobe Flash Player
rd /s /q "%UserProfile%\AppData\Roaming\Adobe\Flash Player"

:: Mixed Reality Viewer
rd /s /q "%ProgramData%\WindowsHolographicDevices"

:: -----------------
:: Powershell Command to Remove UWP Apps (Except Microsoft Store, Calculator, and Windows Terminal)
:: Redirects to powershell script (setup.ps1)
:: -----------------

powershell.exe -ExecutionPolicy Unrestricted -Command ". '%~dpn0.ps1'"

powershell.exe -ExecutionPolicy AllSigned

goto :EOF

:: ----------------------------------------------------------------------
:: Optional Stuff
:: -----------------

:: Allow Microsoft Edge Chromium and Microsoft Edge Legacy to run at the same time
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /V Allowsxs /T REG_dWORD /D 1 /F

:: Alt-Tab Multitasking (non-forced option)
:: REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V MultiTaskingAltTabFilter /T REG_dWORD /D 3 /F

:: Disable Automatic Google Account Browser Signin (non-forced option) - (Google Chrome Only)
:: REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BrowserSignin /T REG_dWORD /D 0 /F

:: (Optional) Receive updates for other Microsoft Products when you update windows
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V AllowMUUpdateService /T REG_dWORD /D 1 /F


:: ----------------------------------------------------------------------
:: Other Messages
:: --------------
:: Deny Message
:deny
echo.
echo -------
echo.
echo You have denied permissions
goto end1
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
:: --------------
