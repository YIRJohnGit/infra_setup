#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get install -y apt-transport-https curl 
sudo apt install -y tree # If the Not able to Install, Find on Scree Instruction or Alternate Way to install
sudo apt install -y git # Install Git
sudo apt-get install -y openssh-server # Installtion of OPen SSH server
ssh-keygen
