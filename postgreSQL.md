# Installation of PostgreSQL on Ubuntu 20

```
sudo apt install -y wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209009345-9695cee8-7fb5-41d7-9c68-032cf8c96319.png)

```
sudo apt update
sudo apt install postgresql postgresql-contrib

```

**Verify the Installation**
```
sudo systemctl status postgresql
```

**Start Postgre SQL**
```
sudo -u postgres psql
```
