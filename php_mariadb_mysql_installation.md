# Installation of apache2, PHP, MariaDB, MySql #

https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04

```
sudo apt update && sudo apt -y upgrade
sudo apt install -y apache2
```
/var/www/html
```
sudo apt-get install -y php libapache2-mod-php  php-mysql
```
```
sudo apt update && sudo apt install -y phpmyadmin php-mbstring php-zip php-gd php-json php-curl
```
php-mcrypt

_Finally, enable the mbstring PHP extension and restart Apache._
```
sudo phpenmod mbstring
sudo service apache2 reload
```
**_We want to tell our web server to prefer PHP files, so we’ll make Apache look for an index.php file first_**

```
sudo nano /etc/apache2/mods-enabled/dir.conf
```

**_/etc/apache2/mods-enabled/dir.conf_**

**Change the content from**
```
<IfModule mod_dir.c>
    DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm
</IfModule>
```
**TO**
```
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
```
```
sudo systemctl restart apache2 # Restart the Apache Server
```

```
sudo systemctl status apache2 # Check the Status
```

## Install PHP Modules to enhance the functionality of PHP ##
```
apt-cache search php- | less
```

```
apt-cache show php-cli # to find out what the php-cli module does
```

```
sudo apt-get install -y php-cli # Install Pacakages
```

```
sudo echo "<?php phpinfo(); ?>" > /var/www/html/index.php
```
