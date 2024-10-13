# audit-windows.ps1
# AEGIS: CIS Benchmark Audit Script for Windows Systems
# Author: Mohammad Nawed Arshad
# Last Updated: 2024-10-12

Write-Host "==================================================" -ForegroundColor Yellow
Write-Host "AEGIS CIS Benchmark Audit for Windows" -ForegroundColor Yellow
Write-Host "==================================================" -ForegroundColor Yellow
Write-Host "Starting audit..." -ForegroundColor Cyan

# Define the output report path
$reportPath = "./reports/windows-audit-report.txt"
New-Item -Path $reportPath -Force -ItemType File | Out-Null

# Function to log audit results
Function Log-Result {
    param (
        [string]$message,
        [string]$status
    )
    
    $logMessage = "$status: $message"
    Write-Host $logMessage
    Add-Content -Path $reportPath -Value $logMessage
}

# Section 1: Password Policies
Write-Host "`nChecking Password Policies..." -ForegroundColor Cyan
$passwordPolicy = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "RequireStrongKey"
if ($passwordPolicy.RequireStrongKey -eq 1) {
    Log-Result "Password complexity requirements are enabled." "PASS"
} else {
    Log-Result "Password complexity requirements are not enabled." "FAIL"
    Log-Result "Recommendation: Enable password complexity requirements in Group Policy." "RECOMMENDATION"
}

# Section 2: Minimum Password Length
$minPassLength = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "MinimumPasswordLength").MinimumPasswordLength
if ($minPassLength -ge 8) {
    Log-Result "Minimum password length is set to $minPassLength characters." "PASS"
} else {
    Log-Result "Minimum password length is set to $minPassLength characters, which is below the recommended value." "FAIL"
    Log-Result "Recommendation: Set minimum password length to 8 or more characters in Group Policy." "RECOMMENDATION"
}

# Section 3: Account Lockout Threshold
$lockoutThreshold = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LockoutThreshold").LockoutThreshold
if ($lockoutThreshold -le 5) {
    Log-Result "Account lockout threshold is set to $lockoutThreshold attempts." "PASS"
} else {
    Log-Result "Account lockout threshold is set to $lockoutThreshold attempts, which is above the recommended value." "FAIL"
    Log-Result "Recommendation: Set account lockout threshold to 5 or fewer failed attempts in Group Policy." "RECOMMENDATION"
}

# Section 4: Windows Firewall
Write-Host "`nChecking Firewall Status..." -ForegroundColor Cyan
$firewallStatus = Get-NetFirewallProfile -Profile Domain,Public,Private | Select-Object -ExpandProperty Enabled
if ($firewallStatus -contains 1) {
    Log-Result "Windows Firewall is enabled for all profiles." "PASS"
} else {
    Log-Result "Windows Firewall is not enabled for all profiles." "FAIL"
    Log-Result "Recommendation: Enable Windows Firewall for all profiles." "RECOMMENDATION"
}

# Section 5: Remote Desktop
Write-Host "`nChecking Remote Desktop Configuration..." -ForegroundColor Cyan
$rdpStatus = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections").fDenyTSConnections
if ($rdpStatus -eq 1) {
    Log-Result "Remote Desktop is disabled." "PASS"
} else {
    Log-Result "Remote Desktop is enabled, which is not recommended." "FAIL"
    Log-Result "Recommendation: Disable Remote Desktop if not required for security." "RECOMMENDATION"
}

# Section 6: Audit Policy
Write-Host "`nChecking Audit Policy..." -ForegroundColor Cyan
$auditPolicy = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "AuditPolicy"
if ($auditPolicy) {
    Log-Result "Audit policies are configured correctly." "PASS"
} else {
    Log-Result "Audit policies are not configured." "FAIL"
    Log-Result "Recommendation: Set audit policies to track security events." "RECOMMENDATION"
}

# Section 7: UAC (User Account Control)
Write-Host "`nChecking UAC Settings..." -ForegroundColor Cyan
$uacStatus = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA").EnableLUA
if ($uacStatus -eq 1) {
    Log-Result "User Account Control (UAC) is enabled." "PASS"
} else {
    Log-Result "User Account Control (UAC) is disabled." "FAIL"
    Log-Result "Recommendation: Enable UAC to protect the system from unauthorized changes." "RECOMMENDATION"
}

# Section 8: Windows Update Settings
Write-Host "`nChecking Windows Update Settings..." -ForegroundColor Cyan
$updateStatus = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate").NoAutoUpdate
if ($updateStatus -eq 0) {
    Log-Result "Automatic Windows updates are enabled." "PASS"
} else {
    Log-Result "Automatic Windows updates are disabled." "FAIL"
    Log-Result "Recommendation: Enable automatic Windows updates." "RECOMMENDATION"
}

# Section 9: Antivirus and Anti-Malware
Write-Host "`nChecking Antivirus Status..." -ForegroundColor Cyan
$antivirusStatus = Get-MpComputerStatus | Select-Object -ExpandProperty AMServiceEnabled
if ($antivirusStatus -eq $true) {
    Log-Result "Windows Defender Antivirus is enabled." "PASS"
} else {
    Log-Result "Windows Defender Antivirus is disabled." "FAIL"
    Log-Result "Recommendation: Enable Windows Defender Antivirus or install a third-party antivirus solution." "RECOMMENDATION"
}

# End of Audit
Write-Host "`nAudit completed successfully!" -ForegroundColor Green
Write-Host "Audit report saved to $reportPath" -ForegroundColor Green

