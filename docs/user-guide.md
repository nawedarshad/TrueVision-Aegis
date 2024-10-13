
# AEGIS Installation Guide

## Introduction

This guide will help you install and set up AEGIS on both Windows and Linux systems. AEGIS is an advanced cybersecurity auditing tool that checks your system’s compliance with CIS Benchmarks. It supports Windows (via PowerShell) and Linux (via Bash), making it cross-platform and highly adaptable.

## Prerequisites

Before installing AEGIS, ensure that your system meets the following requirements:

### Common Requirements

- **Git**: To clone the repository.
  - Install Git [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
- **Administrator/Root Access**: You need elevated permissions to perform system-level audits.

---

### Windows Installation

#### 1. Install PowerShell (if not already installed)

- **PowerShell Version**: 5.1 or higher is required. Windows 10/11 usually come with the latest version of PowerShell.
- To check the PowerShell version, run:
  ```powershell
  $PSVersionTable.PSVersion
  ```

#### 2. Clone the AEGIS Repository

- Open PowerShell with Administrator privileges.
- Run the following command to clone the AEGIS repository:
  ```powershell
  git clone https://github.com/YourUsername/AEGIS.git
  ```

#### 3. Navigate to the Project Directory

- Use the following command to navigate to the AEGIS folder:
  ```powershell
  cd AEGIS
  ```

#### 4. Run the Audit Script

- Execute the following command to run the Windows audit script:
  ```powershell
  .\audit-windows.ps1
  ```

#### 5. View the Report

- The audit report will be generated in the `./reports/` folder.

---

### Linux Installation

#### 1. Install Git and Bash (if not already installed)

- Most Linux distributions come with Bash pre-installed. If not, install it:
  ```bash
  sudo apt-get install bash
  ```

- To install Git:
  ```bash
  sudo apt-get install git
  ```

#### 2. Clone the AEGIS Repository

- Open a terminal and run the following command to clone the repository:
  ```bash
  git clone https://github.com/YourUsername/AEGIS.git
  ```

#### 3. Navigate to the Project Directory

- Use the following command to navigate to the AEGIS folder:
  ```bash
  cd AEGIS
  ```

#### 4. Run the Audit Script

- Execute the following command to run the Linux audit script:
  ```bash
  ./audit-linux.sh
  ```

#### 5. View the Report

- The audit report will be generated in the `./reports/` folder.

---

### Blockchain Integration (Optional)

AEGIS offers blockchain integration to ensure the integrity of audit logs. Follow the guide below to enable this feature.

#### Windows Blockchain Integration

1. Run the blockchain audit script for Windows:
   ```powershell
   .\src\blockchain\blockchain-audit.ps1
   ```

2. The blockchain logs will be recorded for each audit and stored securely in a tamper-proof manner.

#### Linux Blockchain Integration

1. Run the blockchain audit script for Linux:
   ```bash
   ./src/blockchain/blockchain-audit.sh
   ```

2. The blockchain audit logs will ensure the integrity of your audit records.

---

### Troubleshooting

#### Windows

- **Execution Policy Error**: 
  If you encounter an error related to script execution policy, run:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

#### Linux

- **Permission Denied**: 
  Ensure that the audit script has execute permissions:
  ```bash
  chmod +x audit-linux.sh
  ```

For further assistance, refer to the [Support](../README.md#support) section.
```

---

### 2. `user-guide.md`

```markdown
# AEGIS User Guide

## Overview

AEGIS is designed to help IT administrators and security experts audit systems for compliance with CIS Benchmarks. It offers powerful automation and customization features, as well as optional blockchain integration to secure audit logs. This guide will walk you through how to use AEGIS effectively.

---

## Running an Audit

The primary function of AEGIS is to run security audits on both **Windows** and **Linux** systems. Below are the steps to run an audit for both platforms.

### Windows

1. **Open PowerShell**: Launch PowerShell as Administrator.
   
2. **Navigate to the AEGIS directory**:
   ```powershell
   cd AEGIS
   ```

3. **Run the audit**:
   ```powershell
   .\audit-windows.ps1
   ```

4. **View the report**: 
   The report will be generated in the `./reports/` folder. Open it using any text editor to review the audit results.

### Linux

1. **Open Terminal**: Launch your terminal with root privileges.

2. **Navigate to the AEGIS directory**:
   ```bash
   cd AEGIS
   ```

3. **Run the audit**:
   ```bash
   ./audit-linux.sh
   ```

4. **View the report**: 
   The report will be available in the `./reports/` folder. Use the following command to view it:
   ```bash
   cat ./reports/linux-audit-report.txt
   ```

---

## Customizing the Audit

AEGIS allows you to customize the audit process based on your organization's security policies.

### Customizing Audit Parameters

- You can modify the parameters in the audit scripts to suit specific CIS Benchmark requirements.
- For example, to customize password policy checks in Windows, open `audit-windows.ps1` and adjust the relevant settings.

### Adding New Audit Checks

- To add new checks:
  - Open the audit script for your platform.
  - Add PowerShell (for Windows) or Bash (for Linux) code to include new security checks.
  - Save your changes and rerun the audit.

---

## Report Generation

AEGIS generates comprehensive audit reports that list system configurations and highlight areas that are not compliant with CIS Benchmarks.

### Understanding the Report

The audit reports generated by AEGIS provide the following information:

- **Audit Date**: The date and time when the audit was performed.
- **System Configuration**: A detailed overview of system configurations, security settings, and network policies.
- **Compliance Status**: Each item is marked as either compliant or non-compliant with CIS benchmarks.
- **Recommendations**: Suggested changes to bring non-compliant settings into compliance.

### Example Report Snippet (Windows)

```plaintext
=================================================
AEGIS AUDIT REPORT
=================================================
Audit Date: 2024-10-14
=================================================
[PASS] Firewall is enabled.
[FAIL] Password complexity requirements are not met.
    Recommendation: Set 'Password must meet complexity requirements' to 'Enabled' in Group Policy.
=================================================
```

### Exporting Reports

- You can export the report to other formats like JSON for further analysis.
- Use the utility scripts in the `src/utils/` folder to generate custom reports:
  
  ```bash
  ./src/utils/generate-report.sh
  ```

---

## Blockchain Integration

AEGIS offers optional blockchain integration to log audit results securely.

### Benefits of Blockchain Logging

- **Tamper-Proof Records**: Audit logs are immutable once recorded on the blockchain.
- **Transparency**: Provides a transparent and secure way to verify audit trails.

### Running Blockchain Audits

- **Windows**: 
  ```powershell
  .\src\blockchain\blockchain-audit.ps1
  ```

- **Linux**:
  ```bash
  ./src/blockchain/blockchain-audit.sh
  ```

Once executed, blockchain audit logs will be stored in a decentralized manner, ensuring data integrity.

---

## Best Practices

- **Run Regular Audits**: Schedule regular audits to ensure continued compliance with CIS Benchmarks.
- **Backup Audit Reports**: Always back up your audit reports and blockchain logs for future reference.
- **Stay Updated**: Ensure that your AEGIS audit scripts are up to date with the latest CIS Benchmark versions.
- **Test Changes**: When adding custom checks, always test them in a development environment before deploying them in production.

---

## Troubleshooting

Here are some common issues and their solutions:

- **Scripts Not Running**: Ensure that you have the required permissions and execution policies set correctly.
- **Blockchain Logs Not Storing**: Verify that your blockchain node is running correctly and has access to write data.
- **Report Generation Errors**: Ensure that all necessary dependencies are installed.

For more detailed assistance, refer to the [Support](../README.md#support) section.

---

## Additional Resources

- [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks/)
- [PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)
- [Bash Scripting Guide](https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html)

```

---

These documents provide detailed installation instructions and user guidance for your **AEGIS** project. Let me know if you need further adjustments!
