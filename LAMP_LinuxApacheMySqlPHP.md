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
