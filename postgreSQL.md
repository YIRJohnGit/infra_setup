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
_Result: Getting the postgreSQL Terminal_
![image](https://user-images.githubusercontent.com/111234771/209011730-5a8cd614-5ca4-4a3c-a4c5-088841327ec9.png)

**Verify the Connection Info in the PostgreSQL Terminal
```
\conninfo
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209011886-c0db4f45-bf48-4e5f-bcf7-69b7e9a8f604.png)


**Get the List of All database in postgreSQL***
```
\l
```
_Search Result of Getting all the database_
![image](https://user-images.githubusercontent.com/111234771/209012295-fc58ae2a-7e10-48c8-ba84-af6165991141.png)


