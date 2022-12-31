## Resetting Root Password in MySQL

- Get list of Users
```
SELECT  User FROM mysql.user;
```
_Result of User Details_
![image](https://user-images.githubusercontent.com/111234771/210124826-1d94f358-7d3a-41f6-af3d-cd8cdfcf67b5.png)

- Get the detail of table structure
```
desc mysql.user;
``` 
_Result of Structure Details _
![image](https://user-images.githubusercontent.com/111234771/210124870-a5cc2215-917d-42d6-a75a-aad77521e56e.png)

```
mysql --version # Get the MySql Version running in machine
sudo systemctl stop mysql.service
sudo systemctl status mysql.service
sudo systemctl set-environment MYSQLD_OPTS="--skip-networking --skip-grant-tables" # Skip Grant Tables & Networking
sudo systemctl restart mysql.service
sudo systemctl status mysql.service

sudo mysql -u root
flush privileges;

USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root@1234';
quit
sudo killall -u mysql # Kill all MySQL processes 
sudo systemctl restart mysql.service # Restart the MySQL service
sudo systemctl status mysql.service 

sudo mysql -u root -p
```

## Setting Up Composser

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-composer-on-ubuntu-20-04


![image](https://user-images.githubusercontent.com/111234771/210087701-f5c23d89-2bd1-4e2c-bee6-90469844bf9c.png)

```
composer
```
![image](https://user-images.githubusercontent.com/111234771/210087838-a8da959f-ce1c-4e38-b774-82560c8c4973.png)


# Troubleshooting - Unable to See the PHP Out on Web URL

```
cat -n /etc/apache2/httpd.conf
OR
cat -n  /etc/apache2/apache2.conf
OR
cat -n /etc/httpd/httpd.conf
OR
cat -n /etc/httpd/conf/httpd.conf
```
_Result of File Location_
![image](https://user-images.githubusercontent.com/111234771/210127889-846e5f47-b659-4cad-81ba-775369fc6d24.png)

-Check the Log Details
```
cat -n /var/log/apache2/error.log
```

### Solution 1 - Not Worked
- sudo nano /etc/apache2/apache2.conf
- Make the Changes in the following
_Changes from this_![image](https://user-images.githubusercontent.com/111234771/210128221-bb82ae91-33f4-48c1-9df5-581de2a80a93.png)
_to this_ ![image](https://user-images.githubusercontent.com/111234771/210128383-83d3fd76-6510-48df-9906-9475e8f95ba1.png)
- After Changes reboot
```
sudo a2dismod mpm_event && sudo a2enmod mpm_prefork && sudo a2enmod php7.4
```

# Troubleshooting - Remove complete PHP and its content
- __Removing PHP__
```
sudo apt-get -y purge 'php*'
OR
sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
sudo apt -y autoremove

sudo apt-get purge apache2 php5 libapache2-mod-php5 mysql-server libapache2-mod-auth-mysql php5-mysql phpmyadmin

cd /
sudo find -name "php"
```

- __Removing Mysql__
```
sudo apt-get autoclean
sudo systemctl status mysql.service


# Need work on this
https://linuxhint.com/check-mysql-status-ubuntu/

```
