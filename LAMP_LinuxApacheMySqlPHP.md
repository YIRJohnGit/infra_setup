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
