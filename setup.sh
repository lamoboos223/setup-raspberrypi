#!/bin/bash

apt update

# curl
apt install curl

# Git
apt install git

# Docker
apt update
apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Python3
apt update
apt install python3.9
apt install python3-pip
curl -s https://raw.githubusercontent.com/lamoboos223/setup-raspberrypi/master/python-packages.sh | bash

# java
apt update && apt upgrade -y
apt install default-jdk -y
apt install maven

# Mysql
apt update
apt install mysql-server
mysql_secure_installation

# Azure DevOps
mkdir azagent;cd azagent;curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.211.0/vsts-agent-linux-arm64-2.211.0.tar.gz;tar -zxvf vstsagent.tar.gz; if [ -x "$(command -v systemctl)" ]; then ./config.sh --deploymentgroup --deploymentgroupname "RaspberryPi" --acceptteeeula --agent $HOSTNAME --url https://dragonico.visualstudio.com/ --work _work --projectname 'dragoni' --runasservice; sudo ./svc.sh install; sudo ./svc.sh start; else ./config.sh --deploymentgroup --deploymentgroupname "RaspberryPi" --acceptteeeula --agent $HOSTNAME --url https://dragonico.visualstudio.com/ --work _work --projectname 'dragoni'; ./run.sh; fi

# Add Lama User
adduser lama
usermode -aG sudo lama



