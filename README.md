# AEGIS


**AEGIS** (Automated Evaluation and Governance for Information Security) is a robust, automated cybersecurity audit tool designed to assess and ensure compliance with the Center for Internet Security (CIS) benchmarks for both Windows and Linux systems. Utilizing PowerShell, Bash, and Blockchain technology, AEGIS provides an advanced, scalable solution for auditing and safeguarding IT infrastructures in both small and large organizations.

---

## Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Installation](#installation)
   - [Windows Installation](#windows-installation)
   - [Linux Installation](#linux-installation)
4. [Usage](#usage)
   - [Running the Audit](#running-the-audit)
   - [Report Generation](#report-generation)
   - [Blockchain Integration](#blockchain-integration)
5. [Project Structure](#project-structure)
6. [Technology Stack](#technology-stack)
7. [Contributing](#contributing)
8. [License](#license)
9. [FAQ](#faq)
10. [Support](#support)

---

## Overview

AEGIS provides organizations with an automated solution for auditing their systems against CIS benchmarks. By integrating blockchain technology, AEGIS ensures tamper-proof logging of audit trails, making it ideal for compliance verification, internal audits, and third-party assessments. 

The tool supports both **Windows** and **Linux** operating systems, offering customizable audit scripts for seamless integration into diverse IT environments.

---

## Features

- **Cross-Platform Auditing**: Supports both Windows (PowerShell) and Linux (Bash) systems.
- **CIS Benchmark Compliance**: Automated checks for compliance with the latest CIS benchmarks.
- **Blockchain Integration**: Leverages blockchain technology to ensure integrity and security of audit logs.
- **Customizable Reports**: Generate detailed audit reports tailored to organizational needs.
- **Scalability**: Supports auditing for large IT environments, from small businesses to enterprises.
- **Open Source**: Licensed under the MIT License, AEGIS is open for collaboration and customization.

---

## Installation

### Windows Installation

1. **Ensure you have PowerShell** (version 5.1 or higher) installed on your Windows system.
   
2. **Clone the AEGIS repository**:
   ```powershell
   git clone https://github.com/YourUsername/AEGIS.git
   ```

3. **Navigate to the project directory**:
   ```powershell
   cd AEGIS
   ```

4. **Run the audit script**:
   ```powershell
   .\audit-windows.ps1
   ```

5. **View the audit report** in the `./reports/` directory.

---

### Linux Installation

1. **Ensure you have Bash and Git** installed on your Linux system.

2. **Clone the AEGIS repository**:
   ```bash
   git clone https://github.com/YourUsername/AEGIS.git
   ```

3. **Navigate to the project directory**:
   ```bash
   cd AEGIS
   ```

4. **Run the audit script**:
   ```bash
   ./audit-linux.sh
   ```

5. **View the audit report** in the `./reports/` directory.

---

## Usage

### Running the Audit

Once the installation is complete, running an audit is straightforward:

- **Windows**: 
   ```powershell
   .\audit-windows.ps1
   ```
  
- **Linux**: 
   ```bash
   ./audit-linux.sh
   ```

The audit scripts will check for various CIS Benchmark compliance settings such as password policies, firewall configurations, auditing policies, and more.

### Report Generation

Upon completion of the audit, a detailed report is generated in the `./reports/` directory:

- **Windows Report**: `./reports/windows-audit-report.txt`
- **Linux Report**: `./reports/linux-audit-report.txt`

These reports can be customized based on the specific needs of the organization.

### Blockchain Integration

For enhanced security and audit traceability, AEGIS logs audit results to a blockchain, ensuring the integrity of the audit trails. To configure and enable blockchain-based audit logging:

- For **Windows**: The blockchain audit script can be executed via `src/blockchain/blockchain-audit.ps1`.
- For **Linux**: Run the blockchain audit script `src/blockchain/blockchain-audit.sh`.

This ensures that all audit logs are immutable and secure.

---

## Project Structure

```plaintext
AEGIS/
├── LICENSE
├── README.md
├── audit-windows.ps1
├── audit-linux.sh
├── docs/
│   ├── installation.md
│   └── user-guide.md
└── src/
    ├── blockchain/
    │   ├── blockchain-audit.ps1
    │   └── blockchain-audit.sh
    ├── utils/
    │   ├── generate-report.ps1
    │   └── generate-report.sh
    └── examples/
        └── example-audit.json
```

### File Descriptions

- **LICENSE**: Open-source MIT License.
- **README.md**: Project overview and usage documentation.
- **audit-windows.ps1**: PowerShell script for auditing Windows systems.
- **audit-linux.sh**: Bash script for auditing Linux systems.
- **docs/**: Contains documentation files for installation and user guidance.
- **src/blockchain/**: Contains blockchain-related audit scripts.
- **src/utils/**: Utility scripts for report generation.
- **src/examples/**: Example audit files for demonstration purposes.

---

## Technology Stack

- **PowerShell** (Windows auditing)
- **Bash** (Linux auditing)
- **Blockchain** (Immutable audit logs)
- **Git** (Version control)
- **Markdown** (Documentation)

---

## Contributing

We welcome contributions to AEGIS! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add feature'`).
5. Push to the branch (`git push origin feature/your-feature`).
6. Open a Pull Request.

Please ensure that your code adheres to the style guidelines and that you have tested your changes before submitting a PR.

---

## License

AEGIS is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more information.

---

## FAQ

### 1. What is CIS Benchmark?
CIS Benchmarks are consensus-based, best practice security configurations that help organizations secure their IT systems.

### 2. Can I add custom audit checks?
Yes, both the PowerShell and Bash scripts can be customized to add or remove specific CIS benchmark checks.

### 3. Is AEGIS suitable for large organizations?
Yes, AEGIS is scalable and can be used in environments with multiple systems or endpoints. The blockchain integration also ensures audit log integrity, which is important for larger setups.

### 4. Does AEGIS work for all versions of Windows and Linux?
AEGIS supports Windows 10/11 and popular Linux distributions like Ubuntu, Red Hat, and CentOS. The audit scripts can be further customized for other OS versions.

### 5. How can I report a bug or suggest a feature?
You can report bugs or suggest features via the GitHub [Issues](https://github.com/YourUsername/AEGIS/issues) page.

---

## Support

For any issues or questions, feel free to contact us via:

- **Email**: support@aegis.com
- **GitHub Issues**: [AEGIS Issues](https://github.com/YourUsername/AEGIS/issues)

We are happy to assist you with any problems or feature requests.
```

---

This **README.md** file gives a comprehensive guide to the AEGIS project, covering installation, usage, features, and much more. You can customize sections like the "Support" or "FAQ" further based on your specific requirements. Let me know if you'd like to refine any specific parts!
