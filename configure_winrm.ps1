#Temporarily Change Execution Policy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Enable WinRM
Enable-PSRemoting -Force

# Allow basic authentication
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true

# Allow unencrypted traffic (useful for initial testing)
Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $true

# Set the WinRM service to start automatically
Set-Service -Name WinRM -StartupType Automatic

# Start the WinRM service
Start-Service -Name WinRM

# Create a WinRM listener for HTTP (port 5985)
New-WSManInstance -ResourceURI winrm/config/Listener -SelectorSet @{Address="*";Transport="HTTP"} -ValueSet @{Port="5985"}

# Enable firewall rule for WinRM over HTTP
Enable-NetFirewallRule -Name "WINRM-HTTP-In-TCP"

# Modify the firewall rule to include the Public profile
Set-NetFirewallRule -Name "WINRM-HTTP-In-TCP" -Profile Any
