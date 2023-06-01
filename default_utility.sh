#!/bin/bash

sudo apt update
sudo apt install -y vim
sudo apt install -y apt-transport-https ca-certificates software-properties-common
sudo apt install -y ssh openssh-server net-tools tree iptables gnupg lsb-release jq
ssh-keygen
