#!/bin/bash

#################################
#				#
#        KUBECTL INSTALL	#
#				#
#################################

set -e

sudo apt update

# Download the latest release of kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Verify kubectl installation
kubectl version --client --output=yaml

