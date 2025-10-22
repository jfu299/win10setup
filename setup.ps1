
# setup.ps1
# Custom Setup for Windows 10
#       https://github.com/jfu299/win10setup
#       https://raw.githubusercontent.com/jfu299/win10setup/main/setup.ps1
# By: Justin Fu
# Updated: 2025-10-22

# --------------
# Remove All UWP Apps (Except Microsoft Store, Windows Terminal, and Calculator)
# !!!!!!! DO NOT USE ON WINDOWS 11 !!!!!!!!!!!!  ------ !!!!!!!!! WILL COMPLETELY BREAK THE DESKTOP AND OS !!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!! if you remove *cbs* from windows 11, it completely breaks the desktop and basic usage after restart !!!!!!!!!!!!!!!!
# Get-AppxPackage | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*terminal*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage
# --------------

# Remove All UWP Apps (Except Microsoft Store, Windows Terminal, and Calculator)
# Possible Fix for Windows 11
Get-AppxPackage | where-object {$_.name -notlike "*control*"} | where-object {$_.name -notlike "*lock*"} | where-object {$_.name -notlike "*cbs*"} | where-object {$_.name -notlike "*CloudExperienceHost*"} | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*terminal*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage


# -------

# Remove Windows Backup App, UWP Snipping Tool App, UWP Emoji Picker

Get-WindowsPackage -Online -PackageName *Microsoft-Windows-UserExperience-Desktop* | Remove-WindowsPackage -Online -NoRestart

# Remove Quick Assist

Get-WindowsPackage -Online -PackageName *Microsoft-Windows-QuickAssist* | Remove-WindowsPackage -Online -NoRestart

# Remove Windows Hello Face

Get-WindowsPackage -Online -PackageName *Microsoft-Windows-Hello-Face* | Remove-WindowsPackage -Online -NoRestart

# Start Menu set default (no tiles): %SystemDrive%\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml

$driveLetter = (Get-Item -Path '.\').PSDrive.Name + ':\'

Set-Location -Path $PSScriptRoot

Import-StartLayout -LayoutPath .\setup.xml -MountPath $driveLetter

# --------------
