@echo OFF

:: setup.bat
:: Custom Setup for Windows 10 (Windows 10 Version 1909/19H2 - OS Build 18363)
:: 		https://github.com/jfu299/win10setup
:: 		https://raw.githubusercontent.com/jfu299/win10setup/main/setup.bat
:: By: Justin Fu
:: Updated: December 14, 2020

echo.
echo -------
echo Custom Setup for Windows 10 (Windows 10 Version 1909/19H2 - OS Build 18363)
echo 	https://github.com/jfu299/win10setup
echo 	https://raw.githubusercontent.com/jfu299/win10setup/main/setup.bat
echo By: Justin Fu
echo Updated: December 14, 2020
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
echo 4) Ctrl-Alt-Del Requirement on Login
echo.
echo 5) Ctrl-Alt-Del Requirement on UAC
echo.
echo 6) Username Visibility on Login/Lock Screen
echo.
echo 7) Username Visibility on UAC (Already included in Main)
echo.
echo 8) Ability to change password on Ctrl-Alt-Del Screen
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
if "%op%"=="n" goto end
if "%op%"=="exit" goto end
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
echo 4) (Windows 10 Pro Only) Undo Disable Access to Update in Settings
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

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option2redo

:: --------------
:option2.1
@echo ON
:: -------
:: See Windows 10 Updates Partial Control on Main (Same Thing)
:: Target Release Version (Version 1909)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D 1909 /F
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
:: Disable Microsoft Edge (Chromium) Auto-Install
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
:: (Optional) Receive updates for other Microsoft Products when you update windows
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V AllowMUUpdateService /T REG_dWORD /D 1 /F
:: --- Manual Update Start
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V Start /T REG_dWORD /D 3 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V ObjectName /T REG_SZ /D LocalSystem /F
@echo OFF
goto option2
:: --------------
:option2.2
@echo ON
:: See Windows 10 Updates Partial Control on Main (Same Thing)
:: Target Release Version (Version 1909)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D 1909 /F
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
:: Disable Microsoft Edge (Chromium) Auto-Install
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
:: (Optional) Receive updates for other Microsoft Products when you update windows
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V AllowMUUpdateService /T REG_dWORD /D 1 /F
:: -------
:: --- Disable Update Start
net stop wuauserv
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /V ObjectName /T REG_SZ /D Administrators /F
@echo OFF
goto option2
:: --------------
:option2.3
@echo ON
:: Windows 10 Disable Access to Update in Settings
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetDisableUXWUAccess /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V SetDisablePauseUXAccess /T REG_dWORD /D 1 /F
@echo OFF
goto option2
:: --------------
:option2.4
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
echo You have selected Option 3: Web Browser Policies Setup for Chrome, Chromium, Firefox, and Microsoft Edge (Chromium)
:option3redo
echo.
echo Select a task:
echo.
echo ----------------------------
echo.
echo Web Browser Policies for Chrome, Chromium, Firefox, Microsoft Edge (Chromium), Microsoft Edge (Edge HTML), and Internet Explorer
echo It is not recommended to use Internet Explorer or the Legacy (non-Chromium) Microsoft Edge
echo.
echo ----------------------------
echo.
echo 1) (Already included in Main) Web Browser Enterprise Policies
echo.
echo 2) Prevent Installing Extensions/Addons
echo.
echo 3) Undo Prevent Installing Extensions/Addons
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

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option3redo

:: --------------
:option3.1
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
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {}}" /F
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
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: Disable Automatic Google Account Browser Signin
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BrowserSignin /T REG_dWORD /D 0 /F
:: Disable Automatic Google Account Browser Signin (non-forced option)
:: REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BrowserSignin /T REG_dWORD /D 0 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V EnterpriseRealTimeUrlCheckMode /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F

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
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {}}" /F
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
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V EnterpriseRealTimeUrlCheckMode /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F

:: -----------------
:: Firefox
:: -----------------

:: Extension Settings and force-install
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"}}" /F
:: Disable Notfications and Location
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V Locked /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V Locked /T REG_dWORD /D 1 /F
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
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V Preferences /T REG_SZ /D "{\"browser.search.suggest.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.search.suggest.enabled.private\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.bookmark\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.history\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.openpage\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.searches\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.topsites\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.update1.searchTips\":{\"Value\":false,\"Status\":\"locked\"},\"browser.aboutConfig.showWarning\":{\"Value\":false,\"Status\":\"default\"},\"browser.tabs.warnOnClose\":{\"Value\":false,\"Status\":\"default\"},\"browser.tabs.warnOnCloseOtherTabs\":{\"Value\":false,\"Status\":\"default\"},\"browser.urlbar.trimURLs\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeBookmarks\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeDownloads\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includePocket\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeVisited\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.showSponsored\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.showSponsoredTopSites\":{\"Value\":false,\"Status\":\"locked\"},\"browser.tabs.crashReporting.sendReport\":{\"Value\":false,\"Status\":\"locked\"},\"geo.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"geo.provider.ms-windows-location\":{\"Value\":false,\"Status\":\"locked\"},\"security.insecure_connection_text.enabled\":{\"Value\":true,\"Status\":\"locked\"},\"security.insecure_connection_text.pbmode.enabled\":{\"Value\":true,\"Status\":\"locked\"},\"accessibility.force_disabled\":{  \"Value\":1,  \"Status\":\"locked\"},\"dom.battery.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"network.http.sendRefererHeader\":{ \"Value\":0,  \"Status\":\"default\"},\"media.videocontrols.picture-in-picture.keyboard-controls.enabled\":{\"Value\":true,\"Status\":\"default\"},\"browser.formfill.enable\":{\"Value\":false,\"Status\":\"default\"},\"network.dns.disablePrefetch\":{\"Value\":true,\"Status\":\"locked\"},\"network.dns.disablePrefetchFromHTTPS\":{\"Value\":true,\"Status\":\"locked\"},\"network.prefetch-next\":{\"Value\":false,\"Status\":\"locked\"},\"network.predictor.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"network.predictor.enable-prefetch\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.speculativeConnect.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.send_pings\":{\"Value\":false,\"Status\":\"locked\"},\"dom.event.clipboardevents.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.eme.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.gmp-widevinecdm.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.navigator.enabled\":{\"Value\":false,\"Status\":\"default\"},\"browser.newtabpage.activity-stream.feeds.telemetrybrowser.newtabpage.activity-stream.telemetry\":{\"Value\":false,\"Status\":\"locked\"},\"browser.pingcentre.telemetry\":{\"Value\":false,\"Status\":\"locked\"},\"media.wmf.deblacklisting-for-telemetry-in-gpu-process\":{\"Value\":false,\"Status\":\"locked\"},\"extensions.htmlaboutaddons.recommendations.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.feeds.section.topstories\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.feeds.snippets\":{\"Value\":false,\"Status\":\"locked\"},\"browser.ctrlTab.recentlyUsedOrder\":{\"Value\":false,\"Status\":\"default\"},\"browser.crashReports.unsubmittedCheck.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.crashReports.unsubmittedCheck.autoSubmit2\":{\"Value\":false,\"Status\":\"locked\"}}" /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Cookies" /V AcceptThirdParty /T REG_SZ /D never /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxStudies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSetDesktopBackground /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableTelemetry /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V BlockAboutSupport /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFeedbackCommands /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverrideFirstRunPage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverridePostUpdatePage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /V UrlbarInterventions /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /V WhatsNew /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V NoDefaultBookmarks /T REG_dWORD /D 1 /F
:: Removed because already on About Config Settings
:: REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /V ExtensionRecommendations /T REG_dWORD /D 0 /F
:: REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /V FeatureRecommendations /T REG_dWORD /D 0 /F

:: -----------------
:: Microsoft Edge (Chromium)
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
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"odfafepnkmbhccpbejgmiehpchacaeak\": {}}" /F
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

:: -----------------
:: Microsoft Edge (Edge HTML)
:: -----------------

:: First Run
REG ADD "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /V AllowPrelaunch /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V AllowTabPreloading /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V PreventTabPreloading /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventFirstRunPage /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V SyncFavoritesBetweenIEAndMicrosoftEdge /T REG_dWORD /D 0 /F
:: Sync
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSyn /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableWebBrowserSettingSyncUserOverride /T REG_dWORD /D 2 /F
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
REG ADD "HKLM\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
:: Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V "Use FormSuggest" /T REG_SZ /D no /F
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V EnableExtendedBooksTelemetry /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventLiveTileDataCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V MicrosoftEdgeDataOptIn /T REG_dWORD /D 0 /F
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

:: -----------------
:: Microsoft Edge (Chromium)
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

:: -----------------
:: Microsoft Edge (Chromium) Add-on Store
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D gmgoamodcdcjnbaobigkjelfplakmdhh /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D ndcileolkflehcjpmjnfbnaibdcgglog /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D jccfboncbdccgbgcbhickioeailgpkgb /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D pciakllldcajllepkbbihkmfkikheffb /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D pdffkfellgipmhklpdmokmckkkfcopbh /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D cnlefmmeadmemmdciolhbnfeacpdfbkd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D kljjdbdffnbengiilkaiblpinbhfcfnc /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D amnbcmdbanbkjhnfoeceemmmdiepnbpp /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D fdgpikaaheckgdijjmepmdjjkbceakif /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D phhhmbgggfifgikoihlakngnngdehhfe /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D lacbjnnibafcbpogdcpfdpmajfkdampi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D iffhejniciepiiafcfhhapiidaomcdam /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D nfjgmgjhcihmkobljembcfodkajehoej /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D bdaafgjhhjkdplpffldcncdignokfkbo /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D fdhgeoginicibhagdmblfikbgbkahibd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D lamehkegphbbfdailghaeeleoajilfho /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D iiclaphjclecagpkkaacljnpcppnoibi /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D jebegceanihjkbdfnjelignmnclhpnfh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D bnplfnhcidhhdapmblniehfaaompjlck /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D eghmccdcabhgeigmkhfbnioepobdhhab /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D cjmjijnpnollocennnapedpaeecninea /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D acgiggmcehhbhfnedfkcgenplgkjddef /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D hcfdaddfkgbmekbgcepcnpfiopaigpnn /F
:: -----
:: Fake Tiktok
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D eamchpjkhdjbbhdanfngombbbafoopbm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D pdjhconnbgkdigcldclgbgihmjokldbe /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D mipfipmcmnedgckncckicogmnncflhhk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D goepanlbnhiiaopmfcniejcbhgolcllb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D ccjbgffbjdbnnpdnopghofogcfeopdmn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D celdediiemogjpfcjocdbildilkccepl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D ofbgciponmcpbencjjhomeoekhnlnppj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D clklfdpdakpekcamjgiedicfnikeajcl /F
:: Fake Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D omhnkkegfjjhpkobpjdiokemdecmmebb /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D pejdjolhgfenbjfjoejgllffflbbgecm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D kjdjplhnalcgkamkcidihcodlblkihon /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D mbdlpgncclnhomdpmicmgdihapedhhak /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D odiffgppifkpehahdcafnkloapoblbkj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D fhhdniedlnfoenmhbajomdablgpbhnad /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D bhhjenbjldcljpdofmhkdcdfmbagoong /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D oakdjiehbhihbklollmmmkhfilbklgkf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D ffnfbjmflmibccofnlgeolaoamencnpf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D bpllndkbconceaidgcllkolimbbiojic /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D lmfhgdeejhbbcagkkbefkkgkfofjhfch /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D efpgcmfgkpmogadebodiegjleafcmdcb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D onlofoccaenllpjmalbnilfacjmcfhfk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D bpffhahkoibohjndinfiimfomedmgnme /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kkkldohdhcfhpjchcefpkfhjfeapdmek /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D gaobomhkmmnbjgehdfjeklkbfddhjbfi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D fbobegkkdmmcnmoplkgdmfhdlkjfelnb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D jlfbbmbfbkkilahjmbjehndogohpbfmf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D bbocfgcdelebeaboidkmglbdkimdpojb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D dckihkcdmjmlkndgmmgplpcnkmdpangb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D gclhifbbggfamoojmienffegbmmfnfll /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D pafjohfpgafakkaoccipcknnaoneopei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D oggghceenfdiodiakhigmpamjpcnilin /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D lojfohldolbkplldokkjgjmcffealmka /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D nipggfgilmoiofmnkbeabghbcaohmjih /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D obmbbppggfnabhdbepdbmpcjfckkoljl /F
:: -----------------



:: -----------------
:: EXTRA (Allow Both Microsoft Edge Versions to run at the same time):
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /V Allowsxs /T REG_dWORD /D 1 /F
:: -----------------

@echo OFF
goto option3
:: --------------
:option3.2
@echo ON

:: -----------------
:: Disable Extension/Addon Install
:: -----------------

:: Chrome
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BlockExternalExtensions /T REG_dWORD /D 1 /F
:: Chromium
REG ADD "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BlockExternalExtensions /T REG_dWORD /D 1 /F
:: Firefox
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"blocked\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"}}" /F
:: Microsoft Edge (Chromium)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /T REG_SZ /D * /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BlockExternalExtensions /T REG_dWORD /D 1 /F
:: Microsoft Edge (Edge HTML)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /T REG_dWORD /D 0 /F
:: Internet Explorer
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /T REG_SZ /D no /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /T REG_dWORD /D 1 /F

@echo OFF
goto option3
:: --------------
:: --------------
:option3.3
@echo ON

:: -----------------
:: Undo Disable Extension/Addon Install
:: -----------------

:: Chrome
REG DELETE "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKLM\SOFTWARE\Policies\Google\Chrome" /V BlockExternalExtensions /F
:: Chromium
REG DELETE "HKLM\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKLM\SOFTWARE\Policies\Chromium" /V BlockExternalExtensions /F
:: Firefox
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"}}" /F
:: Microsoft Edge (Chromium)
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 1 /F
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V BlockExternalExtensions /F
:: Microsoft Edge (Edge HTML)
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V ExtensionsEnabled /F
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions" /V AllowSideloadingOfExtensions /F
:: Internet Explorer
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /V Enable Browser Extensions /F
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions" /V NoExtensionManagement /F
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /V RestrictToList /F

@echo OFF
goto option3
:: --------------

:: ------------------------------------------------------------------------------------
:option4
echo -------
echo.
echo You have selected Option 4: Ctrl-Alt-Del Requirement on Login
:option4redo
echo.
echo Select a task:
echo.
echo 1) Require Ctrl-Alt-Del on Login
echo.
echo 2) Do not Require Ctrl-Alt-Del on Login
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

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option4redo

:: --------------
:option4.1
@echo ON
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V DisableCAD /T REG_dWORD /D 0 /F
@echo OFF
goto option4
:: --------------
:option4.2
@echo ON
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V DisableCAD /T REG_dWORD /D 1 /F
@echo OFF
goto option4
:: ------------------------------------------------------------------------------------
:option5
echo -------
echo.
echo You have selected Option 5: Ctrl-Alt-Del Requirement on UAC
:option5redo
echo.
echo Select a task:
echo.
echo 1) Require Ctrl-Alt-Del on UAC
echo.
echo 2) Do not Require Ctrl-Alt-Del on UAC
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


echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option5redo

:: --------------
:option5.1
@echo ON
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnableSecureCredentialPrompting /T REG_dWORD /D 1 /F
@echo OFF
goto option5
:: --------------
:option5.2
@echo ON
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnableSecureCredentialPrompting /T REG_dWORD /D 0 /F
@echo OFF
goto option5
:: ------------------------------------------------------------------------------------
:option6
echo -------
echo.
echo You have selected Option 6: Username Visibility on Login/Lock Screen
echo	- Login Screen is when you are signed out, Lock Screen is when you are signed in but locked
:option6redo
echo.
echo Select a task:
echo.
echo 1) Hide Username on Login Screen Only
echo.
echo 2) Hide Username on both Login and Lock Screen
echo.
echo 3) Show Username on both Login and Lock Screen
echo.
echo 4) Return
echo.
echo 5) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option6.1
if "%op%"=="2" goto option6.2
if "%op%"=="3" goto option6.3

if "%op%"=="4" goto mainMenu
if "%op%"=="5" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option6redo

:: --------------
:option6.1
@echo ON
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V dontdisplaylastusername /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DontDisplayLockedUserID /T REG_dWORD /D 1 /F
@echo OFF
goto option6
:: --------------
:option6.2
@echo ON
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V dontdisplaylastusername /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DontDisplayLockedUserID /T REG_dWORD /D 3 /F
@echo OFF
goto option6
:: --------------
:option6.3
@echo ON
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V dontdisplaylastusername /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DontDisplayLockedUserID /T REG_dWORD /D 0 /F
@echo OFF
goto option6
:: ------------------------------------------------------------------------------------
:option7
echo -------
echo.
echo You have selected Option 7: Username Visibility on UAC
:option7redo
echo.
echo Select a task:
echo.
echo 1) (Already included in Main) Hide Username on UAC Password Prompt
echo.
echo 2) Show Username on UAC Password Prompt
echo.
echo 3) Return
echo.
echo 4) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option7.1
if "%op%"=="2" goto option7.2

if "%op%"=="3" goto mainMenu
if "%op%"=="4" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option7redo

:: --------------
:option7.1
@echo ON
:: Hide Username on UAC Password Prompt
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnumerateAdministrators /T REG_dWORD /D 0 /F
@echo OFF
goto option7
:: --------------
:option7.2
@echo ON
:: Show Username on UAC Password Prompt
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" /V EnumerateAdministrators /T REG_dWORD /D 1 /F
@echo OFF
goto option7
:: --------------
:option8
echo -------
echo.
echo You have selected Option 8: Ability to change password on Ctrl-Alt-Del Screen
:option8redo
echo.
echo Select a task:
echo.
echo 1) Block Changing Password on Ctrl-Alt-Del Screen
echo.
echo 2) Allow Changing Password on Ctrl-Alt-Del Screen
echo.
echo 3) Return
echo.
echo 4) Exit
echo.

set /p op="Type Option: "

if "%op%"=="1" goto option8.1
if "%op%"=="2" goto option8.2

if "%op%"=="3" goto mainMenu
if "%op%"=="4" goto end

echo.
echo -------
echo PLEASE SELECT A VALID OPTION
goto option8redo

:: --------------
:option8.1
@echo ON
:: Block Changing Password on Ctrl-Alt-Del Screen
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableChangePassword /T REG_dWORD /D 1 /F
@echo OFF
goto option8
:: --------------
:option8.2
@echo ON
:: Allow Changing Password on Ctrl-Alt-Del Screen
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableChangePassword /T REG_dWORD /D 0 /F
@echo OFF
goto option8
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
PAUSE
echo -------
echo This also sets some Windows 10 Updates policies, sets up policies on major web browsers,
echo hides user accounts on a non-admin User Account Control prompt, and removes/disables various Windows 10 annoyances.
echo To stop or disable the Windows Update service (wuauserv), use the other options.
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
if "%op%"=="y" goto startmainFile
if "%op%"=="yes" goto startmainFile
if "%op%"=="Yes" goto startmainFile
if "%op%"=="Y" goto startmainFile
if "%op%"=="YES" goto startmainFile

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

:startmainFile
@echo ON

:: -------
:: Stop WaaSMedicSvc and DiagTrack
:: -------
net stop WaaSMedicSvc
net stop DiagTrack

:: -------
:: Enable Windows Photo Viewer and Remove 3D Objects Folder
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
REG ADD "HKCU\Software\Classes\.jpg" /V (Default) /T REG_SZ /D PhotoViewer.FileAssoc.Tiff /F
REG ADD "HKCU\Software\Classes\.jpeg" /V (Default) /T REG_SZ /D PhotoViewer.FileAssoc.Tiff /F
REG ADD "HKCU\Software\Classes\.gif" /V (Default) /T REG_SZ /D PhotoViewer.FileAssoc.Tiff /F
REG ADD "HKCU\Software\Classes\.png" /V (Default) /T REG_SZ /D PhotoViewer.FileAssoc.Tiff /F
REG ADD "HKCU\Software\Classes\.bmp" /V (Default) /T REG_SZ /D PhotoViewer.FileAssoc.Tiff /F
REG ADD "HKCU\Software\Classes\.tiff" /V (Default) /T REG_SZ /D PhotoViewer.FileAssoc.Tiff /F
REG ADD "HKCU\Software\Classes\.ico" /V (Default) /T REG_SZ /D PhotoViewer.FileAssoc.Tiff /F
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
:: Target Release Version (Version 1909)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersion /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /V TargetReleaseVersionInfo /T REG_SZ /D 1909 /F
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
:: Disable Microsoft Edge (Chromium) Auto-Install
REG ADD "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /V DoNotUpdateToEdgeWithChromium /T REG_dWORD /D 1 /F
:: Disable Windows Update Medic Service
:: net stop WaaSMedicSvc (Moved to Top)
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
:: (Optional) Receive updates for other Microsoft Products when you update windows
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /V AllowMUUpdateService /T REG_dWORD /D 1 /F
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
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /V AllowLinguisticDataCollection /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /V TailoredExperiencesWithDiagnosticDataEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /V TailoredExperiencesWithDiagnosticDataEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableTailoredExperiencesWithDiagnosticData /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /V DisableEnterpriseAuthproxy /T REG_dWORD /D 1 /F
:: Connected User Experiences and Telemetry Service (DiagTrack)
:: net stop DiagTrack (Moved to Top)
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /V Start /T REG_dWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /V ObjectName /T REG_SZ /D Administrators /F
:: Windows 10 Send Feedback
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V DoNotShowFeedbackNotifications /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V DisableDiagnosticDataViewer /T REG_dWORD /D 1 /F
:: Windows Defender Automatic Sample Submission
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /V SubmitSamplesConsent /T REG_dWORD /D 2 /F
:: Windows Error Reporting
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V Disabled /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /V Disabled /T REG_dWORD /D 1 /F
:: -------
:: Disable Inking and Typing
:: -------
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /V AllowWindowsInkWorkspace /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V AllowInputPersonalization /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /V AllowLinguisticDataCollection /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Input\TIPC" /V Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace" /V PenWorkspaceButtonDesiredVisibility /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\InputPersonalization" /V RestrictImplicitTextCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\InputPersonalization" /V RestrictImplicitInkCollection /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /V HarvestContacts /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Personalization\Settings" /V AcceptedPrivacyPolicy /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Input\Settings" /V InsightsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Input\TIPC" /V Enabled /T REG_dWORD /D 0 /F
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
REG ADD "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /V DisableLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /V DisableLocationScripting /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /V DisableSensors /T REG_dWORD /D 1 /F
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
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V ContentDeliveryAllowed /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V OemPreInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V PreInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V PreInstalledAppsEverEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SilentInstalledAppsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SilentInstalledAppsEverEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SoftLandingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SystemPaneSuggestionsEnabled /T REG_dWORD /D 0 /F
:: SubscribedContent Suggestions
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338387Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338388Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338389Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-338393Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353694Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353696Enabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V SubscribedContent-353698Enabled /T REG_dWORD /D 0 /F
:: File Explorer Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /V AutoSuggest /T REG_SZ /D no /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowInfoTip /T REG_dWORD /D 0 /F
:: File Explorer OneDrive Suggestion and OneDrive Shortcut
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowSyncProviderNotifications /T REG_dWORD /D 0 /F
REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /V System.IsPinnedToNameSpaceTree /T REG_dWORD /D 0 /F
:: Settings Tips
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V AllowOnlineTips /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Input\Settings" /V EnableHwkbTextPrediction /T REG_dWORD /D 0 /F
:: Windows Spotlight
REG ADD "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /V DisableThirdPartySuggestions /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnactioncenter /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnSettings /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableThirdPartySuggestions /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnactioncenter /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightOnSettings /T REG_dWORD /D 1 /F
:: Live Tiles
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /V NoTileApplicationNotification /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V ClearTilesOnExit /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V ClearTilesOnExit /T REG_dWORD /D 1 /F
:: Windows People Bar
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V HidePeopleBar /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /V PeopleBand /T REG_dWORD /D 0 /F
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
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /V ScoobeSystemSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /V ScoobeSystemSettingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V NoBalloonFeatureAdvertisements /T REG_dWORD /D 1 /F
:: Disable Java sponsor offers
:: It is not recommeded to use Java
REG ADD "HKLM\SOFTWARE\JavaSoft" /V SPONSORS /T REG_SZ /D DISABLE /F
REG ADD "HKLM\SOFTWARE\Wow6432Node\JavaSoft" /V SPONSORS /T REG_SZ /D DISABLE /F
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
REG ADD "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /V DisableWindowsSpotlightWindowswelcomeExperience /T REG_dWORD /D 1 /F
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
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V AllowCloudSearch /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V AllowSearchToUseLocation /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V DisableWebSearch /T REG_dWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /V BingSearchEnabled /T REG_dWORD /D 0 /F
:: Search History
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRecentDocsHistory /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoRecentDocsHistory /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ClearRecentProgForNewUserInStartMenu /T REG_dWORD /D 1 /F
:: Recently Added Apps
REG ADD " HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V HideRecentlyAddedApps /T REG_dWORD /D 1 /F
:: Activity History
REG ADD "HKLM\Software\Policies\Microsoft\Windows\System" /V UploadUserActivities /T REG_dWORD /D 0 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\System" /V PublishUserActivities /T REG_dWORD /D 0 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\System" /V EnableActivityFeed /T REG_dWORD /D 0 /F
:: Advanced Clipboard
REG ADD "HKLM\Software\Policies\Microsoft\Windows\System" /V AllowClipboardHistory /T REG_dWORD /D 0 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\System" /V AllowCrossDeviceClipboard /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Start_TrackDocs /T REG_dWORD /D 0 /F
:: -------
:: Windows Security and UAC Settings
:: -------
:: Microsoft account
REG ADD "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowYourAccount" /V value /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V NoConnectedUser /T REG_dWORD /D 3 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSync /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableWindowsSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableApplicationSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableAppSyncSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableWebBrowserSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableDesktopThemeSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableCredentialsSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisablePersonalizationSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableStartLayoutSettingSyncUserOverride /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableSyncOnPaidNetwork /T REG_dWORD /D 1 /F
:: Windows Defender
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection" /V UILockdown /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options" /V UILockdown /T REG_dWORD /D 1 /F
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

:: -------
:: Action Center and Notifications
:: -------
REG ADD "HKLM\Software\Policies\Microsoft\Windows\Explorer" /V DisableNotificationcenter /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V DisableNotificationcenter /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_GLEAM_ENABLED /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_BADGE_ENABLED /T REG_dWORD /D 0 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_TOASTS_ENABLED /T REG_dWORD /D 0 /F
:: -------
:: Desktop
:: -------
:: Disable Auto Preview Desktop
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DisablePreviewDesktop /T REG_dWORD /D 1 /F
:: Disable Aero Shake
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DisallowShaking /T REG_dWORD /D 1 /F
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
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /V SearchboxTaskbarMode /T REG_dWORD /D 0 /F
:: Task View Button
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowTaskViewButton /T REG_dWORD /D 0 /F
:: -------
:: File Explorer
:: -------
:: Files show extensions
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V HideFileExt /T REG_dWORD /D 0 /F
:: Recycle Bin
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ConfirmFileDelete /T REG_dWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V ConfirmFileDelete /T REG_dWORD /D 1 /F

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
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {}}" /F
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
:: Disable Ask for Default
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultBrowserSettingEnabled /T REG_dWORD /D 0 /F
:: Disable Flash
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V DefaultPluginsSetting /T REG_dWORD /D 2 /F
:: Easter Egg
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AllowDinosaurEasterEgg /T REG_dWORD /D 1 /F
:: Disable Automatic Google Account Browser Signin
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BrowserSignin /T REG_dWORD /D 0 /F
:: Disable Automatic Google Account Browser Signin (non-forced option)
:: REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BrowserSignin /T REG_dWORD /D 0 /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ShowFullUrlsInAddressBar /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V AdsSettingForIntrusiveAdsSites /T REG_dWORD /D 2 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V ChromeCleanupReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SpellCheckServiceEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UserFeedbackAllowed /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V EnterpriseRealTimeUrlCheckMode /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F

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
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"cjpalhdlnbpafiamejdnhcphjbkeiagm\": {}}" /F
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
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V EnterpriseRealTimeUrlCheckMode /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V SafeBrowsingExtendedReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V BackgroundModeEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V MetricsReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V PromotionalTabsEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V CloudReportingEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium" /V UrlKeyedAnonymizedDataCollectionEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V BlockThirdPartyCookies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V RestoreOnStartup /T REG_dWORD /D 5 /F
REG ADD "HKLM\SOFTWARE\Policies\Chromium\Recommended" /V ShowAppsShortcutInBookmarkBar /T REG_dWORD /D 0 /F

:: -----------------
:: Firefox
:: -----------------

:: Extension Settings and force-install
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V ExtensionSettings /T REG_SZ /D "{\"*\":{\"installation_mode\":\"allowed\"},\"uBlock0@raymondhill.net\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi\"},\"sponsorBlocker@ajay.app\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi\"},\"{74145f27-f039-47ce-a470-a662b129930a}\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi\"},\"bypasspaywalls@bypasspaywalls.weebly.com\":{\"installation_mode\":\"force_installed\",\"install_url\":\"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi\"},\"adblockultimate@adblockultimate.net\":{\"installation_mode\":\"blocked\"},\"jid1-NIfFY2CA8fy1tg@jetpack\":{\"installation_mode\":\"blocked\"},\"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}\":{\"installation_mode\":\"blocked\"}}" /F
:: Disable Notfications and Location
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /V Locked /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V BlockNewRequests /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /V Locked /T REG_dWORD /D 1 /F
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
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V Preferences /T REG_SZ /D "{\"browser.search.suggest.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.search.suggest.enabled.private\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.bookmark\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.history\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.openpage\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.searches\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.suggest.topsites\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.update1.searchTips\":{\"Value\":false,\"Status\":\"locked\"},\"browser.aboutConfig.showWarning\":{\"Value\":false,\"Status\":\"default\"},\"browser.tabs.warnOnClose\":{\"Value\":false,\"Status\":\"default\"},\"browser.tabs.warnOnCloseOtherTabs\":{\"Value\":false,\"Status\":\"default\"},\"browser.urlbar.trimURLs\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeBookmarks\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeDownloads\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includePocket\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.section.highlights.includeVisited\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.showSponsored\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.showSponsoredTopSites\":{\"Value\":false,\"Status\":\"locked\"},\"browser.tabs.crashReporting.sendReport\":{\"Value\":false,\"Status\":\"locked\"},\"geo.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"geo.provider.ms-windows-location\":{\"Value\":false,\"Status\":\"locked\"},\"security.insecure_connection_text.enabled\":{\"Value\":true,\"Status\":\"locked\"},\"security.insecure_connection_text.pbmode.enabled\":{\"Value\":true,\"Status\":\"locked\"},\"accessibility.force_disabled\":{  \"Value\":1,  \"Status\":\"locked\"},\"dom.battery.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"network.http.sendRefererHeader\":{ \"Value\":0,  \"Status\":\"default\"},\"media.videocontrols.picture-in-picture.keyboard-controls.enabled\":{\"Value\":true,\"Status\":\"default\"},\"browser.formfill.enable\":{\"Value\":false,\"Status\":\"default\"},\"network.dns.disablePrefetch\":{\"Value\":true,\"Status\":\"locked\"},\"network.dns.disablePrefetchFromHTTPS\":{\"Value\":true,\"Status\":\"locked\"},\"network.prefetch-next\":{\"Value\":false,\"Status\":\"locked\"},\"network.predictor.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"network.predictor.enable-prefetch\":{\"Value\":false,\"Status\":\"locked\"},\"browser.urlbar.speculativeConnect.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.send_pings\":{\"Value\":false,\"Status\":\"locked\"},\"dom.event.clipboardevents.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.eme.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.gmp-widevinecdm.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"media.navigator.enabled\":{\"Value\":false,\"Status\":\"default\"},\"browser.newtabpage.activity-stream.feeds.telemetrybrowser.newtabpage.activity-stream.telemetry\":{\"Value\":false,\"Status\":\"locked\"},\"browser.pingcentre.telemetry\":{\"Value\":false,\"Status\":\"locked\"},\"media.wmf.deblacklisting-for-telemetry-in-gpu-process\":{\"Value\":false,\"Status\":\"locked\"},\"extensions.htmlaboutaddons.recommendations.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.feeds.section.topstories\":{\"Value\":false,\"Status\":\"locked\"},\"browser.newtabpage.activity-stream.feeds.snippets\":{\"Value\":false,\"Status\":\"locked\"},\"browser.ctrlTab.recentlyUsedOrder\":{\"Value\":false,\"Status\":\"default\"},\"browser.crashReports.unsubmittedCheck.enabled\":{\"Value\":false,\"Status\":\"locked\"},\"browser.crashReports.unsubmittedCheck.autoSubmit2\":{\"Value\":false,\"Status\":\"locked\"}}" /F
:: Privacy Settings
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Cookies" /V AcceptThirdParty /T REG_SZ /D never /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V SearchSuggestEnabled /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxStudies /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSetDesktopBackground /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableTelemetry /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V PromptForDownloadLocation /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V BlockAboutSupport /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFeedbackCommands /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverrideFirstRunPage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V OverridePostUpdatePage /T REG_SZ /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /V UrlbarInterventions /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /V WhatsNew /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /V NoDefaultBookmarks /T REG_dWORD /D 1 /F
:: Removed because already on About Config Settings
:: REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /V ExtensionRecommendations /T REG_dWORD /D 0 /F
:: REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /V FeatureRecommendations /T REG_dWORD /D 0 /F

:: -----------------
:: Microsoft Edge (Chromium)
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
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /V ExtensionSettings /T REG_SZ /D "{\"*\": {\"blocked_permissions\": [\"vpnProvider\",\"webRequest\",\"webRequestBlocking\",\"geolocation\",\"declarativeNetRequest\",\"declarativeNetRequestFeedback\",\"declarativeWebRequest\"]},\"odfafepnkmbhccpbejgmiehpchacaeak\": {}}" /F
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

:: -----------------
:: Microsoft Edge (Edge HTML)
:: -----------------

:: First Run
REG ADD "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /V AllowPrelaunch /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V AllowTabPreloading /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /V PreventTabPreloading /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventFirstRunPage /T REG_dWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V SyncFavoritesBetweenIEAndMicrosoftEdge /T REG_dWORD /D 0 /F
:: Sync
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableSettingSyn /T REG_dWORD /D 2 /F
REG ADD "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /V DisableWebBrowserSettingSyncUserOverride /T REG_dWORD /D 2 /F
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
REG ADD "HKLM\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /V DisallowDefaultBrowserPrompt /T REG_dWORD /D 1 /F
:: Suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" /V ShowSearchSuggestionsGlobal /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V "Use FormSuggest" /T REG_SZ /D no /F
:: Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /V EnableExtendedBooksTelemetry /T REG_dWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /V PreventLiveTileDataCollection /T REG_dWORD /D 1 /F
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V MicrosoftEdgeDataOptIn /T REG_dWORD /D 0 /F
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

:: -----------------
:: Microsoft Edge (Chromium)
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

:: -----------------
:: Microsoft Edge (Chromium) Add-on Store
:: -----------------
:: (Other adblockers interfere with ublock origin)
:: Adblock Plus
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 64 /T REG_SZ /D gmgoamodcdcjnbaobigkjelfplakmdhh /F
:: Adblock
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 65 /T REG_SZ /D ndcileolkflehcjpmjnfbnaibdcgglog /F
:: Fair Adblocker
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 66 /T REG_SZ /D jccfboncbdccgbgcbhickioeailgpkgb /F
:: Adblock Ultimate
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 67 /T REG_SZ /D pciakllldcajllepkbbihkmfkikheffb /F
:: Adguard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 68 /T REG_SZ /D pdffkfellgipmhklpdmokmckkkfcopbh /F
:: -----
:: Grammarly
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 69 /T REG_SZ /D cnlefmmeadmemmdciolhbnfeacpdfbkd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 70 /T REG_SZ /D kljjdbdffnbengiilkaiblpinbhfcfnc /F
:: Honey
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 71 /T REG_SZ /D amnbcmdbanbkjhnfoeceemmmdiepnbpp /F
:: Avast
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 72 /T REG_SZ /D fdgpikaaheckgdijjmepmdjjkbceakif /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 73 /T REG_SZ /D phhhmbgggfifgikoihlakngnngdehhfe /F
:: AVG
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 74 /T REG_SZ /D lacbjnnibafcbpogdcpfdpmajfkdampi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 75 /T REG_SZ /D iffhejniciepiiafcfhhapiidaomcdam /F
:: Hola
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 76 /T REG_SZ /D nfjgmgjhcihmkobljembcfodkajehoej /F
:: Norton
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 77 /T REG_SZ /D bdaafgjhhjkdplpffldcncdignokfkbo /F
:: Mcafee
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 78 /T REG_SZ /D fdhgeoginicibhagdmblfikbgbkahibd /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 79 /T REG_SZ /D lamehkegphbbfdailghaeeleoajilfho /F
:: Web of Trust
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 80 /T REG_SZ /D iiclaphjclecagpkkaacljnpcppnoibi /F
:: Microsoft Annoyances
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 81 /T REG_SZ /D jebegceanihjkbdfnjelignmnclhpnfh /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 82 /T REG_SZ /D bnplfnhcidhhdapmblniehfaaompjlck /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 83 /T REG_SZ /D eghmccdcabhgeigmkhfbnioepobdhhab /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 84 /T REG_SZ /D cjmjijnpnollocennnapedpaeecninea /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 85 /T REG_SZ /D acgiggmcehhbhfnedfkcgenplgkjddef /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 86 /T REG_SZ /D hcfdaddfkgbmekbgcepcnpfiopaigpnn /F
:: -----
:: Fake Tiktok
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 87 /T REG_SZ /D eamchpjkhdjbbhdanfngombbbafoopbm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 88 /T REG_SZ /D pdjhconnbgkdigcldclgbgihmjokldbe /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 89 /T REG_SZ /D mipfipmcmnedgckncckicogmnncflhhk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 90 /T REG_SZ /D goepanlbnhiiaopmfcniejcbhgolcllb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 91 /T REG_SZ /D ccjbgffbjdbnnpdnopghofogcfeopdmn /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 92 /T REG_SZ /D celdediiemogjpfcjocdbildilkccepl /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 93 /T REG_SZ /D ofbgciponmcpbencjjhomeoekhnlnppj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 94 /T REG_SZ /D clklfdpdakpekcamjgiedicfnikeajcl /F
:: Fake Flash
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 95 /T REG_SZ /D omhnkkegfjjhpkobpjdiokemdecmmebb /F
:: Fake Adblockers
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 96 /T REG_SZ /D pejdjolhgfenbjfjoejgllffflbbgecm /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 97 /T REG_SZ /D kjdjplhnalcgkamkcidihcodlblkihon /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 98 /T REG_SZ /D mbdlpgncclnhomdpmicmgdihapedhhak /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 99 /T REG_SZ /D odiffgppifkpehahdcafnkloapoblbkj /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 100 /T REG_SZ /D fhhdniedlnfoenmhbajomdablgpbhnad /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 101 /T REG_SZ /D bhhjenbjldcljpdofmhkdcdfmbagoong /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 102 /T REG_SZ /D oakdjiehbhihbklollmmmkhfilbklgkf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 103 /T REG_SZ /D ffnfbjmflmibccofnlgeolaoamencnpf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 104 /T REG_SZ /D bpllndkbconceaidgcllkolimbbiojic /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 105 /T REG_SZ /D lmfhgdeejhbbcagkkbefkkgkfofjhfch /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 106 /T REG_SZ /D efpgcmfgkpmogadebodiegjleafcmdcb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 107 /T REG_SZ /D onlofoccaenllpjmalbnilfacjmcfhfk /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 108 /T REG_SZ /D bpffhahkoibohjndinfiimfomedmgnme /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 109 /T REG_SZ /D kkkldohdhcfhpjchcefpkfhjfeapdmek /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 110 /T REG_SZ /D gaobomhkmmnbjgehdfjeklkbfddhjbfi /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 111 /T REG_SZ /D fbobegkkdmmcnmoplkgdmfhdlkjfelnb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 112 /T REG_SZ /D jlfbbmbfbkkilahjmbjehndogohpbfmf /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 113 /T REG_SZ /D bbocfgcdelebeaboidkmglbdkimdpojb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 114 /T REG_SZ /D dckihkcdmjmlkndgmmgplpcnkmdpangb /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 115 /T REG_SZ /D gclhifbbggfamoojmienffegbmmfnfll /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 116 /T REG_SZ /D pafjohfpgafakkaoccipcknnaoneopei /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 117 /T REG_SZ /D oggghceenfdiodiakhigmpamjpcnilin /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 118 /T REG_SZ /D lojfohldolbkplldokkjgjmcffealmka /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 119 /T REG_SZ /D nipggfgilmoiofmnkbeabghbcaohmjih /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /V 120 /T REG_SZ /D obmbbppggfnabhdbepdbmpcjfckkoljl /F
:: -----------------



:: -----------------
:: EXTRA (Allow Both Microsoft Edge Versions to run at the same time):
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /V Allowsxs /T REG_dWORD /D 1 /F
:: -----------------

:: -------
:: Take Ownership and Full Control under administrators group
:: -------
takeown /f musnotification.exe /a /r /d y
icacls musnotification.exe /grant administrators:F /t /q
icacls musnotification.exe /deny Everyone:(X) /t /q
:: --
takeown /f musnotificationux.exe /a /r /d y
icacls musnotificationux.exe /grant administrators:F /t /q
icacls musnotificationux.exe /deny Everyone:(X) /t /q
:: --
takeown /f C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe /a /r /d y
icacls C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe /grant administrators:F /t /q
:: --
takeown /f C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe /a /r /d y
icacls C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe /grant administrators:F /t /q
:: --
takeown /f C:\Windows\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy /a /r /d y
icacls C:\Windows\SystemApps\Microsoft.PPIProjection_cw5n1h2txyewy /grant administrators:F /t /q
:: --------------
@echo OFF
echo.
echo -------
echo.
echo It is recommended that you restart your computer
echo If you choose to restart, your computer will restart in 15 seconds
echo.
echo -------
echo.
set /p op="Restart Computer? (y/n) "

if "%op%"=="y" goto restartComputer
if "%op%"=="yes" goto restartComputer
if "%op%"=="Yes" goto restartComputer
if "%op%"=="Y" goto restartComputer
if "%op%"=="YES" goto restartComputer
echo.
echo -------
echo.
echo You have chosen not to restart
PAUSE
echo.
echo -------
echo.
goto mainMenu
:: --------------
:: Restart Computer
:restartComputer
echo.
echo -------
echo.
echo RESTARTING COMPUTER IN 15 SECONDS
echo MAKE SURE TO SAVE ALL WORK
echo.
echo TO ABORT RESTART TYPE IN COMMAND PROMPT OR POWERSHELL: shutdown -a
echo.
echo -------
echo.
shutdown -s -t 15
echo.
PAUSE
goto :EOF
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
