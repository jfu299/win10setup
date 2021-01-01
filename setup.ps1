
# setup.ps1
# Custom Setup for Windows 10 (Windows 10 Version 1909/19H2 - OS Build 18363)
# 		https://github.com/jfu299/win10setup
# 		https://raw.githubusercontent.com/jfu299/win10setup/main/setup.ps1
# By: Justin Fu
# Updated: January 1, 2021

# -----------------
# Redirected from batch file (setup.bat)
# -----------------

# -------
# Windows 10 Updates Partial Control (Windows Update Not Disabled)
# -------
# Target Release Version (Version 20H2)
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name TargetReleaseVersion -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name TargetReleaseVersionInfo -PropertyType String -Value '20H2' -Force
# Defer Updates (Windows Update for Business)
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name DeferFeatureUpdates -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name DeferFeatureUpdatesPeriodInDays -PropertyType Dword -Value 365 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name DeferQualityUpdates -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name DeferQualityUpdatesPeriodInDays -PropertyType Dword -Value 30 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name ManagePreviewBuilds -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name ManagePreviewBuildsPolicyValue -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name DisableWUfBSafeguards -PropertyType Dword -Value 0 -Force
# Disable Wake Timers
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name AUPowerManagement -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Task Scheduler\Maintenance' -Name WakeUp -PropertyType Dword -Value 0 -Force
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
# Disable Delivery Optimization
# HEX: 64 DECIMAL: 100
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' -Name DODownloadMode -PropertyType Dword -Value 100 -Force
# Pause Updates Indefinitely
# HEX: 96520 DECIMAL: 615712
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name FlightSettingsMaxPauseDays -PropertyType Dword -Value 615712 -Force
# Disable Microsoft Edge Chromium Auto-Install
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\EdgeUpdate' -Name DoNotUpdateToEdgeWithChromium -PropertyType Dword -Value 1 -Force
# Disable Windows Update Medic Service
# Moved to Top of Main File
# net stop WaaSMedicSvc
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc' -Name Start -PropertyType Dword -Value 4 -Force
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc' -Name ObjectName -PropertyType String -Value Administrators -Force
# No Auto Reboot
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name NoAutoRebootWithLoggedOnUsers -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name NoAUShutdownOption -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name NoAUAsDefaultShutdownOption -PropertyType Dword -Value 1 -Force
# No Metered Connections
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name AllowAutoWindowsUpdateDownloadOverMeteredNetwork -PropertyType Dword -Value 0 -Force
# Windows 10 Manual Update
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name AUOptions -PropertyType Dword -Value 2 -Force
# Windows 10 Update Service Manual Start (Use other option instead)
# New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\wuauserv' -Name Start -PropertyType Dword -Value 3 -Force
# -------
# Turn Off Fast Startup
# -------
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name HiberbootEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name HiberbootEnabled -PropertyType Dword -Value 0 -Force
# -------
# Disable Storage Sense
# -------
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\StorageSense' -Name AllowStorageSenseGlobal -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\StorageSense' -Name ConfigStorageSenseDownloadsCleanupThreshold -PropertyType Dword -Value 0 -Force
# -------
# Disable Wifi Sense and Mobile Hotspot
# -------
# Wifi Sense
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config' -Name AutoConnectAllowedOEM -PropertyType Dword -Value 0 -Force
# Mobile Hotspot
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WcmSvc\Tethering' -Name RemoteStartupDisabled -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Name NC_ShowSharedAccessUI -PropertyType Dword -Value 0 -Force
# -------
# Hide Network Options and Homegroup on File Explorer
# -------
# HEX: b0940064 DECIMAL: 2962489444
New-ItemProperty -Path 'HKCR:\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder' -Name Attributes -PropertyType Dword -Value 2962489444 -Force
New-ItemProperty -Path 'HKCR:\Wow6432Node\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder' -Name Attributes -PropertyType Dword -Value 2962489444 -Force
# HEX: B094010C DECIMAL: 2962489612
New-ItemProperty -Path 'HKCR:\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder' -Name Attributes -PropertyType Dword -Value 2962489612 -Force
New-ItemProperty -Path 'HKCR:\Wow6432Node\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder' -Name Attributes -PropertyType Dword -Value 2962489612 -Force
# -------
# Disable Windows Telemetry and Telemetry Service
# -------
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableTailoredExperiencesWithDiagnosticData -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableWindowsConsumerFeatures -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name AllowTelemetry -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name AllowTelemetry -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy' -Name TailoredExperiencesWithDiagnosticDataEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy' -Name TailoredExperiencesWithDiagnosticDataEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableTailoredExperiencesWithDiagnosticData -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name DisableEnterpriseAuthproxy -PropertyType Dword -Value 1 -Force
# Connected User Experiences and Telemetry Service (DiagTrack)
# Moved to Top of Main File
# net stop DiagTrack
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\DiagTrack' -Name Start -PropertyType Dword -Value 4 -Force
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\DiagTrack' -Name ObjectName -PropertyType String -Value Administrators -Force
# Windows 10 Send Feedback
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name DoNotShowFeedbackNotifications -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name DisableDiagnosticDataViewer -PropertyType Dword -Value 1 -Force
# Windows Defender Automatic Sample Submission
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name SubmitSamplesConsent -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MRT' -Name DontReportInfectionInformation -PropertyType Dword -Value 1 -Force	
# Windows Error Reporting
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name Disabled -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name Disabled -PropertyType Dword -Value 1 -Force
# -------
# Disable Inking and Typing
# -------
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name DisablePersonalization -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' -Name AllowWindowsInkWorkspace -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name AllowInputPersonalization -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name RestrictImplicitTextCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name RestrictImplicitInkCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name RestrictImplicitTextCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name RestrictImplicitInkCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput' -Name AllowLinguisticDataCollection -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Input\TIPC' -Name Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace' -Name PenWorkspaceButtonDesiredVisibility -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\InputPersonalization' -Name RestrictImplicitTextCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\InputPersonalization' -Name RestrictImplicitInkCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\Software\Microsoft\InputPersonalization' -Name RestrictImplicitTextCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\Software\Microsoft\InputPersonalization' -Name RestrictImplicitInkCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore' -Name HarvestContacts -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Personalization\Settings' -Name AcceptedPrivacyPolicy -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Input\Settings' -Name InsightsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Input\TIPC' -Name Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\TabletPC' -Name PreventhandwritingDataSharing -PropertyType Dword -Value 1 -Force
# -------
# Windows Privacy Settings
# -------
# Disable Advertising Id
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' -Name DisabledByGroupPolicy -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name Enabled -PropertyType Dword -Value 0 -Force
# Turn Off Language List website access
New-ItemProperty -Path 'HKCU:\Control Panel\International\User Profile' -Name HttpAcceptLanguageOptOut -PropertyType Dword -Value 1 -Force
# Turn off App Launch Tracking
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name Start_TrackProgs -PropertyType Dword -Value 0 -Force
# Disable Location Services
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name DisableLocation -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name DisableLocationScripting -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name DisableSensors -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessLocation -PropertyType Dword -Value 2 -Force
# Find My Device Location
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FindMyDevice' -Name AllowFindMyDevice -PropertyType Dword -Value 0 -Force
# Restrict Camera
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessCamera -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessCamera_ForceDenyTheseApps -PropertyType MultiString -Value Microsoft.MicrosoftEdge_8wekyb3d8bbwe\0Microsoft.Win32WebViewHost_cw5n1h2txyewy\0Microsoft.Windows.Cortana_cw5n1h2txyewy\0Microsoft.WindowsStore_8wekyb3d8bbwe\0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessCamera_UserInControlOfTheseApps -PropertyType MultiString -Value NonPackaged\0 -Force
# Restrict Microphone
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessMicrophone -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsActivateWithVoice -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsActivateWithVoiceAboveLock -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessMicrophone_UserInControlOfTheseApps -PropertyType MultiString -Value NonPackaged\0Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\0 -Force
# Headset Button Press Default App
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps' -Name AgentActivationLastUsed -PropertyType Dword -Value 0 -Force
# Other
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessNotifications -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessAccountInfo -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessContacts -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessCalendar -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessPhone -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessCallHistory -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessEmail -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessTasks -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessMessaging -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessRadios -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessTrustedDevices -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsRunInBackground -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsGetDiagnosticInfo -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsSyncWithDevices -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessMotion -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessGazeInput -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name LetAppsAccessBackgroundSpatialPerception -PropertyType Dword -Value 2 -Force
# -------
# Disable Microsoft Annoyances
# -------
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableSoftLanding -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableWindowsConsumerFeatures -PropertyType Dword -Value 1 -Force
# Microsoft Store Apps
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name ContentDeliveryAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name OemPreInstalledAppsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name PreInstalledAppsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name PreInstalledAppsEverEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SilentInstalledAppsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SilentInstalledAppsEverEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SoftLandingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SystemPaneSuggestionsEnabled -PropertyType Dword -Value 0 -Force
# SubscribedContent Suggestions
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SubscribedContent-338387Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SubscribedContent-338388Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SubscribedContent-338389Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SubscribedContent-338393Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SubscribedContent-353694Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SubscribedContent-353696Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SubscribedContent-353698Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name SubscribedContent-310093Enabled -PropertyType Dword -Value 0 -Force
# File Explorer Suggestions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name DisableSearchBoxSuggestions -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name DisableSearchBoxSuggestions -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name DisableSearchhistory -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name DisableSearchhistory -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name 'Append Completion' -PropertyType String -Value no -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name 'Append Completion' -PropertyType String -Value no -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name AutoSuggest -PropertyType String -Value no -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name AutoSuggest -PropertyType String -Value no -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name 'Append Completion' -PropertyType String -Value no -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name 'Append Completion' -PropertyType String -Value no -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name AutoSuggest -PropertyType String -Value no -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name AutoSuggest -PropertyType String -Value no -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowInfoTip -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowSyncProviderNotifications -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowInfoTip -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowSyncProviderNotifications -PropertyType Dword -Value 0 -Force
# Settings Tips
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name AllowOnlineTips -PropertyType Dword -Value 0 -Force
# Keyboard
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Input\Settings' -Name EnableHwkbTextPrediction -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International' -Name TurnOffOfferTextPredictions -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International' -Name TurnOffInsertSpace -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International' -Name TurnOffAutocorrectMisspelledWords -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International' -Name TurnOffHighlightMisspelledWords -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\policies\microsoft\TabletTip\1.7' -Name Disableprediction -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\policies\microsoft\TabletTip\1.7' -Name EnableTextPrediction -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Input\Settings' -Name MultilingualEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\TabletTip\1.7' -Name EnableDoubleTapSpace -PropertyType Dword -Value 0 -Force
# Windows Spotlight
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableThirdPartySuggestions -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableWindowsSpotlightOnactioncenter -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableWindowsSpotlightOnSettings -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableThirdPartySuggestions -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableWindowsSpotlightOnactioncenter -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableWindowsSpotlightOnSettings -PropertyType Dword -Value 1 -Force
# Live Tiles
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' -Name NoTileApplicationNotification -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name ClearTilesOnExit -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name ClearTilesOnExit -PropertyType Dword -Value 1 -Force
# Windows People Bar
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name HidePeopleBar -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People' -Name PeopleBand -PropertyType Dword -Value 0 -Force
# Storage Sense
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\StorageSense' -Name AllowStorageSenseGlobal -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\StorageSense' -Name ConfigStorageSenseDownloadsCleanupThreshold -PropertyType Dword -Value 0 -Force
# Project to PC
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect' -Name AllowProjectionToPC -PropertyType Dword -Value 0 -Force
# Shared Experiences
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name EnableCdp -PropertyType Dword -Value 0 -Force
# Offline Maps App
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps' -Name AllowUntriggeredNetworkTrafficOnSettingsPage -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps' -Name AutoDownloadAndUpdateMapData -PropertyType Dword -Value 0 /
# Disable Microsoft Skype Meet Now
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name HideSCAMeetNow -PropertyType Dword -Value 1 -Force
# Other
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement' -Name ScoobeSystemSettingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement' -Name ScoobeSystemSettingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name NoBalloonFeatureAdvertisements -PropertyType Dword -Value 1 -Force
# Disable Java Sponsor offers
# It is not recommeded to use Java
New-ItemProperty -Path 'HKLM:\SOFTWARE\JavaSoft' -Name 'SPONSORS' -PropertyType String -Value 'DISABLE' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\JavaSoft' -Name 'SPONSORS' -PropertyType String -Value 'DISABLE' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\JreMetrics' -Name 'DisableSponsors' -PropertyType String -Value 'Y' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\JreMetrics' -Name 'DisableSponsors' -PropertyType String -Value 'Y' -Force
# Settings Page Visibility
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name SettingsPageVisibility -PropertyType String -Value 'hide:workplace;mobile-devices;emailandaccounts;sync;windowsinsider-optin;delivery-optimization;findmydevice;network-mobilehotspot;maps-downloadmaps;maps;mobile-devices-addphone;mobile-devices-addphone-direct;privacy-location;privacy-speechtyping;privacy-notifications;privacy-accountinfo;privacy-contacts;privacy-calendar;privacy-phonecalls;privacy-callhistory;privacy-email;privacy-tasks;privacy-messaging;privacy-radios;privacy-customdevices;privacy-backgroundapps;privacy-appdiagnostics;privacy-general;privacy-speech;privacy-activityhistory;clipboard;crossdevice;project;gaming-xboxnetworking;typing' -Force
# Alt-Tab Multitasking
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name multitaskingAltTabFilter -PropertyType Dword -Value 4 -Force
# Printing Manual Set Default Printer
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows' -Name LegacyDefaultPrinterMode -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows' -Name LegacyDefaultPrinterMode -PropertyType Dword -Value 1 -Force
# Device Installation Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata' -Name PreventDeviceMetadataFromNetwork -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceSetup' -Name CostedNetworkPolicy -PropertyType Dword -Value 0 -Force

# -------
# Windows Login Experience
# -------
# Auto login after Updates
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\S-1-5-21-4053955510-1485632959-3974344530-1001' -Name OptOut -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name DisableAutomaticRestartSignOn -PropertyType Dword -Value 1 -Force
# Login Animation
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name EnableFirstLogonAnimation -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name EnableFirstLogonAnimation -PropertyType Dword -Value 0 -Force
# Welcome Experience
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name DisableWindowsSpotlightWindowswelcomeExperience -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OOBE' -Name DisablePrivacyExperience -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\OOBE' -Name DisablePrivacyExperience -PropertyType Dword -Value 1 -Force
# Lock Screen Blur
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name DisableAcrylicBackgroundOnLogon -PropertyType Dword -Value 1 -Force
# Block User from showing specific account details on signin
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name BlockUserFromShowingAccountDetailsOnSignin -PropertyType Dword -Value 1 -Force
# -------
# Windows Search
# -------
# Cortana
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name AllowCortana -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name AllowcortanaAboveLock -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name AllowCloudSearch -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name AllowSearchToUseLocation -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name DisableWebSearch -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name ConnectedSearchPrivacy -PropertyType Dword -Value 3 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name BingSearchEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowCortanaButton -PropertyType Dword -Value 0 -Force
# Search History
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name NoRecentDocsHistory -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name NoRecentDocsHistory -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name ClearRecentDocsOnExit -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name ClearRecentDocsOnExit -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name ClearRecentProgForNewUserInStartMenu -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name IsAADCloudSearchEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name IsDeviceSearchHistoryEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name IsMSACloudSearchEnabled -PropertyType Dword -Value 0 -Force
# Recently Added Apps
New-ItemProperty -Path ' HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name HideRecentlyAddedApps -PropertyType Dword -Value 1 -Force
# Activity History
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name UploadUserActivities -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name PublishUserActivities -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name EnableActivityFeed -PropertyType Dword -Value 0 -Force
# Advanced Clipboard
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name AllowClipboardHistory -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name AllowCrossDeviceClipboard -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name Start_TrackDocs -PropertyType Dword -Value 0 -Force
# -------
# Windows Security and UAC Settings
# -------
# Microsoft account
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name NoConnectedUser -PropertyType Dword -Value 3 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableSettingSync -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableWindowsSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableApplicationSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableAppSyncSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableWebBrowserSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableDesktopThemeSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableCredentialsSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisablePersonalizationSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableStartLayoutSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableSyncOnPaidNetwork -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Microsoftaccount' -Name DisableUserAuth -PropertyType Dword -Value 1 -Force
# Disable Sign in to Workplace
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowWorkplace' -Name value -PropertyType Dword -Value 0 -Force
# Windows Defender
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection' -Name UILockdown -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options' -Name UILockdown -PropertyType Dword -Value 1 -Force
# Hide Password Reveal
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CredUI' -Name DisablePasswordReveal -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI' -Name DisablePasswordReveal -PropertyType Dword -Value 1 -Force
# Picture Password
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name BlockDomainPicturePassword -PropertyType Dword -Value 1 -Force
# Security Questions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name NoLocalPasswordResetQuestions -PropertyType Dword -Value 1 -Force
# Network Selection on Lock Screen
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name DontDisplayNetworkSelectionUI -PropertyType Dword -Value 1 -Force
# UAC Hide User Accounts
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI' -Name EnumerateAdministrators -PropertyType Dword -Value 0 -Force

# -------
# Action Center and Notifications
# -------
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name DisableNotificationcenter -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name DisableNotificationcenter -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications' -Name ToastEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name NOC_GLOBAL_SETTING_GLEAM_ENABLED -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name NOC_GLOBAL_SETTING_BADGE_ENABLED -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name NOC_GLOBAL_SETTING_TOASTS_ENABLED -PropertyType Dword -Value 0 -Force
# -------
# Desktop
# -------
# Disable Auto Preview Desktop
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name DisablePreviewDesktop -PropertyType Dword -Value 1 -Force
# Disable Aero Shake
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name DisallowShaking -PropertyType Dword -Value 1 -Force
# Command Prompt on Win X Shortcut
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name DontUsePowerShellOnWinX -PropertyType Dword -Value 1 -Force
# -------
# Start Menu
# -------
# Quick Uninstall Apps
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name NoUninstallFromStart -PropertyType Dword -Value 1 -Force
# Taskbar Badges
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name TaskbarBadges -PropertyType Dword -Value 0 -Force
# Taskbar searchbox
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name SearchboxTaskbarMode -PropertyType Dword -Value 0 -Force
# Task View Button
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowTaskViewButton -PropertyType Dword -Value 0 -Force
# -------
# File Explorer
# -------
# Files show extensions
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name HideFileExt -PropertyType Dword -Value 0 -Force
# Recycle Bin
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name ConfirmFileDelete -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name ConfirmFileDelete -PropertyType Dword -Value 1 -Force

# ------------------------------------------------------------------------------------
# Web Browser Policy Settings
# ------------------------------------------

# -----------------
# Chrome
# -----------------

# Extensions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist' -Name 1 -PropertyType String -Value cjpalhdlnbpafiamejdnhcphjbkeiagm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist' -Name 2 -PropertyType String -Value mnjggcdmjocbbbhaepdhchncahnbgone -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallAllowlist' -Name 3 -PropertyType String -Value lckanjgmijmafbedllaakclkaicjfmnk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist' -Name 1 -PropertyType String -Value cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist' -Name 2 -PropertyType String -Value mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist' -Name 3 -PropertyType String -Value lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx -Force
# Extension Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name ExtensionSettings -PropertyType String -Value '{"*": {"blocked_permissions": ["vpnProvider","webRequest","webRequestBlocking","geolocation","declarativeNetRequest","declarativeNetRequestFeedback","declarativeWebRequest"]},"cjpalhdlnbpafiamejdnhcphjbkeiagm": {},"lckanjgmijmafbedllaakclkaicjfmnk": {}}' -Force
# Import Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name ImportAutofillFormData -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name ImportBookmarks -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name ImportHistory -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name ImportHomepage -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name ImportSavedPasswords -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name ImportSearchEngine -PropertyType Dword -Value 0 -Force
# Disable Notifications and Location
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name DefaultGeolocationSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name DefaultNotificationsSetting -PropertyType Dword -Value 2 -Force
# Disable DNS over HTTPS
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name DnsOverHttpsMode -PropertyType String -Value off -Force
# Disable Proxy
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'ProxySettings' -PropertyType String -Value '{"ProxyMode":"direct"}' -Force
# Disable Ask for Default
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name DefaultBrowserSettingEnabled -PropertyType Dword -Value 0 -Force
# Disable Flash
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name DefaultPluginsSetting -PropertyType Dword -Value 2 -Force
# Easter Egg
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name AllowDinosaurEasterEgg -PropertyType Dword -Value 1 -Force
# Disable Automatic Google Account Browser Signin
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name BrowserSignin -PropertyType Dword -Value 0 -Force
# Privacy Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name ShowFullUrlsInAddressBar -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name AdsSettingForIntrusiveAdsSites -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name ChromeCleanupReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name SpellCheckServiceEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name UserFeedbackAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name SearchSuggestEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name SafeBrowsingExtendedReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name BackgroundModeEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name MetricsReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name PromotionalTabsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name CloudReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name UrlKeyedAnonymizedDataCollectionEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name BlockThirdPartyCookies -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name RestoreOnStartup -PropertyType Dword -Value 5 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name ShowAppsShortcutInBookmarkBar -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name PromptForDownloadLocation -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name WebRtcEventLogCollectionAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name ChromeCleanupEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name DeveloperToolsAvailability -PropertyType Dword -Value 1 -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name MediaRecommendationsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name AdvancedProtectionAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name SuppressUnsupportedOSWarning -PropertyType Dword -Value 1 -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name BookmarkBarEnabled -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name AlwaysOpenPdfExternally -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name DefaultFileSystemReadGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name DefaultFileSystemWriteGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name DefaultInsecureContentSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name DefaultPopupsSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name DefaultSerialGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name DefaultWebBluetoothGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name DefaultWebUsbGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name EnableMediaRouter -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name ShowCastIconInToolbar -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name AutoplayAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name AutofillAddressEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\Recommended' -Name AutofillCreditCardEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name HideWebStoreIcon -PropertyType Dword -Value 1 -Force

# -----------------
# Chromium
# -----------------

# Extensions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist' -Name 1 -PropertyType String -Value cjpalhdlnbpafiamejdnhcphjbkeiagm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist' -Name 2 -PropertyType String -Value mnjggcdmjocbbbhaepdhchncahnbgone -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallAllowlist' -Name 3 -PropertyType String -Value lckanjgmijmafbedllaakclkaicjfmnk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist' -Name 1 -PropertyType String -Value cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist' -Name 2 -PropertyType String -Value mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist' -Name 3 -PropertyType String -Value lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx -Force
# Extension Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name ExtensionSettings -PropertyType String -Value '{"*": {"blocked_permissions": ["vpnProvider","webRequest","webRequestBlocking","geolocation","declarativeNetRequest","declarativeNetRequestFeedback","declarativeWebRequest"]},"cjpalhdlnbpafiamejdnhcphjbkeiagm": {},"lckanjgmijmafbedllaakclkaicjfmnk": {}}' -Force
# Import Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name ImportAutofillFormData -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name ImportBookmarks -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name ImportHistory -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name ImportHomepage -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name ImportSavedPasswords -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name ImportSearchEngine -PropertyType Dword -Value 0 -Force
# Disable Notifications and Location
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name DefaultGeolocationSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name DefaultNotificationsSetting -PropertyType Dword -Value 2 -Force
# Disable DNS over HTTPS
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name DnsOverHttpsMode -PropertyType String -Value off -Force
# Disable Proxy
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name 'ProxySettings' -PropertyType String -Value '{"ProxyMode":"direct"}' -Force
# Disable Ask for Default
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name DefaultBrowserSettingEnabled -PropertyType Dword -Value 0 -Force
# Disable Flash
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name DefaultPluginsSetting -PropertyType Dword -Value 2 -Force
# Easter Egg
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name AllowDinosaurEasterEgg -PropertyType Dword -Value 1 -Force
# Disable Automatic Google Account Browser Signin
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name BrowserSignin -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name SyncDisabled -PropertyType Dword -Value 1 -Force
# Privacy Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name ShowFullUrlsInAddressBar -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name AdsSettingForIntrusiveAdsSites -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name ChromeCleanupReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name SpellCheckServiceEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name UserFeedbackAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name SearchSuggestEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name SafeBrowsingExtendedReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name BackgroundModeEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name MetricsReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name PromotionalTabsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name CloudReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name UrlKeyedAnonymizedDataCollectionEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name BlockThirdPartyCookies -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name RestoreOnStartup -PropertyType Dword -Value 5 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name ShowAppsShortcutInBookmarkBar -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name PromptForDownloadLocation -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name WebRtcEventLogCollectionAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name ChromeCleanupEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name DeveloperToolsAvailability -PropertyType Dword -Value 1 -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name MediaRecommendationsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name AdvancedProtectionAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name SuppressUnsupportedOSWarning -PropertyType Dword -Value 1 -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name BookmarkBarEnabled -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name AlwaysOpenPdfExternally -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name DefaultFileSystemReadGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name DefaultFileSystemWriteGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name DefaultInsecureContentSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name DefaultPopupsSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name DefaultSerialGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name DefaultWebBluetoothGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name DefaultWebUsbGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name EnableMediaRouter -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name ShowCastIconInToolbar -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name AutoplayAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name AutofillAddressEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\Recommended' -Name AutofillCreditCardEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium' -Name HideWebStoreIcon -PropertyType Dword -Value 1 -Force

# -----------------
# Firefox
# -----------------

# Extension Settings and force-install
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name 'ExtensionSettings' -PropertyType String -Value '{"*":{"installation_mode":"allowed"},"uBlock0@raymondhill.net":{"installation_mode":"force_installed","install_url":"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"},"sponsorBlocker@ajay.app":{"installation_mode":"force_installed","install_url":"https://addons.mozilla.org/firefox/downloads/file/3662396/sponsorblock_skip_sponsorships_on_youtube-2.0.7-an+fx.xpi"},"{74145f27-f039-47ce-a470-a662b129930a}":{"installation_mode":"force_installed","install_url":"https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi"},"bypasspaywalls@bypasspaywalls.weebly.com":{"installation_mode":"force_installed","install_url":"https://github.com/iamadamdev/bypass-paywalls-chrome/releases/latest/download/bypass-paywalls-firefox.xpi"},"adblock-for-ff-lite@addons":{"installation_mode":"blocked"},"jid1-NIfFY2CA8fy1tg@jetpack":{"installation_mode":"blocked"},"adblockultimate@adblockultimate.net":{"installation_mode":"blocked"},"{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}":{"installation_mode":"blocked"},"adguardadblocker@adguard.com":{"installation_mode":"blocked"},"{da6554a8-470c-4d6a-a6ca-904740683552}":{"installation_mode":"blocked"},"jid1-93CWPmRbVPjRQA@jetpack":{"installation_mode":"blocked"},"87677a2c52b84ad3a151a4a72f5bd3c4@jetpack":{"installation_mode":"blocked"},"{6601dd36-5bb6-4755-8cd5-f36b59ff5307}":{"installation_mode":"blocked"},"{01e4670b-532b-42ed-88c2-c7b46d05133a}":{"installation_mode":"blocked"},"languagetool-webextension@languagetool.org":{"installation_mode":"blocked"}}' -Force
# (Other adblockers interfere with ublock origin)
# Extension List
# 1) Adblock: adblock-for-ff-lite@addons ; jid1-NIfFY2CA8fy1tg@jetpack
# 2) Adblock Ultimate: adblockultimate@adblockultimate.net
# 3) Adblock Plus: {d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}
# 4) Adguard: adguardadblocker@adguard.com
# 5) Proctor Test: {da6554a8-470c-4d6a-a6ca-904740683552}
# 6) Honey: jid1-93CWPmRbVPjRQA@jetpack
# 7) Grammarly: 87677a2c52b84ad3a151a4a72f5bd3c4@jetpack ; {6601dd36-5bb6-4755-8cd5-f36b59ff5307} ; {01e4670b-532b-42ed-88c2-c7b46d05133a} ; languagetool-webextension@languagetool.org

# Disable Notfications and Location
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications' -Name BlockNewRequests -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications' -Name Locked -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location' -Name BlockNewRequests -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location' -Name Locked -PropertyType Dword -Value 1 -Force
# Default Permissions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera' -Name BlockNewRequests -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Camera' -Name Locked -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone' -Name BlockNewRequests -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Microphone' -Name Locked -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality' -Name BlockNewRequests -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\VirtualReality' -Name Locked -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay' -Name 'Default' -PropertyType String -Value 'block-audio-video' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay' -Name Locked -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Permissions' -Name DisableDeveloperTools -PropertyType Dword -Value 0 -Force
# Disable DNS over HTTPS
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS' -Name Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS' -Name Locked -PropertyType Dword -Value 1 -Force
# Disable Proxy
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Proxy' -Name Mode -PropertyType String -Value none -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Proxy' -Name Locked -PropertyType Dword -Value 1 -Force
# Disable Ask for Default
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name DontCheckDefaultBrowser -PropertyType Dword -Value 1 -Force
# Disable Flash
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin' -Name Default -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\FlashPlugin' -Name Locked -PropertyType Dword -Value 1 -Force
# Disable Pocket and Clean Home Page
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name DisablePocket -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome' -Name Search -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome' -Name TopSites -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome' -Name Highlights -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome' -Name Pocket -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome' -Name Snippets -PropertyType Dword -Value 0 -Force
# About Config Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name 'Preferences' -PropertyType String -Value '{"browser.search.suggest.enabled":{"Value":false,"Status":"locked"},"browser.search.suggest.enabled.private":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.bookmark":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.history":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.openpage":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.searches":{"Value":false,"Status":"locked"},"browser.urlbar.suggest.topsites":{"Value":false,"Status":"locked"},"browser.urlbar.update1.searchTips":{"Value":false,"Status":"locked"},"browser.urlbar.update1.interventions":{"Value":false,"Status":"locked"},"browser.aboutConfig.showWarning":{"Value":false,"Status":"default"},"browser.tabs.warnOnClose":{"Value":false,"Status":"default"},"browser.tabs.warnOnCloseOtherTabs":{"Value":false,"Status":"default"},"browser.urlbar.trimURLs":{"Value":false,"Status":"locked"},"browser.disableResetPrompt":{"Value":true,"Status":"default"},"browser.newtabpage.activity-stream.section.highlights.includeBookmarks":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includeDownloads":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includePocket":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.section.highlights.includeVisited":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.showSponsored":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.showSponsoredTopSites":{"Value":false,"Status":"locked"},"browser.tabs.crashReporting.sendReport":{"Value":false,"Status":"locked"},"geo.enabled":{"Value":false,"Status":"locked"},"geo.provider.ms-windows-location":{"Value":false,"Status":"locked"},"security.insecure_connection_text.enabled":{"Value":true,"Status":"locked"},"security.insecure_connection_text.pbmode.enabled":{"Value":true,"Status":"locked"},"accessibility.force_disabled":{"Value":1,"Status":"locked"},"dom.battery.enabled":{"Value":false,"Status":"locked"},"network.http.sendRefererHeader":{"Value":0,"Status":"default"},"media.videocontrols.picture-in-picture.keyboard-controls.enabled":{"Value":true,"Status":"default"},"browser.formfill.enable":{"Value":false,"Status":"default"},"network.dns.disablePrefetch":{"Value":true,"Status":"locked"},"network.dns.disablePrefetchFromHTTPS":{"Value":true,"Status":"locked"},"network.prefetch-next":{"Value":false,"Status":"locked"},"network.predictor.enabled":{"Value":false,"Status":"locked"},"network.predictor.enable-prefetch":{"Value":false,"Status":"locked"},"browser.urlbar.speculativeConnect.enabled":{"Value":false,"Status":"locked"},"browser.send_pings":{"Value":false,"Status":"locked"},"media.eme.enabled":{"Value":false,"Status":"locked"},"media.gmp-widevinecdm.enabled":{"Value":false,"Status":"locked"},"media.navigator.enabled":{"Value":false,"Status":"default"},"browser.newtabpage.activity-stream.feeds.telemetrybrowser.newtabpage.activity-stream.telemetry":{"Value":false,"Status":"locked"},"browser.pingcentre.telemetry":{"Value":false,"Status":"locked"},"media.wmf.deblacklisting-for-telemetry-in-gpu-process":{"Value":false,"Status":"locked"},"extensions.htmlaboutaddons.recommendations.enabled":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons":{"Value":false,"Status":"locked"},"browser.messaging-system.whatsNewPanel.enabled":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.section.topstories":{"Value":false,"Status":"locked"},"browser.newtabpage.activity-stream.feeds.snippets":{"Value":false,"Status":"locked"},"browser.ctrlTab.recentlyUsedOrder":{"Value":false,"Status":"default"},"browser.crashReports.unsubmittedCheck.enabled":{"Value":false,"Status":"locked"},"browser.crashReports.unsubmittedCheck.autoSubmit2":{"Value":false,"Status":"locked"},"print.always_print_silent":{"Value":false,"Status":"locked"},"print.tab_modal.enabled":{"Value":true,"Status":"default"},"media.hardwaremediakeys.enabled":{"Value":false,"Status":"default"},"accessibility.blockautorefresh":{"Value":false,"Status":"locked"},"extensions.formautofill.creditCards.enabled":{"Value":false,"Status":"default"},"extensions.formautofill.addresses.enabled":{"Value":false,"Status":"default"},"ui.key.menuAccessKeyFocuses":{"Value":false,"Status":"locked"}}' -Force
# Privacy Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\Cookies' -Name AcceptThirdParty -PropertyType String -Value never -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name DisableFirefoxStudies -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name DisableSetDesktopBackground -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name DisableTelemetry -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name PromptForDownloadLocation -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name BlockAboutSupport -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name DisableFeedbackCommands -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name OverrideFirstRunPage -PropertyType String -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name OverridePostUpdatePage -PropertyType String -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name NoDefaultBookmarks -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name DisplayBookmarksToolbar -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name 'DisplayMenuBar' -PropertyType String -Value 'default-off' -Force
Remove-Item -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging' -Force

# -----------------
# Brave
# -----------------

# Extensions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist' -Name 1 -PropertyType String -Value cjpalhdlnbpafiamejdnhcphjbkeiagm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist' -Name 2 -PropertyType String -Value mnjggcdmjocbbbhaepdhchncahnbgone -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallAllowlist' -Name 3 -PropertyType String -Value lckanjgmijmafbedllaakclkaicjfmnk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist' -Name 1 -PropertyType String -Value cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist' -Name 2 -PropertyType String -Value mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallForcelist' -Name 3 -PropertyType String -Value lckanjgmijmafbedllaakclkaicjfmnk;https://clients2.google.com/service/update2/crx -Force
# Extension Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name ExtensionSettings -PropertyType String -Value '{"*": {"blocked_permissions": ["vpnProvider","webRequest","webRequestBlocking","geolocation","declarativeNetRequest","declarativeNetRequestFeedback","declarativeWebRequest"]},"cjpalhdlnbpafiamejdnhcphjbkeiagm": {},"lckanjgmijmafbedllaakclkaicjfmnk": {}}' -Force
# Import Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name ImportAutofillFormData -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name ImportBookmarks -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name ImportHistory -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name ImportHomepage -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name ImportSavedPasswords -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name ImportSearchEngine -PropertyType Dword -Value 0 -Force
# Disable Notifications and Location
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name DefaultGeolocationSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name DefaultNotificationsSetting -PropertyType Dword -Value 2 -Force
# Disable DNS over HTTPS
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name DnsOverHttpsMode -PropertyType String -Value off -Force
# Disable Proxy
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name 'ProxySettings' -PropertyType String -Value '{"ProxyMode":"direct"}' -Force
# Disable Ask for Default
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name DefaultBrowserSettingEnabled -PropertyType Dword -Value 0 -Force
# Disable Flash
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name DefaultPluginsSetting -PropertyType Dword -Value 2 -Force
# Brave Tor
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name TorDisabled -PropertyType Dword -Value 1 -Force
# Privacy Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name ShowFullUrlsInAddressBar -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name SpellCheckServiceEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name UserFeedbackAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name SearchSuggestEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name SafeBrowsingExtendedReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name BackgroundModeEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name MetricsReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name PromotionalTabsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name CloudReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name UrlKeyedAnonymizedDataCollectionEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name BlockThirdPartyCookies -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name RestoreOnStartup -PropertyType Dword -Value 5 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name ShowAppsShortcutInBookmarkBar -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name PromptForDownloadLocation -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name WebRtcEventLogCollectionAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name DeveloperToolsAvailability -PropertyType Dword -Value 1 -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name MediaRecommendationsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name AdvancedProtectionAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave' -Name SuppressUnsupportedOSWarning -PropertyType Dword -Value 1 -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name BookmarkBarEnabled -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name AlwaysOpenPdfExternally -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name DefaultFileSystemReadGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name DefaultFileSystemWriteGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name DefaultInsecureContentSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name DefaultPopupsSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name DefaultSerialGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name DefaultWebBluetoothGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name DefaultWebUsbGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name EnableMediaRouter -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name ShowCastIconInToolbar -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name AutoplayAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name AutofillAddressEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\Recommended' -Name AutofillCreditCardEnabled -PropertyType Dword -Value 0 -Force

# -----------------
# Microsoft Edge Chromium
# -----------------

# Disable Auto-Install
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\EdgeUpdate' -Name DoNotUpdateToEdgeWithChromium -PropertyType Dword -Value 1 -Force
# Extensions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist' -Name 1 -PropertyType String -Value odfafepnkmbhccpbejgmiehpchacaeak -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist' -Name 2 -PropertyType String -Value mbmgnelfcpoecdepckhlhegpcehmpmji -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist' -Name 3 -PropertyType String -Value mdkdmaickkfdekbjdoojfalpbkgaddei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist' -Name 1 -PropertyType String -Value odfafepnkmbhccpbejgmiehpchacaeak;https://edge.microsoft.com/extensionwebstorebase/v1/crx -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist' -Name 2 -PropertyType String -Value mbmgnelfcpoecdepckhlhegpcehmpmji;https://edge.microsoft.com/extensionwebstorebase/v1/crx -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist' -Name 3 -PropertyType String -Value mdkdmaickkfdekbjdoojfalpbkgaddei;https://edge.microsoft.com/extensionwebstorebase/v1/crx -Force
# Extension Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name ExtensionSettings -PropertyType String -Value '{"*": {"blocked_permissions": ["vpnProvider","webRequest","webRequestBlocking","geolocation","declarativeNetRequest","declarativeNetRequestFeedback","declarativeWebRequest"]},"cjpalhdlnbpafiamejdnhcphjbkeiagm": {},"lckanjgmijmafbedllaakclkaicjfmnk": {}}' -Force
# Import Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name AutoImportAtFirstRun -PropertyType Dword -Value 4 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\EdgeUpdate' -Name CreateDesktopShortcutDefault -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name HideFirstRunExperience -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportAutofillFormData -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportBrowserSettings -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportCookies -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportExtensions -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportFavorites -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportHistory -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportOpenTabs -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportPaymentInfo -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportSavedPasswords -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportSearchEngine -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ImportShortcuts -PropertyType Dword -Value 0 -Force
# Disable Notifications and Location
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name DefaultNotificationsSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name DefaultGeolocationSetting -PropertyType Dword -Value 2 -Force
# Disable DNS over HTTPS
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name DnsOverHttpsMode -PropertyType String -Value off -Force
# Disable Proxy
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name 'ProxySettings' -PropertyType String -Value '{"ProxyMode":"direct"}' -Force
# Disable ask for Default
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name DefaultBrowserSettingEnabled -PropertyType Dword -Value 0 -Force
# Disable Flash
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name DefaultPluginsSetting -PropertyType Dword -Value 2 -Force
# Easter Egg
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name AllowSurfGame -PropertyType Dword -Value 1 -Force
# Privacy Settings
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name AddressBarMicrosoftSearchInBingProviderEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name AdsSettingForIntrusiveAdsSites -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name AlternateErrorPagesEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name BackgroundModeEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name LocalProvidersEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name PersonalizationReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name PromptForDownloadLocation -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name SearchSuggestEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name UserFeedbackAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name ResolveNavigationErrorsUseWebService -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name NewTabPageHideDefaultTopSites -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name NewTabPagePrerenderEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name NewTabPageAllowedBackgroundTypes -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name DiagnosticData -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name EdgeCollectionsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name EdgeShoppingAssistantEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\CollectionsServicesAndExportsBlockList' -Name 1 -PropertyType String -Value pinterest_suggestions -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name BlockThirdPartyCookies -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name NewTabPagePrerenderEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name RestoreOnStartup -PropertyType Dword -Value 5 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name NewTabPageHideDefaultTopSites -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name AllowWebContentOnNewTabPage -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name SpotlightExperiencesAndRecommendationsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name NewTabPagePrerenderEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name PersonalizationReportingEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name NewTabPageSearchBox -PropertyType String -Value redirect -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name HideInternetExplorerRedirectUXForIncompatibleSitesEnabled -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name ShowMicrosoftRewards -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name familySafetySettingsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name DeveloperToolsAvailability -PropertyType Dword -Value 1 -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name MediaRecommendationsEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name AdvancedProtectionAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name SuppressUnsupportedOSWarning -PropertyType Dword -Value 1 -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name BookmarkBarEnabled -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name AlwaysOpenPdfExternally -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name DefaultFileSystemReadGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name DefaultFileSystemWriteGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name DefaultInsecureContentSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name DefaultPopupsSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name DefaultSerialGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name DefaultWebBluetoothGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name DefaultWebUsbGuardSetting -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name EnableMediaRouter -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name ShowCastIconInToolbar -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name AutoplayAllowed -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name AutofillAddressEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name AutofillCreditCardEnabled -PropertyType Dword -Value 0 -Force

# -----------------
# Microsoft Edge Legacy
# -----------------

# First Run
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name AllowPrelaunch -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader' -Name AllowTabPreloading -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader' -Name PreventTabPreloading -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name PreventFirstRunPage -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name SyncFavoritesBetweenIEAndMicrosoftEdge -PropertyType Dword -Value 0 -Force
# Sync
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableSettingSyn -PropertyType Dword -Value 2 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name DisableWebBrowserSettingSyncUserOverride -PropertyType Dword -Value 2 -Force
# Browsing History
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\KioskMode' -Name ConfigureKioskMode -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name AllowSavingHistory -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Privacy' -Name ClearBrowsingHistoryOnExit -PropertyType Dword -Value 1 -Force
# Flash
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons' -Name FlashPlayerEnabled -PropertyType Dword -Value 0 -Force
# New Tab Page
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI' -Name ShowOneBox -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI' -Name AllowWebContentOnNewTabPage -PropertyType Dword -Value 0 -Force
# Default Browser Prompt
New-ItemProperty -Path 'HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main' -Name DisallowDefaultBrowserPrompt -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main' -Name DisallowDefaultBrowserPrompt -PropertyType Dword -Value 1 -Force
# Suggestions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes' -Name ShowSearchSuggestionsGlobal -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name 'Use FormSuggest' -PropertyType String -Value no -Force
# Telemetry
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary' -Name EnableExtendedBooksTelemetry -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name PreventLiveTileDataCollection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name MicrosoftEdgeDataOptIn -PropertyType Dword -Value 0 -Force
# Other
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary' -Name AllowConfigurationUpdateForBooksLibrary -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary' -Name UseSharedFolderForBooks -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Internet Settings' -Name ConfigureHomeButton -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name AlwaysEnableBooksLibrary -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name PreventAccessToAboutFlagsInMicrosoftEdge -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter' -Name PreventOverride -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter' -Name PreventOverrideAppRepUnknown -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' -Name Cookies -PropertyType Dword -Value 1 -Force

# -----------------
# Internet Explorer
# -----------------

# First Run
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer' -Name DisableImportExportFavorites -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main' -Name DisableFirstRunCustomize -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode' -Name ShowMessageWhenOpeningSitesInMicrosoftEdge -PropertyType Dword -Value 0 -Force
# Browsing History
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel' -Name DisableDeleteBrowsingHistory -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel' -Name DisableDeleteForms -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel' -Name History -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name ClearBrowsingHistoryOnExit -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name CleanCookies -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name CleanDownloadHistory -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name CleanHistory -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name CleanInPrivateBlocking -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name CleanTrackingProtection -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name CleanTIF -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Privacy' -Name UseAllowList -PropertyType Dword -Value 0 -Force
# Flash
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer' -Name DisableFlashInIE -PropertyType Dword -Value 1 -Force
# Start Page
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\ContinuousBrowsing' -Name Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main' -Name 'Start Page' -PropertyType String -Value about:blank -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main' -Name Default -PropertyType String -Value about:blank -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main' -Name 'Start Page' -PropertyType String -Value about:blank -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main' -Name Default -PropertyType String -Value about:blank -Force
New-ItemProperty -Path 'HKU:\Default\Software\Microsoft\Internet Explorer\Main' -Name 'Start Page' -PropertyType String -Value about:blank -Force
New-ItemProperty -Path 'HKU:\Default\Software\Microsoft\Internet Explorer\Main' -Name Default -PropertyType String -Value about:blank -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Recovery' -Name NoReopenLastSession -PropertyType Dword -Value 1 -Force
# Default Browser Prompt
New-ItemProperty -Path 'HKLM:\Default\Software\Microsoft\Internet Explorer\Main' -Name 'Check_Associations' -PropertyType String -Value 'no' -Force
New-ItemProperty -Path 'HKCU:\Default\Software\Microsoft\Internet Explorer\Main' -Name 'Check_Associations' -PropertyType String -Value 'no' -Force
# Suggestions
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions' -Name NoHelpItemSendFeedback -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions' -Name NoHelpItemSendFeedback -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main' -Name ShowContentAdvisor -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\DomainSuggestion' -Name Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions' -Name NoHelpMenu -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM' -Name DisableCustomerImprovementProgram -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites' -Name Enabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes' -Name ShowSearchSuggestionsGlobal -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes' -Name DisplayQuickPick -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\SearchScopes' -Name TopResult -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main' -Name HideNewEdgeButton -PropertyType Dword -Value 0 -Force
# Other
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Geolocation' -Name PolicyDisableGeolocation -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions' -Name NoSearchBox -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions' -Name NoSplash -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main' -Name EnableAutoUpgrade -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main' -Name AllowWindowReuse -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main' -Name NoReportSiteProblems -PropertyType String -Value yes -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode' -Name RestrictIE -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\FormatDetection' -Name PhoneNumberEnabled -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main\WindowsSearch' -Name EnabledScopes -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter' -Name PreventOverride -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter' -Name PreventOverrideAppRepUnknown -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter' -Name Enabled -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Restrictions' -Name RestrictPopupExceptionList -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Safety\PrivacIE' -Name DisableLogging -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Security' -Name DisableFixSecuritySettings -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Security' -Name DisableSecuritySettingsCheck -PropertyType Dword -Value 1 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing' -Name NewTabPageShow -PropertyType Dword -Value 0 -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\TabbedBrowsing' -Name PopupsUseNewWindow -PropertyType Dword -Value 2 -Force

# -----------------
# Block Bad Extensions/Addons (Chrome, Chromium, Firefox, Brave, and Edge Chromium)
# -----------------
# -----------------
# Chrome
# -----------------
# (Other adblockers interfere with ublock origin)
# Adblock Plus
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 2 -PropertyType String -Value cfhdojbkjhnklbpkdaibdccddilifddb -Force
# Adblock
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 3 -PropertyType String -Value gighmmpiobklfepjocnamgkkbiglidom -Force
# Fair Adblocker
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 4 -PropertyType String -Value lgblnfidahcdcjddiepkckcfdhpknnjh -Force
# uBlock (non-origin)
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 5 -PropertyType String -Value epcnnfbjfcgphgdmggkamkmgojdagdnn -Force
# Adblock Ultimate
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 6 -PropertyType String -Value ohahllgiabjaoigichmmfljhkcfikeof -Force
# Adguard
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 7 -PropertyType String -Value bgnkhhnnamicmpeenaelnjfhikgbkllg -Force
# -----
# Grammarly
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 8 -PropertyType String -Value kbfnbcaeplbcioakkpcpgfkobkghlhen -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 9 -PropertyType String -Value noojmhngiheennhgaffkfboanjpbkpep -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 10 -PropertyType String -Value bjodbpcjeogaihbekannledankhcjbgo -Force
# Honey
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 11 -PropertyType String -Value bmnlcjabgnpnenekpadlanbbkooimhnj -Force
# Avast
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 12 -PropertyType String -Value gomekmidlodglbbmalcneegieacbdmki -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 13 -PropertyType String -Value eofcbnmajmjmplflapaojjnihcjkigck -Force
# AVG
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 14 -PropertyType String -Value nbmoafcmbajniiapeidgficgifbfmjfo -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 15 -PropertyType String -Value mbckjcfnjmoiinpgddefodcighgikkgn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 16 -PropertyType String -Value ggimcfhnklgjpgehibgfmoidcgmbhppm -Force
# Hola
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 17 -PropertyType String -Value kcdahmgmaagjhocpipbodaokikjkampi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 18 -PropertyType String -Value gkojfkhlekighikafcpjkiklfbnlmeio -Force
# Norton
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 19 -PropertyType String -Value lpognpnpncelknkahlngpojfjgdmkodn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 20 -PropertyType String -Value eoigllimhcllmhedfbmahegmoakcdakd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 21 -PropertyType String -Value napjheenlliimoedooldaalpjfidlidp -Force
# Mcafee
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 22 -PropertyType String -Value klekeajafkkpokaofllcadenjdckhinm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 23 -PropertyType String -Value cmendinpapjjojakimjlmkkkcmnojefg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 24 -PropertyType String -Value jjkchpdmjjdmalgembblgafllbpcjlei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 25 -PropertyType String -Value lkdiimaiohgpacfbgedcipmgigppaofn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 26 -PropertyType String -Value kaedchgajfpgipflgbgeeiiajekblklm -Force
# Web of Trust
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 27 -PropertyType String -Value bhmmomiinigofkjcapegjjndpbikblnp -Force
# Adobe
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 28 -PropertyType String -Value efaidnbmnnnibpcajpcglclefindmkaj -Force
# Microsoft Annoyances
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 29 -PropertyType String -Value pedmlpceiodameienmmkpkkpilgklmfh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 30 -PropertyType String -Value fbgcedjacmlbgleddnoacbnijgmiolem -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 31 -PropertyType String -Value dhelmjcpoddajfaldodimlaehbalhgag -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 32 -PropertyType String -Value obdappnhkfoejojnmcohppfnoeagadna -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 33 -PropertyType String -Value bkbeeeffjjeopflfhgeknacdieedcoml -Force
# -----
# Fake TikTok
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 34 -PropertyType String -Value bjflcommipadapdldncoacffcccldlkm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 35 -PropertyType String -Value niljfkkadomdhekbkamcdlmokhnklign -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 36 -PropertyType String -Value agnbmfinlfpgonkehceknkpapgoibdno -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 37 -PropertyType String -Value dedphjedjalglppdfpmmibdbbkmifnbb -Force
# Fake Flash 
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 38 -PropertyType String -Value mcakfkioeanhfiojkchcndahgagcidbd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 39 -PropertyType String -Value nddmmcpmdbkooddfjcohmlcfclhllgeh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 40 -PropertyType String -Value fnipglnbhfacfmefbgiiodalehbcgcbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 41 -PropertyType String -Value fldkdmkgnlbehfgeifjpjabmandnchpe -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 42 -PropertyType String -Value aiccdefnpjkolgnpdamdimejlfmopcca -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 43 -PropertyType String -Value mdjjpkalmajfkhnamkekeljbfenponih -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 44 -PropertyType String -Value kppfgjkgimgbanjbbgpmccbkagcebnid -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 45 -PropertyType String -Value omimccinlhlkpjaeaocglgmkbelejlhj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 46 -PropertyType String -Value cngjoacjdpnadhhjpdppcdjboiclnclc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 47 -PropertyType String -Value hloblpeplfiajnfdengendhdnpmdgagn -Force
# Fake Adblockers
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 48 -PropertyType String -Value gmdffbblaahnjmpcjaenakkdplibibge -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 49 -PropertyType String -Value maekfnoeejhpjfkfmdlckioggdcdofpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 50 -PropertyType String -Value cmedhionkhpnakcndndgjdbohmhepckk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 51 -PropertyType String -Value gpbfjnhlnemfnhajnmkjicfmbagfbejm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 52 -PropertyType String -Value gkhnanmhgeggclieoggjehkloolfkbdo -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 53 -PropertyType String -Value oldifepkckfmnlokobgdbjjfjjmhfgag -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 54 -PropertyType String -Value megdnjjcjgoiacejpegmfoeooleddmeb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 55 -PropertyType String -Value pedpfddehkfmobhbnccdcbhidojinimh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 56 -PropertyType String -Value khnleagcghdbpphacgjjkcoceilngecl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 57 -PropertyType String -Value cegbjdefhfnbphoghdgcapnliodjbncp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 58 -PropertyType String -Value emngkmlligggbbiioginlkphcmffbncb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 59 -PropertyType String -Value jompdinfdpijbcngkadcdaladbochoae -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 60 -PropertyType String -Value pkocadmokmpjeeaimigjpmfpdaighkga -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 61 -PropertyType String -Value jaeigffnocnbblojlfmiimdocmfcjkii -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 62 -PropertyType String -Value ppdonaappkjkbgbncmmjencphdclioab -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 63 -PropertyType String -Value lalfpjdbhpmnhfofkckdpkljeilmogfl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 64 -PropertyType String -Value alcmakjhknigccfidaelkafjmfifkhkc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 65 -PropertyType String -Value fmaicbnbcbjgbpecclcnaehmbpjpdane -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 66 -PropertyType String -Value icegedoajhdclokfmeobnnbalabmpehm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 67 -PropertyType String -Value jhpheijfhpbkaejncokigfaihgdndjhg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 68 -PropertyType String -Value jbbmlecgjpijkeelnebilpekpnkaoool -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 69 -PropertyType String -Value gokhabgljglbmjilkmelajgkkhofeeij -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 70 -PropertyType String -Value klapabjimnakejfmpdolgamfplaondck -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 71 -PropertyType String -Value pclbpfjdhojdfcojcmmgggaanfnmhifk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 72 -PropertyType String -Value dhdpjhfemdchgdfngofnkgmabdmchoii -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 73 -PropertyType String -Value ckjbcmkjhocgdhmkkkieknbmhdnjanoh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 74 -PropertyType String -Value fkjdaikpmbninlknfjgehkoggdgmknel -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 75 -PropertyType String -Value eilkefcdofnagepelocjipipghaalkam -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 76 -PropertyType String -Value ocbcobiceiagblnejkcekbpgpakolhff -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 77 -PropertyType String -Value lkcohpjckebdgmdofkdfppgeejccjmnl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 78 -PropertyType String -Value pedpfddehkfmobhbnccdcbhidojinimh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 79 -PropertyType String -Value fhjieeiddoiibfbdknfligkjlpihnmjc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 80 -PropertyType String -Value bkalmigiilcgdihccnaonhnkdhpfbaam -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 81 -PropertyType String -Value gkkehpomgpdgkdmbdfkangmbafecdhhd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 82 -PropertyType String -Value inejjjikomlbaahobecdaoaillmfejil -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 83 -PropertyType String -Value kllohiclobgoaffphlofnjdlabflpgha -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 84 -PropertyType String -Value ececmkgelhdncajgmofiffjmhojnimmb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 85 -PropertyType String -Value fjadbbodmeifhkgepjjkeneeojammfag -Force
# VPN
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 86 -PropertyType String -Value kalfeohpimfncbfhjhanngehpbfilokk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 87 -PropertyType String -Value nlbejmccbhkncgokjcmghpfloaajcffj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 88 -PropertyType String -Value ejkaocphofnobjdedneohbbiilggdlbi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 89 -PropertyType String -Value bihmplhobchoageeokmgbdihknkjbknd -Force
# Other
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 90 -PropertyType String -Value aleggpabliehgbeagmfhnodcijcmbonb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 91 -PropertyType String -Value fpmapakogndmenjcfoajifaaonnkpkei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 92 -PropertyType String -Value digojkgonhgmnohbapdfjllpnmjmdhpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 93 -PropertyType String -Value llkbempahblbohpipifajipejjackemi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 94 -PropertyType String -Value nplnfhpilojbbcnjpiaoecppkkicfgfp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 95 -PropertyType String -Value hkjemkcbndldepdbnbdnibeppofoooio -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 96 -PropertyType String -Value nlhaleloflnhpemagojabiikkkejjlgp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 97 -PropertyType String -Value jeajkcogjepdpppofeocjpejdckbgdco -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 98 -PropertyType String -Value eekepadogplleogcggcjkfebfjhihlnm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 99 -PropertyType String -Value mmknfaojcgjcelkoabokhaljjapiogbg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 100 -PropertyType String -Value jalmmnpclgbgcphkbnglcnlobgcbhkki -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 101 -PropertyType String -Value hkegehhbmbongohpgmdadkbkmnfokicn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 102 -PropertyType String -Value odfnofpjippoimohokldpheacfenmfch -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 103 -PropertyType String -Value igcpjndghfaebohjdanobonebnejppej -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 104 -PropertyType String -Value oobhlpildfogoccaffnfckililknpcbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 105 -PropertyType String -Value hkjemkcbndldepdbnbdnibeppofoooio -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 106 -PropertyType String -Value nlhaleloflnhpemagojabiikkkejjlgp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 107 -PropertyType String -Value jmgacjgobknfojonlckhndlamkfcjofm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 108 -PropertyType String -Value gfceeghcoekcmlpgonlplkpmakdmpgmg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 109 -PropertyType String -Value kfgffakpbnpfonmljmpfamjpnjbhfiij -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 110 -PropertyType String -Value bbebbhmelpcfmijoanocdliephmoahln -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 111 -PropertyType String -Value igcpjndghfaebohjdanobonebnejppej -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 112 -PropertyType String -Value digojkgonhgmnohbapdfjllpnmjmdhpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist' -Name 113 -PropertyType String -Value goobgennebinldhonaajgafidboenlkl -Force


# -----------------
# Chromium
# -----------------
# (Other adblockers interfere with ublock origin)
# Adblock Plus
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 2 -PropertyType String -Value cfhdojbkjhnklbpkdaibdccddilifddb -Force
# Adblock
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 3 -PropertyType String -Value gighmmpiobklfepjocnamgkkbiglidom -Force
# Fair Adblocker
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 4 -PropertyType String -Value lgblnfidahcdcjddiepkckcfdhpknnjh -Force
# uBlock (non-origin)
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 5 -PropertyType String -Value epcnnfbjfcgphgdmggkamkmgojdagdnn -Force
# Adblock Ultimate
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 6 -PropertyType String -Value ohahllgiabjaoigichmmfljhkcfikeof -Force
# Adguard
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 7 -PropertyType String -Value bgnkhhnnamicmpeenaelnjfhikgbkllg -Force
# -----
# Grammarly
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 8 -PropertyType String -Value kbfnbcaeplbcioakkpcpgfkobkghlhen -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 9 -PropertyType String -Value noojmhngiheennhgaffkfboanjpbkpep -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 10 -PropertyType String -Value bjodbpcjeogaihbekannledankhcjbgo -Force
# Honey
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 11 -PropertyType String -Value bmnlcjabgnpnenekpadlanbbkooimhnj -Force
# Avast
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 12 -PropertyType String -Value gomekmidlodglbbmalcneegieacbdmki -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 13 -PropertyType String -Value eofcbnmajmjmplflapaojjnihcjkigck -Force
# AVG
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 14 -PropertyType String -Value nbmoafcmbajniiapeidgficgifbfmjfo -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 15 -PropertyType String -Value mbckjcfnjmoiinpgddefodcighgikkgn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 16 -PropertyType String -Value ggimcfhnklgjpgehibgfmoidcgmbhppm -Force
# Hola
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 17 -PropertyType String -Value kcdahmgmaagjhocpipbodaokikjkampi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 18 -PropertyType String -Value gkojfkhlekighikafcpjkiklfbnlmeio -Force
# Norton
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 19 -PropertyType String -Value lpognpnpncelknkahlngpojfjgdmkodn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 20 -PropertyType String -Value eoigllimhcllmhedfbmahegmoakcdakd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 21 -PropertyType String -Value napjheenlliimoedooldaalpjfidlidp -Force
# Mcafee
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 22 -PropertyType String -Value klekeajafkkpokaofllcadenjdckhinm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 23 -PropertyType String -Value cmendinpapjjojakimjlmkkkcmnojefg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 24 -PropertyType String -Value jjkchpdmjjdmalgembblgafllbpcjlei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 25 -PropertyType String -Value lkdiimaiohgpacfbgedcipmgigppaofn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 26 -PropertyType String -Value kaedchgajfpgipflgbgeeiiajekblklm -Force
# Web of Trust
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 27 -PropertyType String -Value bhmmomiinigofkjcapegjjndpbikblnp -Force
# Adobe
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 28 -PropertyType String -Value efaidnbmnnnibpcajpcglclefindmkaj -Force
# Microsoft Annoyances
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 29 -PropertyType String -Value pedmlpceiodameienmmkpkkpilgklmfh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 30 -PropertyType String -Value fbgcedjacmlbgleddnoacbnijgmiolem -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 31 -PropertyType String -Value dhelmjcpoddajfaldodimlaehbalhgag -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 32 -PropertyType String -Value obdappnhkfoejojnmcohppfnoeagadna -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 33 -PropertyType String -Value bkbeeeffjjeopflfhgeknacdieedcoml -Force
# -----
# Fake TikTok
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 34 -PropertyType String -Value bjflcommipadapdldncoacffcccldlkm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 35 -PropertyType String -Value niljfkkadomdhekbkamcdlmokhnklign -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 36 -PropertyType String -Value agnbmfinlfpgonkehceknkpapgoibdno -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 37 -PropertyType String -Value dedphjedjalglppdfpmmibdbbkmifnbb -Force
# Fake Flash 
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 38 -PropertyType String -Value mcakfkioeanhfiojkchcndahgagcidbd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 39 -PropertyType String -Value nddmmcpmdbkooddfjcohmlcfclhllgeh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 40 -PropertyType String -Value fnipglnbhfacfmefbgiiodalehbcgcbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 41 -PropertyType String -Value fldkdmkgnlbehfgeifjpjabmandnchpe -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 42 -PropertyType String -Value aiccdefnpjkolgnpdamdimejlfmopcca -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 43 -PropertyType String -Value mdjjpkalmajfkhnamkekeljbfenponih -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 44 -PropertyType String -Value kppfgjkgimgbanjbbgpmccbkagcebnid -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 45 -PropertyType String -Value omimccinlhlkpjaeaocglgmkbelejlhj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 46 -PropertyType String -Value cngjoacjdpnadhhjpdppcdjboiclnclc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 47 -PropertyType String -Value hloblpeplfiajnfdengendhdnpmdgagn -Force
# Fake Adblockers
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 48 -PropertyType String -Value gmdffbblaahnjmpcjaenakkdplibibge -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 49 -PropertyType String -Value maekfnoeejhpjfkfmdlckioggdcdofpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 50 -PropertyType String -Value cmedhionkhpnakcndndgjdbohmhepckk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 51 -PropertyType String -Value gpbfjnhlnemfnhajnmkjicfmbagfbejm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 52 -PropertyType String -Value gkhnanmhgeggclieoggjehkloolfkbdo -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 53 -PropertyType String -Value oldifepkckfmnlokobgdbjjfjjmhfgag -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 54 -PropertyType String -Value megdnjjcjgoiacejpegmfoeooleddmeb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 55 -PropertyType String -Value pedpfddehkfmobhbnccdcbhidojinimh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 56 -PropertyType String -Value khnleagcghdbpphacgjjkcoceilngecl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 57 -PropertyType String -Value cegbjdefhfnbphoghdgcapnliodjbncp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 58 -PropertyType String -Value emngkmlligggbbiioginlkphcmffbncb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 59 -PropertyType String -Value jompdinfdpijbcngkadcdaladbochoae -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 60 -PropertyType String -Value pkocadmokmpjeeaimigjpmfpdaighkga -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 61 -PropertyType String -Value jaeigffnocnbblojlfmiimdocmfcjkii -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 62 -PropertyType String -Value ppdonaappkjkbgbncmmjencphdclioab -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 63 -PropertyType String -Value lalfpjdbhpmnhfofkckdpkljeilmogfl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 64 -PropertyType String -Value alcmakjhknigccfidaelkafjmfifkhkc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 65 -PropertyType String -Value fmaicbnbcbjgbpecclcnaehmbpjpdane -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 66 -PropertyType String -Value icegedoajhdclokfmeobnnbalabmpehm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 67 -PropertyType String -Value jhpheijfhpbkaejncokigfaihgdndjhg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 68 -PropertyType String -Value jbbmlecgjpijkeelnebilpekpnkaoool -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 69 -PropertyType String -Value gokhabgljglbmjilkmelajgkkhofeeij -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 70 -PropertyType String -Value klapabjimnakejfmpdolgamfplaondck -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 71 -PropertyType String -Value pclbpfjdhojdfcojcmmgggaanfnmhifk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 72 -PropertyType String -Value dhdpjhfemdchgdfngofnkgmabdmchoii -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 73 -PropertyType String -Value ckjbcmkjhocgdhmkkkieknbmhdnjanoh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 74 -PropertyType String -Value fkjdaikpmbninlknfjgehkoggdgmknel -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 75 -PropertyType String -Value eilkefcdofnagepelocjipipghaalkam -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 76 -PropertyType String -Value ocbcobiceiagblnejkcekbpgpakolhff -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 77 -PropertyType String -Value lkcohpjckebdgmdofkdfppgeejccjmnl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 78 -PropertyType String -Value pedpfddehkfmobhbnccdcbhidojinimh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 79 -PropertyType String -Value fhjieeiddoiibfbdknfligkjlpihnmjc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 80 -PropertyType String -Value bkalmigiilcgdihccnaonhnkdhpfbaam -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 81 -PropertyType String -Value gkkehpomgpdgkdmbdfkangmbafecdhhd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 82 -PropertyType String -Value inejjjikomlbaahobecdaoaillmfejil -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 83 -PropertyType String -Value kllohiclobgoaffphlofnjdlabflpgha -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 84 -PropertyType String -Value ececmkgelhdncajgmofiffjmhojnimmb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 85 -PropertyType String -Value fjadbbodmeifhkgepjjkeneeojammfag -Force
# VPN
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 86 -PropertyType String -Value kalfeohpimfncbfhjhanngehpbfilokk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 87 -PropertyType String -Value nlbejmccbhkncgokjcmghpfloaajcffj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 88 -PropertyType String -Value ejkaocphofnobjdedneohbbiilggdlbi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 89 -PropertyType String -Value bihmplhobchoageeokmgbdihknkjbknd -Force
# Other
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 90 -PropertyType String -Value aleggpabliehgbeagmfhnodcijcmbonb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 91 -PropertyType String -Value fpmapakogndmenjcfoajifaaonnkpkei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 92 -PropertyType String -Value digojkgonhgmnohbapdfjllpnmjmdhpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 93 -PropertyType String -Value llkbempahblbohpipifajipejjackemi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 94 -PropertyType String -Value nplnfhpilojbbcnjpiaoecppkkicfgfp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 95 -PropertyType String -Value hkjemkcbndldepdbnbdnibeppofoooio -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 96 -PropertyType String -Value nlhaleloflnhpemagojabiikkkejjlgp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 97 -PropertyType String -Value jeajkcogjepdpppofeocjpejdckbgdco -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 98 -PropertyType String -Value eekepadogplleogcggcjkfebfjhihlnm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 99 -PropertyType String -Value mmknfaojcgjcelkoabokhaljjapiogbg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 100 -PropertyType String -Value jalmmnpclgbgcphkbnglcnlobgcbhkki -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 101 -PropertyType String -Value hkegehhbmbongohpgmdadkbkmnfokicn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 102 -PropertyType String -Value odfnofpjippoimohokldpheacfenmfch -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 103 -PropertyType String -Value igcpjndghfaebohjdanobonebnejppej -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 104 -PropertyType String -Value oobhlpildfogoccaffnfckililknpcbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 105 -PropertyType String -Value hkjemkcbndldepdbnbdnibeppofoooio -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 106 -PropertyType String -Value nlhaleloflnhpemagojabiikkkejjlgp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 107 -PropertyType String -Value jmgacjgobknfojonlckhndlamkfcjofm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 108 -PropertyType String -Value gfceeghcoekcmlpgonlplkpmakdmpgmg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 109 -PropertyType String -Value kfgffakpbnpfonmljmpfamjpnjbhfiij -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 110 -PropertyType String -Value bbebbhmelpcfmijoanocdliephmoahln -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 111 -PropertyType String -Value igcpjndghfaebohjdanobonebnejppej -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 112 -PropertyType String -Value digojkgonhgmnohbapdfjllpnmjmdhpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Chromium\ExtensionInstallBlocklist' -Name 113 -PropertyType String -Value goobgennebinldhonaajgafidboenlkl -Force

# -----------------
# Brave
# -----------------
# (Other adblockers interfere with ublock origin)
# Adblock Plus
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 2 -PropertyType String -Value cfhdojbkjhnklbpkdaibdccddilifddb -Force
# Adblock
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 3 -PropertyType String -Value gighmmpiobklfepjocnamgkkbiglidom -Force
# Fair Adblocker
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 4 -PropertyType String -Value lgblnfidahcdcjddiepkckcfdhpknnjh -Force
# uBlock (non-origin)
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 5 -PropertyType String -Value epcnnfbjfcgphgdmggkamkmgojdagdnn -Force
# Adblock Ultimate
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 6 -PropertyType String -Value ohahllgiabjaoigichmmfljhkcfikeof -Force
# Adguard
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 7 -PropertyType String -Value bgnkhhnnamicmpeenaelnjfhikgbkllg -Force
# -----
# Grammarly
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 8 -PropertyType String -Value kbfnbcaeplbcioakkpcpgfkobkghlhen -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 9 -PropertyType String -Value noojmhngiheennhgaffkfboanjpbkpep -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 10 -PropertyType String -Value bjodbpcjeogaihbekannledankhcjbgo -Force
# Honey
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 11 -PropertyType String -Value bmnlcjabgnpnenekpadlanbbkooimhnj -Force
# Avast
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 12 -PropertyType String -Value gomekmidlodglbbmalcneegieacbdmki -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 13 -PropertyType String -Value eofcbnmajmjmplflapaojjnihcjkigck -Force
# AVG
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 14 -PropertyType String -Value nbmoafcmbajniiapeidgficgifbfmjfo -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 15 -PropertyType String -Value mbckjcfnjmoiinpgddefodcighgikkgn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 16 -PropertyType String -Value ggimcfhnklgjpgehibgfmoidcgmbhppm -Force
# Hola
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 17 -PropertyType String -Value kcdahmgmaagjhocpipbodaokikjkampi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 18 -PropertyType String -Value gkojfkhlekighikafcpjkiklfbnlmeio -Force
# Norton
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 19 -PropertyType String -Value lpognpnpncelknkahlngpojfjgdmkodn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 20 -PropertyType String -Value eoigllimhcllmhedfbmahegmoakcdakd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 21 -PropertyType String -Value napjheenlliimoedooldaalpjfidlidp -Force
# Mcafee
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 22 -PropertyType String -Value klekeajafkkpokaofllcadenjdckhinm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 23 -PropertyType String -Value cmendinpapjjojakimjlmkkkcmnojefg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 24 -PropertyType String -Value jjkchpdmjjdmalgembblgafllbpcjlei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 25 -PropertyType String -Value lkdiimaiohgpacfbgedcipmgigppaofn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 26 -PropertyType String -Value kaedchgajfpgipflgbgeeiiajekblklm -Force
# Web of Trust
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 27 -PropertyType String -Value bhmmomiinigofkjcapegjjndpbikblnp -Force
# Adobe
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 28 -PropertyType String -Value efaidnbmnnnibpcajpcglclefindmkaj -Force
# Microsoft Annoyances
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 29 -PropertyType String -Value pedmlpceiodameienmmkpkkpilgklmfh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 30 -PropertyType String -Value fbgcedjacmlbgleddnoacbnijgmiolem -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 31 -PropertyType String -Value dhelmjcpoddajfaldodimlaehbalhgag -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 32 -PropertyType String -Value obdappnhkfoejojnmcohppfnoeagadna -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 33 -PropertyType String -Value bkbeeeffjjeopflfhgeknacdieedcoml -Force
# -----
# Fake TikTok
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 34 -PropertyType String -Value bjflcommipadapdldncoacffcccldlkm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 35 -PropertyType String -Value niljfkkadomdhekbkamcdlmokhnklign -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 36 -PropertyType String -Value agnbmfinlfpgonkehceknkpapgoibdno -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 37 -PropertyType String -Value dedphjedjalglppdfpmmibdbbkmifnbb -Force
# Fake Flash 
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 38 -PropertyType String -Value mcakfkioeanhfiojkchcndahgagcidbd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 39 -PropertyType String -Value nddmmcpmdbkooddfjcohmlcfclhllgeh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 40 -PropertyType String -Value fnipglnbhfacfmefbgiiodalehbcgcbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 41 -PropertyType String -Value fldkdmkgnlbehfgeifjpjabmandnchpe -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 42 -PropertyType String -Value aiccdefnpjkolgnpdamdimejlfmopcca -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 43 -PropertyType String -Value mdjjpkalmajfkhnamkekeljbfenponih -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 44 -PropertyType String -Value kppfgjkgimgbanjbbgpmccbkagcebnid -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 45 -PropertyType String -Value omimccinlhlkpjaeaocglgmkbelejlhj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 46 -PropertyType String -Value cngjoacjdpnadhhjpdppcdjboiclnclc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 47 -PropertyType String -Value hloblpeplfiajnfdengendhdnpmdgagn -Force
# Fake Adblockers
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 48 -PropertyType String -Value gmdffbblaahnjmpcjaenakkdplibibge -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 49 -PropertyType String -Value maekfnoeejhpjfkfmdlckioggdcdofpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 50 -PropertyType String -Value cmedhionkhpnakcndndgjdbohmhepckk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 51 -PropertyType String -Value gpbfjnhlnemfnhajnmkjicfmbagfbejm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 52 -PropertyType String -Value gkhnanmhgeggclieoggjehkloolfkbdo -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 53 -PropertyType String -Value oldifepkckfmnlokobgdbjjfjjmhfgag -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 54 -PropertyType String -Value megdnjjcjgoiacejpegmfoeooleddmeb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 55 -PropertyType String -Value pedpfddehkfmobhbnccdcbhidojinimh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 56 -PropertyType String -Value khnleagcghdbpphacgjjkcoceilngecl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 57 -PropertyType String -Value cegbjdefhfnbphoghdgcapnliodjbncp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 58 -PropertyType String -Value emngkmlligggbbiioginlkphcmffbncb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 59 -PropertyType String -Value jompdinfdpijbcngkadcdaladbochoae -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 60 -PropertyType String -Value pkocadmokmpjeeaimigjpmfpdaighkga -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 61 -PropertyType String -Value jaeigffnocnbblojlfmiimdocmfcjkii -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 62 -PropertyType String -Value ppdonaappkjkbgbncmmjencphdclioab -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 63 -PropertyType String -Value lalfpjdbhpmnhfofkckdpkljeilmogfl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 64 -PropertyType String -Value alcmakjhknigccfidaelkafjmfifkhkc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 65 -PropertyType String -Value fmaicbnbcbjgbpecclcnaehmbpjpdane -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 66 -PropertyType String -Value icegedoajhdclokfmeobnnbalabmpehm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 67 -PropertyType String -Value jhpheijfhpbkaejncokigfaihgdndjhg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 68 -PropertyType String -Value jbbmlecgjpijkeelnebilpekpnkaoool -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 69 -PropertyType String -Value gokhabgljglbmjilkmelajgkkhofeeij -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 70 -PropertyType String -Value klapabjimnakejfmpdolgamfplaondck -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 71 -PropertyType String -Value pclbpfjdhojdfcojcmmgggaanfnmhifk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 72 -PropertyType String -Value dhdpjhfemdchgdfngofnkgmabdmchoii -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 73 -PropertyType String -Value ckjbcmkjhocgdhmkkkieknbmhdnjanoh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 74 -PropertyType String -Value fkjdaikpmbninlknfjgehkoggdgmknel -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 75 -PropertyType String -Value eilkefcdofnagepelocjipipghaalkam -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 76 -PropertyType String -Value ocbcobiceiagblnejkcekbpgpakolhff -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 77 -PropertyType String -Value lkcohpjckebdgmdofkdfppgeejccjmnl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 78 -PropertyType String -Value pedpfddehkfmobhbnccdcbhidojinimh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 79 -PropertyType String -Value fhjieeiddoiibfbdknfligkjlpihnmjc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 80 -PropertyType String -Value bkalmigiilcgdihccnaonhnkdhpfbaam -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 81 -PropertyType String -Value gkkehpomgpdgkdmbdfkangmbafecdhhd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 82 -PropertyType String -Value inejjjikomlbaahobecdaoaillmfejil -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 83 -PropertyType String -Value kllohiclobgoaffphlofnjdlabflpgha -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 84 -PropertyType String -Value ececmkgelhdncajgmofiffjmhojnimmb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 85 -PropertyType String -Value fjadbbodmeifhkgepjjkeneeojammfag -Force
# VPN
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 86 -PropertyType String -Value kalfeohpimfncbfhjhanngehpbfilokk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 87 -PropertyType String -Value nlbejmccbhkncgokjcmghpfloaajcffj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 88 -PropertyType String -Value ejkaocphofnobjdedneohbbiilggdlbi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 89 -PropertyType String -Value bihmplhobchoageeokmgbdihknkjbknd -Force
# Other
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 90 -PropertyType String -Value aleggpabliehgbeagmfhnodcijcmbonb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 91 -PropertyType String -Value fpmapakogndmenjcfoajifaaonnkpkei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 92 -PropertyType String -Value digojkgonhgmnohbapdfjllpnmjmdhpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 93 -PropertyType String -Value llkbempahblbohpipifajipejjackemi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 94 -PropertyType String -Value nplnfhpilojbbcnjpiaoecppkkicfgfp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 95 -PropertyType String -Value hkjemkcbndldepdbnbdnibeppofoooio -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 96 -PropertyType String -Value nlhaleloflnhpemagojabiikkkejjlgp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 97 -PropertyType String -Value jeajkcogjepdpppofeocjpejdckbgdco -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 98 -PropertyType String -Value eekepadogplleogcggcjkfebfjhihlnm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 99 -PropertyType String -Value mmknfaojcgjcelkoabokhaljjapiogbg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 100 -PropertyType String -Value jalmmnpclgbgcphkbnglcnlobgcbhkki -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 101 -PropertyType String -Value hkegehhbmbongohpgmdadkbkmnfokicn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 102 -PropertyType String -Value odfnofpjippoimohokldpheacfenmfch -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 103 -PropertyType String -Value igcpjndghfaebohjdanobonebnejppej -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 104 -PropertyType String -Value oobhlpildfogoccaffnfckililknpcbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 105 -PropertyType String -Value hkjemkcbndldepdbnbdnibeppofoooio -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 106 -PropertyType String -Value nlhaleloflnhpemagojabiikkkejjlgp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 107 -PropertyType String -Value jmgacjgobknfojonlckhndlamkfcjofm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 108 -PropertyType String -Value gfceeghcoekcmlpgonlplkpmakdmpgmg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 109 -PropertyType String -Value kfgffakpbnpfonmljmpfamjpnjbhfiij -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 110 -PropertyType String -Value bbebbhmelpcfmijoanocdliephmoahln -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 111 -PropertyType String -Value igcpjndghfaebohjdanobonebnejppej -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 112 -PropertyType String -Value digojkgonhgmnohbapdfjllpnmjmdhpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave\ExtensionInstallBlocklist' -Name 113 -PropertyType String -Value goobgennebinldhonaajgafidboenlkl -Force

# -----------------
# Microsoft Edge Chromium
# -----------------
# (Other adblockers interfere with ublock origin)
# Adblock Plus
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 2 -PropertyType String -Value cfhdojbkjhnklbpkdaibdccddilifddb -Force
# Adblock
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 3 -PropertyType String -Value gighmmpiobklfepjocnamgkkbiglidom -Force
# Fair Adblocker
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 4 -PropertyType String -Value lgblnfidahcdcjddiepkckcfdhpknnjh -Force
# uBlock (non-origin)
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 5 -PropertyType String -Value epcnnfbjfcgphgdmggkamkmgojdagdnn -Force
# Adblock Ultimate
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 6 -PropertyType String -Value ohahllgiabjaoigichmmfljhkcfikeof -Force
# Adguard
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 7 -PropertyType String -Value bgnkhhnnamicmpeenaelnjfhikgbkllg -Force
# -----
# Grammarly
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 8 -PropertyType String -Value kbfnbcaeplbcioakkpcpgfkobkghlhen -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 9 -PropertyType String -Value noojmhngiheennhgaffkfboanjpbkpep -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 10 -PropertyType String -Value bjodbpcjeogaihbekannledankhcjbgo -Force
# Honey
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 11 -PropertyType String -Value bmnlcjabgnpnenekpadlanbbkooimhnj -Force
# Avast
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 12 -PropertyType String -Value gomekmidlodglbbmalcneegieacbdmki -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 13 -PropertyType String -Value eofcbnmajmjmplflapaojjnihcjkigck -Force
# AVG
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 14 -PropertyType String -Value nbmoafcmbajniiapeidgficgifbfmjfo -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 15 -PropertyType String -Value mbckjcfnjmoiinpgddefodcighgikkgn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 16 -PropertyType String -Value ggimcfhnklgjpgehibgfmoidcgmbhppm -Force
# Hola
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 17 -PropertyType String -Value kcdahmgmaagjhocpipbodaokikjkampi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 18 -PropertyType String -Value gkojfkhlekighikafcpjkiklfbnlmeio -Force
# Norton
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 19 -PropertyType String -Value lpognpnpncelknkahlngpojfjgdmkodn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 20 -PropertyType String -Value eoigllimhcllmhedfbmahegmoakcdakd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 21 -PropertyType String -Value napjheenlliimoedooldaalpjfidlidp -Force
# Mcafee
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 22 -PropertyType String -Value klekeajafkkpokaofllcadenjdckhinm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 23 -PropertyType String -Value cmendinpapjjojakimjlmkkkcmnojefg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 24 -PropertyType String -Value jjkchpdmjjdmalgembblgafllbpcjlei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 25 -PropertyType String -Value lkdiimaiohgpacfbgedcipmgigppaofn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 26 -PropertyType String -Value kaedchgajfpgipflgbgeeiiajekblklm -Force
# Web of Trust
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 27 -PropertyType String -Value bhmmomiinigofkjcapegjjndpbikblnp -Force
# Adobe
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 28 -PropertyType String -Value efaidnbmnnnibpcajpcglclefindmkaj -Force
# Microsoft Annoyances
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 29 -PropertyType String -Value pedmlpceiodameienmmkpkkpilgklmfh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 30 -PropertyType String -Value fbgcedjacmlbgleddnoacbnijgmiolem -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 31 -PropertyType String -Value dhelmjcpoddajfaldodimlaehbalhgag -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 32 -PropertyType String -Value obdappnhkfoejojnmcohppfnoeagadna -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 33 -PropertyType String -Value bkbeeeffjjeopflfhgeknacdieedcoml -Force
# -----
# Fake TikTok
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 34 -PropertyType String -Value bjflcommipadapdldncoacffcccldlkm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 35 -PropertyType String -Value niljfkkadomdhekbkamcdlmokhnklign -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 36 -PropertyType String -Value agnbmfinlfpgonkehceknkpapgoibdno -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 37 -PropertyType String -Value dedphjedjalglppdfpmmibdbbkmifnbb -Force
# Fake Flash 
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 38 -PropertyType String -Value mcakfkioeanhfiojkchcndahgagcidbd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 39 -PropertyType String -Value nddmmcpmdbkooddfjcohmlcfclhllgeh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 40 -PropertyType String -Value fnipglnbhfacfmefbgiiodalehbcgcbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 41 -PropertyType String -Value fldkdmkgnlbehfgeifjpjabmandnchpe -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 42 -PropertyType String -Value aiccdefnpjkolgnpdamdimejlfmopcca -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 43 -PropertyType String -Value mdjjpkalmajfkhnamkekeljbfenponih -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 44 -PropertyType String -Value kppfgjkgimgbanjbbgpmccbkagcebnid -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 45 -PropertyType String -Value omimccinlhlkpjaeaocglgmkbelejlhj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 46 -PropertyType String -Value cngjoacjdpnadhhjpdppcdjboiclnclc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 47 -PropertyType String -Value hloblpeplfiajnfdengendhdnpmdgagn -Force
# Fake Adblockers
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 48 -PropertyType String -Value gmdffbblaahnjmpcjaenakkdplibibge -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 49 -PropertyType String -Value maekfnoeejhpjfkfmdlckioggdcdofpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 50 -PropertyType String -Value cmedhionkhpnakcndndgjdbohmhepckk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 51 -PropertyType String -Value gpbfjnhlnemfnhajnmkjicfmbagfbejm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 52 -PropertyType String -Value gkhnanmhgeggclieoggjehkloolfkbdo -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 53 -PropertyType String -Value oldifepkckfmnlokobgdbjjfjjmhfgag -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 54 -PropertyType String -Value megdnjjcjgoiacejpegmfoeooleddmeb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 55 -PropertyType String -Value pedpfddehkfmobhbnccdcbhidojinimh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 56 -PropertyType String -Value khnleagcghdbpphacgjjkcoceilngecl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 57 -PropertyType String -Value cegbjdefhfnbphoghdgcapnliodjbncp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 58 -PropertyType String -Value emngkmlligggbbiioginlkphcmffbncb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 59 -PropertyType String -Value jompdinfdpijbcngkadcdaladbochoae -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 60 -PropertyType String -Value pkocadmokmpjeeaimigjpmfpdaighkga -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 61 -PropertyType String -Value jaeigffnocnbblojlfmiimdocmfcjkii -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 62 -PropertyType String -Value ppdonaappkjkbgbncmmjencphdclioab -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 63 -PropertyType String -Value lalfpjdbhpmnhfofkckdpkljeilmogfl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 64 -PropertyType String -Value alcmakjhknigccfidaelkafjmfifkhkc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 65 -PropertyType String -Value fmaicbnbcbjgbpecclcnaehmbpjpdane -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 66 -PropertyType String -Value icegedoajhdclokfmeobnnbalabmpehm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 67 -PropertyType String -Value jhpheijfhpbkaejncokigfaihgdndjhg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 68 -PropertyType String -Value jbbmlecgjpijkeelnebilpekpnkaoool -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 69 -PropertyType String -Value gokhabgljglbmjilkmelajgkkhofeeij -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 70 -PropertyType String -Value klapabjimnakejfmpdolgamfplaondck -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 71 -PropertyType String -Value pclbpfjdhojdfcojcmmgggaanfnmhifk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 72 -PropertyType String -Value dhdpjhfemdchgdfngofnkgmabdmchoii -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 73 -PropertyType String -Value ckjbcmkjhocgdhmkkkieknbmhdnjanoh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 74 -PropertyType String -Value fkjdaikpmbninlknfjgehkoggdgmknel -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 75 -PropertyType String -Value eilkefcdofnagepelocjipipghaalkam -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 76 -PropertyType String -Value ocbcobiceiagblnejkcekbpgpakolhff -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 77 -PropertyType String -Value lkcohpjckebdgmdofkdfppgeejccjmnl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 78 -PropertyType String -Value pedpfddehkfmobhbnccdcbhidojinimh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 79 -PropertyType String -Value fhjieeiddoiibfbdknfligkjlpihnmjc -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 80 -PropertyType String -Value bkalmigiilcgdihccnaonhnkdhpfbaam -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 81 -PropertyType String -Value gkkehpomgpdgkdmbdfkangmbafecdhhd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 82 -PropertyType String -Value inejjjikomlbaahobecdaoaillmfejil -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 83 -PropertyType String -Value kllohiclobgoaffphlofnjdlabflpgha -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 84 -PropertyType String -Value ececmkgelhdncajgmofiffjmhojnimmb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 85 -PropertyType String -Value fjadbbodmeifhkgepjjkeneeojammfag -Force
# VPN
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 86 -PropertyType String -Value kalfeohpimfncbfhjhanngehpbfilokk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 87 -PropertyType String -Value nlbejmccbhkncgokjcmghpfloaajcffj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 88 -PropertyType String -Value ejkaocphofnobjdedneohbbiilggdlbi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 89 -PropertyType String -Value bihmplhobchoageeokmgbdihknkjbknd -Force
# Other
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 90 -PropertyType String -Value aleggpabliehgbeagmfhnodcijcmbonb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 91 -PropertyType String -Value fpmapakogndmenjcfoajifaaonnkpkei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 92 -PropertyType String -Value digojkgonhgmnohbapdfjllpnmjmdhpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 93 -PropertyType String -Value llkbempahblbohpipifajipejjackemi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 94 -PropertyType String -Value nplnfhpilojbbcnjpiaoecppkkicfgfp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 95 -PropertyType String -Value hkjemkcbndldepdbnbdnibeppofoooio -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 96 -PropertyType String -Value nlhaleloflnhpemagojabiikkkejjlgp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 97 -PropertyType String -Value jeajkcogjepdpppofeocjpejdckbgdco -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 98 -PropertyType String -Value eekepadogplleogcggcjkfebfjhihlnm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 99 -PropertyType String -Value mmknfaojcgjcelkoabokhaljjapiogbg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 100 -PropertyType String -Value jalmmnpclgbgcphkbnglcnlobgcbhkki -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 101 -PropertyType String -Value hkegehhbmbongohpgmdadkbkmnfokicn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 102 -PropertyType String -Value odfnofpjippoimohokldpheacfenmfch -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 103 -PropertyType String -Value igcpjndghfaebohjdanobonebnejppej -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 104 -PropertyType String -Value oobhlpildfogoccaffnfckililknpcbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 105 -PropertyType String -Value hkjemkcbndldepdbnbdnibeppofoooio -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 106 -PropertyType String -Value nlhaleloflnhpemagojabiikkkejjlgp -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 107 -PropertyType String -Value jmgacjgobknfojonlckhndlamkfcjofm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 108 -PropertyType String -Value gfceeghcoekcmlpgonlplkpmakdmpgmg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 109 -PropertyType String -Value kfgffakpbnpfonmljmpfamjpnjbhfiij -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 110 -PropertyType String -Value bbebbhmelpcfmijoanocdliephmoahln -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 111 -PropertyType String -Value igcpjndghfaebohjdanobonebnejppej -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 112 -PropertyType String -Value digojkgonhgmnohbapdfjllpnmjmdhpg -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 113 -PropertyType String -Value goobgennebinldhonaajgafidboenlkl -Force

# -----------------
# Microsoft Edge Chromium Add-on Store
# -----------------

# Fake Tiktok
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 114 -PropertyType String -Value eamchpjkhdjbbhdanfngombbbafoopbm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 115 -PropertyType String -Value pdjhconnbgkdigcldclgbgihmjokldbe -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 116 -PropertyType String -Value mipfipmcmnedgckncckicogmnncflhhk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 117 -PropertyType String -Value goepanlbnhiiaopmfcniejcbhgolcllb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 118 -PropertyType String -Value ccjbgffbjdbnnpdnopghofogcfeopdmn -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 119 -PropertyType String -Value celdediiemogjpfcjocdbildilkccepl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 120 -PropertyType String -Value ofbgciponmcpbencjjhomeoekhnlnppj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 121 -PropertyType String -Value clklfdpdakpekcamjgiedicfnikeajcl -Force
# Fake Flash
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 122 -PropertyType String -Value omhnkkegfjjhpkobpjdiokemdecmmebb -Force
# Fake Adblockers
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 123 -PropertyType String -Value oakdjiehbhihbklollmmmkhfilbklgkf -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 124 -PropertyType String -Value ffnfbjmflmibccofnlgeolaoamencnpf -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 125 -PropertyType String -Value bpllndkbconceaidgcllkolimbbiojic -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 126 -PropertyType String -Value lmfhgdeejhbbcagkkbefkkgkfofjhfch -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 127 -PropertyType String -Value efpgcmfgkpmogadebodiegjleafcmdcb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 128 -PropertyType String -Value onlofoccaenllpjmalbnilfacjmcfhfk -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 129 -PropertyType String -Value bpffhahkoibohjndinfiimfomedmgnme -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 130 -PropertyType String -Value kkkldohdhcfhpjchcefpkfhjfeapdmek -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 131 -PropertyType String -Value gaobomhkmmnbjgehdfjeklkbfddhjbfi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 132 -PropertyType String -Value fbobegkkdmmcnmoplkgdmfhdlkjfelnb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 133 -PropertyType String -Value jlfbbmbfbkkilahjmbjehndogohpbfmf -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 134 -PropertyType String -Value bbocfgcdelebeaboidkmglbdkimdpojb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 135 -PropertyType String -Value dckihkcdmjmlkndgmmgplpcnkmdpangb -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 136 -PropertyType String -Value gclhifbbggfamoojmienffegbmmfnfll -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 137 -PropertyType String -Value pafjohfpgafakkaoccipcknnaoneopei -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 138 -PropertyType String -Value oggghceenfdiodiakhigmpamjpcnilin -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 139 -PropertyType String -Value lojfohldolbkplldokkjgjmcffealmka -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 140 -PropertyType String -Value nipggfgilmoiofmnkbeabghbcaohmjih -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 141 -PropertyType String -Value obmbbppggfnabhdbepdbmpcjfckkoljl -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 142 -PropertyType String -Value pejdjolhgfenbjfjoejgllffflbbgecm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 143 -PropertyType String -Value kjdjplhnalcgkamkcidihcodlblkihon -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 144 -PropertyType String -Value mbdlpgncclnhomdpmicmgdihapedhhak -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 145 -PropertyType String -Value odiffgppifkpehahdcafnkloapoblbkj -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 146 -PropertyType String -Value fhhdniedlnfoenmhbajomdablgpbhnad -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 147 -PropertyType String -Value bhhjenbjldcljpdofmhkdcdfmbagoong -Force
# -----------------
# (Other adblockers interfere with ublock origin)
# Chrome Web Store Version of force installed extensions (Microsoft addons versions already installed)
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 148 -PropertyType String -Value cjpalhdlnbpafiamejdnhcphjbkeiagm -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 149 -PropertyType String -Value mnjggcdmjocbbbhaepdhchncahnbgone -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 150 -PropertyType String -Value lckanjgmijmafbedllaakclkaicjfmnk -Force
# Adblock Plus
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 151 -PropertyType String -Value gmgoamodcdcjnbaobigkjelfplakmdhh -Force
# Adblock
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 152 -PropertyType String -Value ndcileolkflehcjpmjnfbnaibdcgglog -Force
# Fair Adblocker
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 153 -PropertyType String -Value jccfboncbdccgbgcbhickioeailgpkgb -Force
# Adblock Ultimate
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 154 -PropertyType String -Value pciakllldcajllepkbbihkmfkikheffb -Force
# Adguard
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 155 -PropertyType String -Value pdffkfellgipmhklpdmokmckkkfcopbh -Force
# -----
# Grammarly
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 156 -PropertyType String -Value cnlefmmeadmemmdciolhbnfeacpdfbkd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 157 -PropertyType String -Value kljjdbdffnbengiilkaiblpinbhfcfnc -Force
# Honey
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 158 -PropertyType String -Value amnbcmdbanbkjhnfoeceemmmdiepnbpp -Force
# Avast
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 159 -PropertyType String -Value fdgpikaaheckgdijjmepmdjjkbceakif -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 160 -PropertyType String -Value phhhmbgggfifgikoihlakngnngdehhfe -Force
# AVG
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 161 -PropertyType String -Value lacbjnnibafcbpogdcpfdpmajfkdampi -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 162 -PropertyType String -Value iffhejniciepiiafcfhhapiidaomcdam -Force
# Hola
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 163 -PropertyType String -Value nfjgmgjhcihmkobljembcfodkajehoej -Force
# Norton
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 164 -PropertyType String -Value bdaafgjhhjkdplpffldcncdignokfkbo -Force
# Mcafee
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 165 -PropertyType String -Value fdhgeoginicibhagdmblfikbgbkahibd -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 166 -PropertyType String -Value lamehkegphbbfdailghaeeleoajilfho -Force
# Web of Trust
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 167 -PropertyType String -Value iiclaphjclecagpkkaacljnpcppnoibi -Force
# Microsoft Annoyances
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 168 -PropertyType String -Value jebegceanihjkbdfnjelignmnclhpnfh -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 169 -PropertyType String -Value bnplfnhcidhhdapmblniehfaaompjlck -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 170 -PropertyType String -Value eghmccdcabhgeigmkhfbnioepobdhhab -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 171 -PropertyType String -Value cjmjijnpnollocennnapedpaeecninea -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 172 -PropertyType String -Value acgiggmcehhbhfnedfkcgenplgkjddef -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist' -Name 173 -PropertyType String -Value hcfdaddfkgbmekbgcepcnpfiopaigpnn -Force
# -----------------

# -------
# Remove All UWP Apps (Except Microsoft Store, Windows Terminal, and Calculator)
# -------
Get-AppxPackage | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*terminal*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage

# -----------------
