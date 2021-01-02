
# setup.ps1
# Custom Setup for Windows 10 (Windows 10 Version 1909/19H2 - OS Build 18363)
#       https://github.com/jfu299/win10setup
#       https://raw.githubusercontent.com/jfu299/win10setup/main/setup.ps1
# By: Justin Fu
# Updated: Janaury 2, 2021

# --------------
# Remove All UWP Apps (Except Microsoft Store, Windows Terminal, and Calculator)

Get-AppxPackage | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*terminal*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage

# --------------


