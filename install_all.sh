#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

print_header() {
    local msg="$1"
    local color="\033[1;34m" # Blue color
    local reset="\033[0m"    # Reset color

    echo -e "${color}#######################################################################${reset}"
    echo -e "${color}          	${msg}                  			${reset}"
    echo -e "${color}#######################################################################${reset}"
}

print_success() {
    local msg="$1"
    local color="\033[1;32m" # Green color
    local reset="\033[0m"    # Reset color

    echo -e "${color}#######################################################################${reset}"
    echo -e "${color}  			${msg}                  			${reset}"
    echo -e "${color}#######################################################################${reset}"
}

install_docker() {
    print_header "Installing Docker"
    sudo apt install -y apt-transport-https ca-certificates curl
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    print_success "Docker installed successfully"
    docker --version
}

install_kubectl() {
    print_header "Installing kubectl"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    print_success "kubectl installed successfully"
    kubectl version --client --output=yaml
}

install_minikube() {
    print_header "Installing Minikube"
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    print_success "Minikube installed successfully"
    minikube version
}

install_terraform() {
    print_header "Installing Terraform"
    wget -q -O - https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo sh -c 'echo deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main > /etc/apt/sources.list.d/hashicorp.list'
    sudo apt update
    sudo apt install -y terraform
    print_success "Terraform installed successfully"
    terraform version
}

install_ansible() {
    print_header "Installing Ansible"
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
    print_success "Ansible installed successfully"
    ansible --version
}

install_jenkins() {
    print_header "Installing Jenkins"
    echo "Adding Jenkins keyring..."
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
      https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

    echo "Adding Jenkins repository..."
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
      | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

    echo "Updating package list..."
    sudo apt-get update

    echo "Installing Jenkins..."
    sudo apt-get install jenkins -y
    print_success "Jenkins installed successfully"
}

install_java() {
    print_header "Installing Java"
    echo "Updating package list..."
    sudo apt update

    echo "Installing default JDK..."
    sudo apt install default-jdk -y

    echo "Verifying Java installation..."
    java -version
    print_success "Java installed successfully"
}

while true; do
	echo "*************************************"
    echo "Select Software to Install in Linux:"
	echo "*************************************"
	echo " "
    echo "1) Docker"
    echo "2) kubectl"
    echo "3) Minikube"
    echo "4) Terraform"
    echo "5) Ansible"
    echo "6) Jenkins"
    echo "7) Java"
    echo "8) All of the above"
    echo "9) Exit"
    read -p "Enter your choice [1-9]: " choice

    case $choice in
        1) install_docker ;;
        2) install_kubectl ;;
        3) install_minikube ;;
        4) install_terraform ;;
        5) install_ansible ;;
        6) install_jenkins ;;
        7) install_java ;;
        8)
            install_docker
            install_kubectl
            install_minikube
            install_terraform
            install_ansible
            install_jenkins
            install_java
            ;;
        9) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please select a number between 1 and 9." ;;
    esac

    echo ""
done
