
# setup.ps1
# Custom Setup for Windows 10
# 		https://github.com/jfu299/win10setup
# 		https://raw.githubusercontent.com/jfu299/win10setup/main/setup.ps1
# By: Justin Fu
# Updated: November 06, 2023

# --------------
# Remove All UWP Apps (Except Microsoft Store, Windows Terminal, and Calculator)

Get-AppxPackage | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*terminal*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage

# -------

# Remove Windows Backup App, UWP Snipping Tool App, UWP Emoji Picker

Get-WindowsPackage -Online -PackageName *Microsoft-Windows-UserExperience-Desktop* | Remove-WindowsPackage -Online -NoRestart

# Remove Quick Assist

Get-WindowsPackage -Online -PackageName *Microsoft-Windows-QuickAssist* | Remove-WindowsPackage -Online -NoRestart

# Remove Windows Hello Face

Get-WindowsPackage -Online -PackageName *Microsoft-Windows-Hello-Face* | Remove-WindowsPackage -Online -NoRestart

# --------------
