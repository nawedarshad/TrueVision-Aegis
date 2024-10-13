# generate-report.ps1
# AEGIS: Report Generation Script for Windows
# Author: Mohammad Nawed Arshad
# Last Updated: 2024-10-12

Write-Host "==================================================" -ForegroundColor Yellow
Write-Host "Generating Audit Report for Windows" -ForegroundColor Yellow
Write-Host "==================================================" -ForegroundColor Yellow

# Define the report path
$reportPath = "./reports/windows-cis-audit-summary.txt"
$sourceReportPath = "./reports/windows-audit-report.txt"

# Check if the source report exists
if (-Not (Test-Path $sourceReportPath)) {
    Write-Host "Error: Source report not found. Please run the audit first." -ForegroundColor Red
    exit
}

# Create a new report file
New-Item -Path $reportPath -Force -ItemType File | Out-Null

# Write the header to the report
Add-Content -Path $reportPath -Value "=================================================="
Add-Content -Path $reportPath -Value "AEGIS CIS Audit Summary Report - Windows"
Add-Content -Path $reportPath -Value "=================================================="
Add-Content -Path $reportPath -Value "Audit Date: $(Get-Date)"
Add-Content -Path $reportPath -Value "=================================================="

# Read the source report and process it
Get-Content $sourceReportPath | ForEach-Object {
    if ($_ -match "\[PASS\]") {
        Add-Content -Path $reportPath -Value $_
    }
}

# Summary Statistics
$totalChecks = (Get-Content $sourceReportPath).Count
$passedChecks = (Select-String -Path $sourceReportPath -Pattern "\[PASS\]").Count
$failedChecks = (Select-String -Path $sourceReportPath -Pattern "\[FAIL\]").Count

Add-Content -Path $reportPath -Value "=================================================="
Add-Content -Path $reportPath -Value "Summary Statistics"
Add-Content -Path $reportPath -Value "Total Checks: $totalChecks"
Add-Content -Path $reportPath -Value "Passed Checks: $passedChecks"
Add-Content -Path $reportPath -Value "Failed Checks: $failedChecks"
Add-Content -Path $reportPath -Value "=================================================="

Write-Host "Report generated successfully: $reportPath" -ForegroundColor Green
