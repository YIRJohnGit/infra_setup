#!/bin/bash

sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo apt update -y
#sudo apt install -y openjdk-8-jdk openjdk-8-jre
sudo apt install -y default-jdk
sudo apt update
sudo apt install -y default-jre
sudo apt update -y

sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt-get install -y jenkins
sudo apt update -y
sudo systemctl status jenkins
#sudo apt-get full-upgrade -y

