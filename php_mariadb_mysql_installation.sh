#!/bin/bash

sudo apt install -y apache2
sudo apt-get install -y php libapache2-mod-php  php-mysql unzip
sudo systemctl restart apache2
apt-cache show php-cli # to find out what the php-cli module does
sudo apt-get install -y php-cli # Install Pacakages


cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

composer
