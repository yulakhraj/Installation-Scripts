# DevOps Tools Installation Script

This repository contains a Bash script for installing various DevOps tools on Linux systems. The script provides a menu-based interface for selecting and installing tools, making it easy to set up your development and operations environment.

## Overview

### `all_devops_tools.sh`

This script offers a comprehensive installer for DevOps tools with a user-friendly menu. It updates the system, installs basic dependencies, and allows you to select from a list of tools to install. The script provides detailed output with color-coded headers and success messages for better visibility and tracking of the installation process.

## Features

- **Menu-Based Installation**: Choose tools to install from a simple numbered menu interface.
- **Automated Installation**: Install tools with default options to avoid prompts.
- **Color-Coded Output**: Clear headers and success messages with color formatting.
- **System Update**: Automatically updates the system and installs basic dependencies before tool installation.

## Prerequisites

- Ubuntu or Debian-based Linux distribution
- sudo privileges
- Internet connection for downloading packages

## Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yulakhraj/Installation-Scripts.git
   cd Installation-Scripts
   ```

2. **Make the Script Executable**:

   ```bash
   chmod +x all_devops_tools.sh
   ```

## Usage

Run the script with:

```bash
./all_devops_tools.sh
```

The script will:
1. Update your system packages
2. Install basic dependencies (curl, wget, unzip, etc.)
3. Display a menu with available tools
4. Allow you to select tools by entering their numbers (space-separated for multiple selections)
5. Install the selected tools with progress indicators

Example: To install Docker and Terraform, enter `1 2` when prompted.

## Tools Included

The script can install the following tools:

1. **Docker**: Container platform for building and deploying applications in standardized units called containers.
2. **Terraform**: Open-source tool for defining and provisioning infrastructure using code.
3. **Jenkins**: Open-source automation server for building, testing, and deploying software (includes Java 21).
4. **Ansible**: Powerful tool for automating configuration management and application deployment.
5. **AWS CLI**: Command-line interface for interacting with Amazon Web Services (AWS) resources.
6. **Azure CLI**: Command-line interface for managing Azure cloud resources.
7. **kubectl**: Command-line tool for controlling Kubernetes clusters.
8. **kind**: Tool for running local Kubernetes clusters using Docker container nodes.
9. **MySQL**: Open-source relational database management system.
10. **PostgreSQL**: Advanced open-source relational database.

## Notes

- The script installs the latest stable versions of the tools where possible.
- Some tools may require additional configuration after installation (e.g., Docker user group, Jenkins initial setup).
- For production use, review the installed versions and security settings.
- The script uses `sudo` for system-level installations, so ensure your user has appropriate permissions.

## Contributing

Feel free to submit issues or pull requests to add more tools or improve the installation process.
- **Nmap**: Powerful network scanner for discovering services and vulnerabilities on computer networks. [Nmap Website](https://nmap.org/)

### Programming Languages

- **Python3**: General-purpose programming language widely used in DevOps scripting and automation. [Python Website](https://www.python.org/)

### Databases

- **MySQL**: Popular open-source relational database management system (RDBMS) for storing and managing structured data. [MySQL Website](https://www.mysql.com/)
- **PostgreSQL**: Powerful open-source object-relational database management system (ORDBMS) with advanced features. [PostgreSQL Website](https://www.postgresql.org/)

## Troubleshooting

* 1. If you encounter any issues while using these tools, consider the following steps:
* 2. Check Logs: Review the logs of the relevant tool for error messages that might indicate the cause of the problem.
* 3. Verify Configuration: Ensure that configuration files are set up correctly and contain the necessary parameters.
* 4. Restart Services: Sometimes restarting affected services can resolve temporary issues.
* 5. Consult Documentation: Refer to the official documentation for each tool, as it often provides detailed troubleshooting steps specific to the tool.

## Contribution

We welcome contributions to this project! You can contribute by:
- Submitting issues to report bugs or suggest improvements.
- Creating feature requests for functionalities you'd like to see added.
- Submitting pull requests with your contributions to the codebase.
- All Okay

