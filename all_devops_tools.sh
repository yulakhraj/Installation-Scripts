#!/bin/bash

set -e

# -----------------------------
# UI HELPERS
# -----------------------------
print_header() {
    echo -e "\033[1;34m====================================================\033[0m"
    echo -e "\033[1;34m $1 \033[0m"
    echo -e "\033[1;34m====================================================\033[0m"
}

print_success() {
    echo -e "\033[1;32m✔ $1\033[0m"
}

display_read_message() {
    local name="$1"
    local action="$2"

    clear
    echo "**************************************************"
    echo "******************  Installing  ******************"
    echo "**************************************************"
    echo ""
    echo " $action"
    echo " Tool: $name"
    echo ""
    echo "**************************************************"
    echo ""
    sleep 2
}

is_tool_installed() {
    local cmd="$1"
    eval "$cmd" >/dev/null 2>&1
}

print_install_action() {
    local name="$1"
    local check_cmd="$2"
    if is_tool_installed "$check_cmd"; then
        display_read_message "$name" "Upgrading $name"
        print_header "Upgrading $name"
    else
        display_read_message "$name" "Fresh install of $name"
        print_header "Fresh install of $name"
    fi
}

get_installed_version() {
    local cmd="$1"
    local output
    output=$(eval "$cmd" 2>/dev/null || true)
    echo "${output%%$'\n'*}"
}

print_tool_installed() {
    local name="$1"
    local cmd="$2"
    local version
    version=$(get_installed_version "$cmd")
    if [[ -n "$version" ]]; then
        print_success "${name^^} INSTALLED - $version"
    else
        print_success "${name^^} INSTALLED"
    fi
}

# -----------------------------
# BASE SETUP
# -----------------------------
update_system() {
    print_header "Updating System"
    sudo apt-get update -y
}

install_basic_tools() {
    print_header "Installing Basic Dependencies"
    sudo apt-get install -y curl wget unzip gnupg lsb-release ca-certificates software-properties-common
}

# -----------------------------
# DOCKER (LATEST OFFICIAL)
# -----------------------------
install_docker() {
    print_install_action "Docker" "docker --version"

    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo systemctl enable docker
    sudo systemctl start docker

    print_tool_installed "Docker" "docker --version"
}

# -----------------------------
# TERRAFORM (LATEST)
# -----------------------------
install_terraform() {
    print_install_action "Terraform" "terraform version"

    curl -fsSL https://apt.releases.hashicorp.com/gpg | \
      sudo gpg --dearmor -o /usr/share/keyrings/hashicorp.gpg

    echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] \
      https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
      sudo tee /etc/apt/sources.list.d/hashicorp.list

    sudo apt-get update -y
    sudo apt-get install -y terraform

    print_tool_installed "Terraform" "terraform version | head -n1"
}

# -----------------------------
# JENKINS (JAVA 21)
# -----------------------------
install_jenkins() {
    print_install_action "Jenkins" "jenkins --version 2>/dev/null || dpkg-query -W -f='${Version}' jenkins 2>/dev/null"

    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
      sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
      https://pkg.jenkins.io/debian-stable binary/" | \
      sudo tee /etc/apt/sources.list.d/jenkins.list

    sudo apt-get update -y
    sudo apt-get install -y openjdk-21-jdk jenkins

    sudo systemctl enable jenkins
    sudo systemctl start jenkins

    print_tool_installed "Jenkins" "jenkins --version 2>/dev/null || dpkg-query -W -f='${Version}' jenkins 2>/dev/null"
}

# -----------------------------
# ANSIBLE
# -----------------------------
install_ansible() {
    print_install_action "Ansible" "ansible --version"
    sudo apt-get install -y ansible
    print_tool_installed "Ansible" "ansible --version | head -n1"
}

# -----------------------------
# AWS CLI
# -----------------------------
install_aws_cli() {
    print_install_action "AWS CLI" "aws --version"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
    unzip -o awscliv2.zip
    sudo ./aws/install --update
    print_tool_installed "AWS CLI" "aws --version 2>&1 | head -n1"
}

# -----------------------------
# AZURE CLI
# -----------------------------
install_azure_cli() {
    print_install_action "Azure CLI" "az --version"
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    print_tool_installed "Azure CLI" "az --version | head -n1"
}

# -----------------------------
# KUBECTL (LATEST)
# -----------------------------
install_kubectl() {
    print_install_action "kubectl" "kubectl version --client --short"

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/

    print_tool_installed "kubectl" "kubectl version --client --short"
}

# -----------------------------
# KIND (K8s in Docker)
# -----------------------------
install_kind() {
    print_install_action "kind" "kind --version"

    curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
    chmod +x kind
    sudo mv kind /usr/local/bin/kind

    print_tool_installed "kind" "kind --version"
}

# -----------------------------
# DATABASES
# -----------------------------
install_mysql() {
    print_install_action "MySQL" "mysql --version"
    sudo apt-get install -y mysql-server
    print_tool_installed "MySQL" "mysql --version"
}

install_postgres() {
    print_install_action "PostgreSQL" "psql --version"
    sudo apt-get install -y postgresql
    print_tool_installed "PostgreSQL" "psql --version"
}

# -----------------------------
# MENU
# -----------------------------
show_menu() {
    echo ""
    echo "========= DevOps Installer ========="
    echo "1  Docker"
    echo "2  Terraform"
    echo "3  Jenkins"
    echo "4  Ansible"
    echo "5  AWS CLI"
    echo "6  Azure CLI"
    echo "7  kubectl"
    echo "8  kind"
    echo "9  MySQL"
    echo "10 PostgreSQL"
    echo "0  Exit"
    echo ""
}

handle_choice() {
    case $1 in
        1) install_docker ;;
        2) install_terraform ;;
        3) install_jenkins ;;
        4) install_ansible ;;
        5) install_aws_cli ;;
        6) install_azure_cli ;;
        7) install_kubectl ;;
        8) install_kind ;;
        9) install_mysql ;;
        10) install_postgres ;;
        *) echo "Invalid option: $1" ;;
    esac
}

# -----------------------------
# MAIN
# -----------------------------
update_system
install_basic_tools

while true; do
    show_menu
    echo "Enter choices (space separated, e.g. 1 3 7):"
    read choices

    for choice in $choices; do
        if [[ "$choice" == "0" ]]; then
            print_header "Exiting..."
            exit 0
        fi
        handle_choice $choice
    done
done
