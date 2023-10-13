
# setup.ps1
# Custom Setup for Windows 10
# 		https://github.com/jfu299/win10setup
# 		https://raw.githubusercontent.com/jfu299/win10setup/main/setup.ps1
# By: Justin Fu
# Updated: October 13, 2023

# --------------
# Remove All UWP Apps (Except Microsoft Store, Windows Terminal, and Calculator)

Get-AppxPackage | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*terminal*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage

# Remove Windows Backup App, UWP Snipping Tool App, UWP Emoji Picker

Remove-WindowsPackage -Online -PackageName "Microsoft-Windows-UserExperience-Desktop-Package~31bf3856ad364e35~amd64~~10.0.19041.3393" -NoRestart

# --------------
