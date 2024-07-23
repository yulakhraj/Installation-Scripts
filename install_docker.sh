#!/bin/bash

#################################
#				#
#       DOCKER INSTALL		#
#				#
#################################
set -e

# Update package list
sudo apt update

# Install necessary packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker APT repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package list again
sudo apt update

# Install Docker packages
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verify Docker installation
docker --version

