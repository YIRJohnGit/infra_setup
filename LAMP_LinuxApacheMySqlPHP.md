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


## Step 2: Install MySQL and Create a Database

```
sudo apt install -y mariadb-server
sudo systemctl status mariadb.service
sudo systemctl start mariadb.service

```
