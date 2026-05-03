# DevOps Tools Installation Script

This repository provides a Bash script to simplify the installation of essential DevOps tools on Linux systems. The script features a user-friendly menu interface, allowing you to select and install tools effortlessly, along with system updates and dependency installations.

## Overview

The `all_devops_tools.sh` script is designed to automate the setup of a DevOps environment. It updates your system, installs necessary dependencies, and offers a menu to choose from a curated list of popular DevOps tools. Each installation includes progress indicators and color-coded output for clarity.

## Features

- **Interactive Menu**: Select tools from a numbered list for easy installation.
- **Automated Setup**: Handles system updates, dependencies, and tool installations with minimal user intervention.
- **Color-Coded Feedback**: Provides clear, colored output for installation status and errors.
- **Comprehensive Coverage**: Supports a wide range of DevOps tools, from containerization to cloud CLIs.

## Prerequisites

- A Debian-based Linux distribution (e.g., Ubuntu).
- Sudo privileges to install system packages.
- An active internet connection for downloading tools and updates.

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

Execute the script to begin:
```bash
./all_devops_tools.sh
```

The script will:
1. Update your system packages.
2. Install essential dependencies (e.g., curl, wget, unzip).
3. Present a menu of available tools.
4. Prompt for tool selection (enter numbers separated by spaces).
5. Install the selected tools with real-time progress.

**Example**: To install Docker and Terraform, enter `1 2` at the prompt.

## Supported Tools

The script supports installation of the following tools:

1. **Docker** - Containerization platform for building and deploying applications.
2. **Terraform** - Infrastructure as Code tool for provisioning resources.
3. **Jenkins** - Automation server for CI/CD pipelines (includes Java 21).
4. **Ansible** - Configuration management and automation tool.
5. **AWS CLI** - Command-line interface for Amazon Web Services.
6. **Azure CLI** - Command-line interface for Microsoft Azure.
7. **kubectl** - Kubernetes cluster management tool.
8. **kind** - Tool for running local Kubernetes clusters.
9. **MySQL** - Open-source relational database management system.
10. **PostgreSQL** - Advanced open-source relational database.
11. **Nmap** - Network scanning and security auditing tool.
12. **Python3** - Programming language for scripting and automation.

## Notes

- Installs the latest stable versions where available.
- Some tools (e.g., Docker, Jenkins) may require post-installation configuration, such as adding users to groups or initial setup.
- Review installed versions and security settings for production environments.
- The script requires `sudo` for system-level changes.

## Troubleshooting

If you encounter issues:
- **Check Logs**: Examine tool-specific logs for error details.
- **Verify Permissions**: Ensure you have sudo access and correct file permissions.
- **Restart Services**: Try restarting affected services or your system.
- **Consult Documentation**: Refer to the official documentation for each tool.
- **Script Issues**: Run with verbose output or check for dependency conflicts.

## Contributing

Contributions are welcome! To add new tools or improve the script:
1. Fork the repository.
2. Create a feature branch.
3. Make your changes and test thoroughly.
4. Submit a pull request with a clear description.

For bug reports or feature requests, please open an issue on GitHub.

## License

This project is open-source. Please refer to the repository for licensing details.

We welcome contributions to this project! You can contribute by:
- Submitting issues to report bugs or suggest improvements.
- Creating feature requests for functionalities you'd like to see added.
- Submitting pull requests with your contributions to the codebase.
- All Okay

