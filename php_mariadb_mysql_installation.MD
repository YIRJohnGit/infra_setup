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
