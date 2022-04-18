
# setup.ps1
# Custom Setup for Windows 10
# 		https://github.com/jfu299/win10setup
# 		https://raw.githubusercontent.com/jfu299/win10setup/main/setup.ps1
# By: Justin Fu
# Updated: April 18, 2022

# --------------
# Remove All UWP Apps (Except Microsoft Store, Windows Terminal, and Calculator)

Get-AppxPackage | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*terminal*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage

# --------------
