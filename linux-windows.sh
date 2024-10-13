#!/bin/bash

# audit-linux.sh
# AEGIS: CIS Benchmark Audit Script for Linux Systems
# Author: TrueVision
# Last Updated: 2024-10-12

# Define the output report path
REPORT_PATH="./reports/linux-audit-report.txt"
mkdir -p ./reports

echo "==================================================" > $REPORT_PATH
echo "AEGIS CIS Benchmark Audit for Linux" >> $REPORT_PATH
echo "==================================================" >> $REPORT_PATH
echo "Audit Date: $(date)" >> $REPORT_PATH
echo "==================================================" >> $REPORT_PATH

# Function to log audit results
log_result() {
    local message=$1
    local status=$2
    echo "$status: $message"
    echo "$status: $message" >> $REPORT_PATH
}

# Section 1: Password Expiration Policy
echo "Checking Password Expiration Policy..."
password_expiration=$(grep -i "^PASS_MAX_DAYS" /etc/login.defs | awk '{print $2}')
if [ "$password_expiration" -le 90 ]; then
    log_result "Password expiration is set to $password_expiration days." "PASS"
else
    log_result "Password expiration is set to $password_expiration days, which exceeds the recommended 90 days." "FAIL"
    log_result "Recommendation: Set PASS_MAX_DAYS to 90 or fewer in /etc/login.defs." "RECOMMENDATION"
fi

# Section 2: SSH Configuration - Protocol Version
echo "Checking SSH Protocol Version..."
ssh_protocol=$(grep "^Protocol" /etc/ssh/sshd_config | awk '{print $2}')
if [ "$ssh_protocol" == "2" ]; then
    log_result "SSH Protocol is set to version 2." "PASS"
else
    log_result "SSH Protocol is set to version $ssh_protocol." "FAIL"
    log_result "Recommendation: Set 'Protocol 2' in /etc/ssh/sshd_config." "RECOMMENDATION"
fi

# Section 3: SSH Root Login
echo "Checking SSH Root Login..."
ssh_root_login=$(grep "^PermitRootLogin" /etc/ssh/sshd_config | awk '{print $2}')
if [ "$ssh_root_login" == "no" ]; then
    log_result "Root login via SSH is disabled." "PASS"
else
    log_result "Root login via SSH is enabled." "FAIL"
    log_result "Recommendation: Set 'PermitRootLogin no' in /etc/ssh/sshd_config." "RECOMMENDATION"
fi

# Section 4: Firewall Status
echo "Checking Firewall Status..."
firewall_status=$(ufw status | grep "Status" | awk '{print $2}')
if [ "$firewall_status" == "active" ]; then
    log_result "UFW Firewall is active." "PASS"
else
    log_result "UFW Firewall is not active." "FAIL"
    log_result "Recommendation: Enable UFW using 'ufw enable'." "RECOMMENDATION"
fi

# Section 5: File Permissions for Critical Files
echo "Checking Permissions for Critical Files..."

check_permissions() {
    local file=$1
    local permissions=$(stat -c %a "$file")
    if [ "$permissions" -le 600 ]; then
        log_result "Permissions for $file are correctly set to $permissions." "PASS"
    else
        log_result "Permissions for $file are set to $permissions, which is too permissive." "FAIL"
        log_result "Recommendation: Set permissions to 600 or more restrictive for $file." "RECOMMENDATION"
    fi
}

check_permissions "/etc/passwd"
check_permissions "/etc/shadow"
check_permissions "/etc/gshadow"

# Section 6: Audit Logging
echo "Checking Audit Logging..."
audit_status=$(systemctl is-enabled auditd 2>/dev/null)
if [ "$audit_status" == "enabled" ]; then
    log_result "Audit logging (auditd) is enabled." "PASS"
else
    log_result "Audit logging (auditd) is not enabled." "FAIL"
    log_result "Recommendation: Enable auditd service using 'systemctl enable auditd'." "RECOMMENDATION"
fi

# Section 7: Password Complexity
echo "Checking Password Complexity Requirements..."
password_complexity=$(grep "pam_pwquality.so" /etc/pam.d/common-password)
if [ -n "$password_complexity" ]; then
    log_result "Password complexity requirements are enforced using pam_pwquality." "PASS"
else
    log_result "Password complexity requirements are not enforced." "FAIL"
    log_result "Recommendation: Add 'pam_pwquality.so' to /etc/pam.d/common-password for enforcing complexity." "RECOMMENDATION"
fi

# Section 8: Automatic Updates
echo "Checking Automatic Updates..."
auto_updates=$(grep "APT::Periodic::Unattended-Upgrade" /etc/apt/apt.conf.d/20auto-upgrades | awk '{print $2}' | tr -d '";')
if [ "$auto_updates" == "1" ]; then
    log_result "Automatic updates are enabled." "PASS"
else
    log_result "Automatic updates are not enabled." "FAIL"
    log_result "Recommendation: Enable automatic updates by configuring 'APT::Periodic::Unattended-Upgrade' to 1." "RECOMMENDATION"
fi

# End of Audit
echo "Audit completed. Report saved to $REPORT_PATH"
echo "==================================================" >> $REPORT_PATH
echo "Audit completed successfully!" >> $REPORT_PATH
