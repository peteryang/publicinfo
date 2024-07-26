#Check WinRM Service Status
Get-Service -Name WinRM

#Check WinRM Service Startup Type
Get-Service -Name WinRM | Select-Object -Property Name, StartType

#Test WinRM Local Configuration
Test-WSMan

#Check WinRM Listeners
winrm enumerate winrm/config/Listener

#Check Firewall Rules for WinRM
Get-NetFirewallRule -Name "WINRM-HTTP-In-TCP"


#Check Basic Authentication
Get-Item -Path WSMan:\localhost\Service\Auth\Basic

#Check Unencrypted Traffic Setting
Get-Item -Path WSMan:\localhost\Service\AllowUnencrypted
