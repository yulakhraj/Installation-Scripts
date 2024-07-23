#!/bin/bash

#################################
#                               #
#     TERRAFROM INSTALL         #
#                               #
#################################

set -e

# Add HashiCorp GPG key
wget -q -O - https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add HashiCorp repository
sudo sh -c 'echo deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main > /etc/apt/sources.list.d/hashicorp.list'

# Update package list
sudo apt update

# Install Terraform
sudo apt install -y terraform

# Verify Terraform installation
terraform version
