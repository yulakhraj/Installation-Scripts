#!/bin/bash

#################################
#				#
#     MiNIKUBE INSTALL		#
#				#
#################################

set -e

sudo apt update

# Download the latest release of Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Install Minikube
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Verify Minikube installation
minikube version

