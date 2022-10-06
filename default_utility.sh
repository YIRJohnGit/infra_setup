#!/bin/bash

sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo apt install -y ssh
sudo apt install -y openssh-server
sudo apt install -y git # Install Git
ssh-keygen
