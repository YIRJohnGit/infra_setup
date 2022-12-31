#!/bin/bash

sudo apt install -y apache2
sudo apt-get install -y php libapache2-mod-php  php-mysql unzip
sudo systemctl restart apache2
apt-cache show php-cli # to find out what the php-cli module does
sudo apt-get install -y php-cli # Install Pacakages
sudo apt install -y php-mbstring
export PHP_VER=7.4
sudo apt -y install php$PHP_VER-fpm php$PHP_VER-bcmath php$PHP_VER-curl php$PHP_VER-gd php$PHP_VER-mbstring php$PHP_VER-mysql php$PHP_VER-xml php$PHP_VER-zip


echo "https://www.cloudbooklet.com/how-to-install-php-fpm-with-apache-on-ubuntu-20-04/"
echo "Configure Apache with PHP-FPM"
echo "*****************************"
sudo a2dissite 000-default # Disable the default Apache vhost configuration
sudo a2dismod php7.4 # Disable any default preform modules for any existing PHP versions
sudo a2dismod mpm_prefork # Disable Apache Prefork module.
sudo a2enmod mpm_event proxy_fcgi setenvif # Enable Apache Event module
sudo a2enconf php8.1-fpm # enable PHP-FPM configuration
echo "If you need HTTP 2 support you can enable it"
echo "--------------------------------------------"
echo "sudo a2enmod http2 # If you need HTTP 2 support you can enable it "

echo "Configure PHP-FPM"
echo "-----------------"
echo "Now we configure PHP for Web Applications by changing some values in php.ini file.
For PHP 8.1 with Nginx the php.ini location will be in following directory."
echo "sudo nano /etc/php/8.1/fpm/php.ini"
echo "Please add the below codes to file 


upload_max_filesize = 32M 
post_max_size = 48M 
memory_limit = 256M 
max_execution_time = 600 
max_input_vars = 3000 
max_input_time = 1000
"
sudo service php8.1-fpm restart # restart your PHP-FPM

echo "Configure Apache Virtual Hosts"
echo "******************************"
echo " Create a new Apache vhost configuration

sudo nano /etc/apache2/sites-available/domain.conf

Paste the below configuration in the file.
__________________________________________

<VirtualHost *:80>
     ServerName domain.com
     ServerAlias www.domain.com
     
     Protocols h2 http/1.1

     DocumentRoot /var/www/html/domain/public

     <Directory /var/www/html/domain/public>
         Options -Indexes +FollowSymLinks
         AllowOverride All
         Require all granted
     </Directory>
 
      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined  
</VirtualHost> 

"

sudo a2ensite domain.conf # enable the new Apache configuration
sudo service apache2 restart # Restart Apache

echo "Verify PHP-FPM with Apache"
echo "
Here we have configured /var/www/html/domain/public as the web root in the Apache configuration. 
So now you can navigate into that directory and create a phpinfo file to check the setup.

cd /var/www/html/domain/public
sudo nano info.php

Paste the following.

<?php phpinfo();

"
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

composer

