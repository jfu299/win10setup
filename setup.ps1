
# setup.ps1
# Custom Setup for Windows 10 (Windows 10 Version 1909/19H2 - OS Build 18363)
#       https://github.com/jfu299/win10setup
#       https://raw.githubusercontent.com/jfu299/win10setup/main/setup.ps1
# By: Justin Fu
# Updated: December 17, 2020

Get-AppxPackage | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*terminal*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage


$input = Read-Host "Restart computer now [y/n]"
switch($input){
          y{Restart-computer -Force -Confirm:$false}
          yes{Restart-computer -Force -Confirm:$false}
          n{exit}
    default{write-warning "Invalid Input"}
}
