#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu    $(lsb_release -cs) stable"
sudo apt-get install -y docker-ce
sudo apt-get update

sudo usermod -aG docker $USER
ls -l /var/run/docker.sock
sudo chown root:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock

sudo docker ps
sudo docker run hello-world
sudo docker ps
sudo docker run -it ubuntu bash
