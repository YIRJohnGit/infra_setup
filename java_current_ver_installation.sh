#!/bin/bash

sudo apt update
sudo apt install -y default-jre
sudo apt update
sudo apt install -y default-jdk
javac -version
java --version
readlink -f $(which java)
