#!/bin/bash
# This file is for a fresh new installation of an apt package manager system like Debian or Ubuntu
# It install some basics packages, python3, docker and the cli for Azure and AWS
# The rest of the configuration is left for the user itself


# Update the system packages
sudo apt -y update
# Install the available updates
sudo apt -y upgrade

# Install the basics
sudo apt -y install git ssh wget curl unzip jq cowsay fortune telnet

# Install Python and Python extras
python3 python-pip pipx 

### Install Docker Engine
# Add Docker's official GPG key:
sudo apt-get -y update
sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start docker and enabled it 
sudo service docker start # On WSL


### AWS cli installation
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Delete the AWS packages
rm -rf aws awscliv2.zip

### AZURE cli installation
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
