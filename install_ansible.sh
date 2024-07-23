#!/bin/bash

#################################
#                               #
#     ANSIBLE INSTALL           #
#                               #
#################################

set -e

# Update package list
sudo apt update

# Install software-properties-common
sudo apt install -y software-properties-common

# Add Ansible PPA and update package list
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Verify Ansible installation
ansible --version
