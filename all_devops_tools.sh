#!/bin/bash

# Function to print a header
print_header() {
    local msg="$1"
    local color="\033[1;34m" # Blue color
    local reset="\033[0m"    # Reset color

    echo -e "${color}#######################################################################${reset}"
    echo -e "${color}           ${msg}                   ${reset}"
    echo -e "${color}#######################################################################${reset}"
}

# Function to print a success message
print_success() {
    local msg="$1"
    local color="\033[1;32m" # Green color
    local reset="\033[0m"    # Reset color

    echo -e "${color}#######################################################################${reset}"
    echo -e "${color}           ${msg}                   ${reset}"
    echo -e "${color}#######################################################################${reset}"
}

# Function to install Docker
install_docker() {
    print_header "Installing Docker"
    sudo apt-get update -y
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    print_success "Docker installed successfully."
}

# Function to install Docker Compose
install_docker_compose() {
    print_header "Installing Docker Compose"
    sudo apt-get update -y
    sudo apt-get install -y docker-compose
    print_success "Docker Compose installed successfully."
}

# Function to install Maven
install_maven() {
    print_header "Installing Maven"
    sudo apt-get update -y
    sudo apt-get install -y maven
    print_success "Maven installed successfully."
}

# Function to install Gradle
install_gradle() {
    print_header "Installing Gradle"
    sudo apt-get update -y
    sudo apt-get install -y gradle
    print_success "Gradle installed successfully."
}

# Function to install Jenkins
install_jenkins() {
    print_header "Installing Jenkins"
    
	sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
	sudo apt-get update -y
	sudo apt-get install jenkins -y
    print_success "Jenkins installed and started."
}

# Function to install Ansible
install_ansible() {
    print_header "Installing Ansible"
    sudo apt-get update -y
    sudo apt-get install -y ansible
    print_success "Ansible installed successfully."
}

# Function to install Chef
install_chef() {
    print_header "Installing Chef"
    curl -L https://www.chef.io/chef/install.sh | sudo bash
    print_success "Chef installed successfully."
}

# Function to install Puppet
install_puppet() {
    print_header "Installing Puppet"
    sudo apt-get update -y
    sudo apt-get install -y puppet
    print_success "Puppet installed successfully."
}

# Function to install Terraform
install_terraform() {
    print_header "Installing Terraform"
    wget https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_amd64.zip
    unzip terraform_1.3.0_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
    print_success "Terraform installed successfully."
}

# Function to install Prometheus
install_prometheus() {
    print_header "Installing Prometheus"
    wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
    tar xvfz prometheus-2.43.0.linux-amd64.tar.gz
    cd prometheus-2.43.0.linux-amd64/
    ./prometheus &
    cd ..
    print_success "Prometheus installed and started."
}

# Function to install Grafana
install_grafana() {
    print_header "Installing Grafana"
    wget https://dl.grafana.com/oss/release/grafana-9.6.2.linux-amd64.tar.gz
    tar -zxvf grafana-9.6.2.linux-amd64.tar.gz
    cd grafana-9.6.2
    ./bin/grafana-server &
    cd ..
    print_success "Grafana installed and started."
}

# Function to install ELK Stack
install_elk() {
    print_header "Installing ELK Stack"
    # Install Elasticsearch
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.3.0-linux-x86_64.tar.gz
    tar -xzf elasticsearch-8.3.0-linux-x86_64.tar.gz
    cd elasticsearch-8.3.0
    ./bin/elasticsearch &
    
    # Install Logstash
    wget https://artifacts.elastic.co/downloads/logstash/logstash-8.3.0-linux-x86_64.tar.gz
    tar -xzf logstash-8.3.0-linux-x86_64.tar.gz
    cd logstash-8.3.0
    ./bin/logstash &
    
    # Install Kibana
    wget https://artifacts.elastic.co/downloads/kibana/kibana-8.3.0-linux-x86_64.tar.gz
    tar -xzf kibana-8.3.0-linux-x86_64.tar.gz
    cd kibana-8.3.0
    ./bin/kibana &
    cd ..
    print_success "ELK Stack installed and started."
}

# Function to install AWS CLI
install_aws_cli() {
    print_header "Installing AWS CLI"
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
    print_success "AWS CLI installed successfully."
}

# Function to install Azure CLI
install_azure_cli() {
    print_header "Installing Azure CLI"
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    print_success "Azure CLI installed successfully."
}

# Function to install Google Cloud SDK
install_gcloud_sdk() {
    print_header "Installing Google Cloud SDK"
    curl https://sdk.cloud.google.com | bash
    exec -l $SHELL
    gcloud init
    print_success "Google Cloud SDK installed successfully."
}

# Function to install Netcat
install_netcat() {
    print_header "Installing Netcat"
    sudo apt-get update -y
    sudo apt-get install -y netcat
    print_success "Netcat installed successfully."
}

# Function to install Nmap
install_nmap() {
    print_header "Installing Nmap"
    sudo apt-get update -y
    sudo apt-get install -y nmap
    print_success "Nmap installed successfully."
}

# Function to install Python3
install_python() {
    print_header "Installing Python3"
    sudo apt-get update -y
    sudo apt-get install -y python3
    print_success "Python3 installed successfully."
}

# Function to install MySQL
install_mysql() {
    print_header "Installing MySQL"
    sudo apt-get update -y
    sudo apt-get install -y mysql-server
    print_success "MySQL installed successfully."
}

# Function to install PostgreSQL
install_postgresql() {
    print_header "Installing PostgreSQL"
    sudo apt-get update -y
    sudo apt-get install -y postgresql
    print_success "PostgreSQL installed successfully."
}

# Display menu
display_menu() {
    echo "DevOps Tools Installer"
    echo "1. Install Docker"
    echo "2. Install Docker Compose"
    echo "3. Install Maven"
    echo "4. Install Gradle"
    echo "5. Install Jenkins"
    echo "6. Install Ansible"
    echo "7. Install Chef"
    echo "8. Install Puppet"
    echo "9. Install Terraform"
    echo "10. Install Prometheus"
    echo "11. Install Grafana"
    echo "12. Install ELK Stack"
    echo "13. Install AWS CLI"
    echo "14. Install Azure CLI"
    echo "15. Install Google Cloud SDK"
    echo "16. Install Netcat"
    echo "17. Install Nmap"
    echo "18. Install Python3"
    echo "19. Install MySQL"
    echo "20. Install PostgreSQL"
    echo "0. Exit"
}

# Main script
while true; do
    display_menu
    read -p "Choose an option: " option
    case $option in
        1) install_docker ;;
        2) install_docker_compose ;;
        3) install_maven ;;
        4) install_gradle ;;
        5) install_jenkins ;;
        6) install_ansible ;;
        7) install_chef ;;
        8) install_puppet ;;
        9) install_terraform ;;
        10) install_prometheus ;;
        11) install_grafana ;;
        12) install_elk ;;
        13) install_aws_cli ;;
        14) install_azure_cli ;;
        15) install_gcloud_sdk ;;
        16) install_netcat ;;
        17) install_nmap ;;
        18) install_python ;;
        19) install_mysql ;;
        20) install_postgresql ;;
        0) print_header "Exiting..."; exit ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
