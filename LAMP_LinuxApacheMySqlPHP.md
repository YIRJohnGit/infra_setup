# Install Linux, Apache, MySQL, PHP (LAMP)

## Step 1: Install Apache
```
sudo apt update
sudo apt install -y apache2
sudo service apache2 status
curl http://icanhazip.com

sudo ufw app list
sudo ufw app info "Apache Full"

```
_Result_
![image](https://user-images.githubusercontent.com/111234771/212993547-4f48ef40-b32c-441e-88e5-295677da30f5.png)


## Step 2: Install MySQL and Create a Database

```
sudo apt install -y mariadb-server
sudo systemctl status mariadb.service
sudo systemctl start mariadb.service
```

### Securing the Mysql
```
sudo mysql_secure_installation
sudo systemctl status mariadb
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/212994455-a3735eb4-36cb-41bd-a0db-fa3979699b4b.png)

## Step 3: Install PHP

```
sudo apt-get install -y php libapache2-mod-php  php-mysql unzip
sudo nano /etc/apache2/mods-enabled/dir.conf

sudo systemctl restart apache2
```
![image](https://user-images.githubusercontent.com/111234771/212996152-2b054363-3721-4fb7-b3c5-c2c00cf800f2.png)

**Get List of Available php Module**
```
apt-cache search php- | less
apt-cache show php7.4-tidy
sudo apt install -y php7.4-tidy
sudo systemctl restart apache2
```

```
sudo nano /var/www/html/info.php
```
```
export PHP_VER=7.4
sudo apt -y install php$PHP_VER-fpm php$PHP_VER-bcmath php$PHP_VER-curl php$PHP_VER-gd php$PHP_VER-mbstring php$PHP_VER-mysql php$PHP_VER-xml php$PHP_VER-zip
```

```
sudo a2dissite 000-default # Disable the default Apache vhost configuration
sudo a2dismod php7.4 # Disable any default preform modules for any existing PHP versions
sudo a2dismod mpm_prefork # Disable Apache Prefork module.
sudo a2enmod mpm_event proxy_fcgi setenvif # Enable Apache Event module
sudo a2enconf php7.4-fpm # enable PHP-FPM configuration

sudo service php7.4-fpm restart
sudo service php7.4-fpm status
```
![image](https://user-images.githubusercontent.com/111234771/212998036-c8365f68-970b-4bef-80a8-3ef7b9ea72d8.png)


