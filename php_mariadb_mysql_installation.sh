#!/bin/bash

sudo apt install -y apache2
sudo apt-get install -y php libapache2-mod-php  php-mysql
sudo systemctl restart apache2
apt-cache show php-cli # to find out what the php-cli module does
sudo apt-get install -y php-cli # Install Pacakages
