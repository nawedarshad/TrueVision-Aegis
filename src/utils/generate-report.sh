#!/bin/bash

# generate-report.sh
# AEGIS: Report Generation Script for Linux
# Author: Mohammad Nawed Arshad
# Last Updated: 2024-10-12

echo "=================================================="
echo "Generating Audit Report for Linux"
echo "=================================================="

# Define the report path
REPORT_PATH="./reports/linux-cis-audit-summary.txt"
SOURCE_REPORT_PATH="./reports/linux-audit-report.txt"

# Check if the source report exists
if [ ! -f "$SOURCE_REPORT_PATH" ]; then
    echo "Error: Source report not found. Please run the audit first."
    exit 1
fi

# Create a new report file
touch "$REPORT_PATH"

# Write the header to the report
{
    echo "=================================================="
    echo "AEGIS CIS Audit Summary Report - Linux"
    echo "=================================================="
    echo "Audit Date: $(date)"
    echo "=================================================="
} > "$REPORT_PATH"

# Read the source report and process it
while IFS= read -r line; do
    if [[ "$line" == *"[PASS]"* ]]; then
        echo "$line" >> "$REPORT_PATH"
    fi
done < "$SOURCE_REPORT_PATH"

# Summary Statistics
total_checks=$(wc -l < "$SOURCE_REPORT_PATH")
passed_checks=$(grep -c "\[PASS\]" "$SOURCE_REPORT_PATH")
failed_checks=$(grep -c "\[FAIL\]" "$SOURCE_REPORT_PATH")

{
    echo "=================================================="
    echo "Summary Statistics"
    echo "Total Checks: $total_checks"
    echo "Passed Checks: $passed_checks"
    echo "Failed Checks: $failed_checks"
    echo "=================================================="
} >> "$REPORT_PATH"

echo "Report generated successfully: $REPORT_PATH"
