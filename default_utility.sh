#!/bin/bash

sudo apt update
sudo apt install -y vim
sudo apt install -y apt-transport-https ca-certificates software-properties-common
sudo apt install -y ssh
sudo apt install -y openssh-server
sudo apt install -y net-tools
sudo apt install -y tree
ssh-keygen
