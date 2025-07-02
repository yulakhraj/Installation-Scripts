# DevOps Tools Installation Scripts

This repository contains Bash scripts for installing various DevOps tools on Linux systems. The scripts offer a menu-based interface for selecting and installing tools, making it easy to set up your development and operations environment.

## Overview

### `install.sh`

This script is designed to provide a menu-driven interface for installing a variety of DevOps tools. It allows you to select tools from a list and install them with default options to avoid prompts.

![Screenshot](https://github.com/user-attachments/assets/56c1c04f-0034-4a7f-812a-1f8255f881e1)

### `all_devops_tools.sh`

This script is a comprehensive installer that integrates the installation of various tools and provides detailed output, including headers and success messages, for better visibility and tracking of the installation process.

![Screenshot](https://github.com/user-attachments/assets/76031289-0198-455e-ac95-7776a55740c9)

## Features

- **Menu-Based Installation**: Choose tools to install from a simple menu interface.
- **Automated Installation**: Install tools with default options to avoid prompts.
- **Color-Coded Output**: Clear headers and success messages with color formatting.

## Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yulakhraj/Installation-Scripts.git
   cd your-repository
   ```
2. **Make Scripts Executable**:
   ```
   chmod +x install.sh
   chmod +x all_devops_tools.sh
   ```
## Usage
Running `install.sh`

This script provides a menu for selecting which tools to install. Run it with:
```
./install.sh
```
Follow the prompts to choose and install the desired tools.

Running `all_devops_tools.sh`

This script installs a comprehensive set of DevOps tools and provides detailed output. Run it with:
```
./all_devops_tools.sh
```
The script will show headers and success messages during installation.

## Tools Included

### Containerization

- **Docker**: Container platform for building and deploying applications in standardized units called containers. [Get Started with Docker](https://docs.docker.com/get-started/)
- **Docker Compose**: Tool for defining and running multi-container Docker applications with ease. [Docker Compose Documentation](https://docs.docker.com/compose/)

### Build Automation Tools

- **Maven**: Popular build automation tool for Java projects, streamlining the build process. [Maven Website](https://maven.apache.org/)
- **Gradle**: Versatile build automation tool for various project types, offering flexibility in the build process. [Gradle Installation Guide](https://docs.gradle.org/current/userguide/installation.html)

### Continuous Integration/Continuous Delivery (CI/CD) Tools

- **Jenkins**: Open-source automation server for building, testing, and deploying software, enabling CI/CD pipelines. [Jenkins Website](https://www.jenkins.io/)

### Configuration Management Tools

- **Ansible**: Powerful tool for automating configuration management and application deployment across various platforms. [Ansible Website](https://www.ansible.com/)
- **Chef**: Robust configuration management tool for infrastructure and applications, ensuring consistency across environments. [Chef Website](https://www.chef.io/)
- **Puppet**: Open-source IT automation framework for managing configurations of servers and network devices. [Puppet Website](https://puppet.com/)

### Infrastructure as Code (IaC) Tool

- **Terraform**: Open-source tool for defining and provisioning infrastructure using code, ensuring repeatable and maintainable infrastructure. [Terraform Website](https://www.terraform.io/)

### Monitoring and Alerting Tools

- **Prometheus**: Open-source toolkit for monitoring and alerting based on time series data, providing insights into system health. [Prometheus Website](https://prometheus.io/)
- **Grafana**: Open-source analytics and monitoring platform for visualizing metrics and logs, allowing for data exploration and analysis. [Grafana Website](https://grafana.com/)

### ELK Stack

- **Elasticsearch**: Distributed search and analytics engine for log data. [Elasticsearch Website](https://www.elastic.co/elasticsearch/)
- **Logstash**: Server-side data processing pipeline for transforming and enriching log data. [Logstash Website](https://www.elastic.co/logstash/)
- **Kibana**: Data visualization tool for interacting with data stored in Elasticsearch. [Kibana Documentation](https://www.elastic.co/kibana/)

### Cloud Provider Tools

- **AWS CLI**: Command-line interface for interacting with Amazon Web Services (AWS) resources. [AWS CLI Website](https://aws.amazon.com/cli/)
- **Azure CLI**: Command-line interface for managing Azure cloud resources. [Azure CLI Documentation](https://docs.microsoft.com/en-us/cli/azure/)
- **Google Cloud SDK**: Command-line tools for managing Google Cloud Platform (GCP) resources. [Google Cloud SDK Website](https://cloud.google.com/sdk)

### Networking Tools

- **Netcat**: Simple network utility for reading and writing data across TCP or UDP connections. [Netcat Documentation](https://nc110.sourceforge.io/)
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

