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

**Verify the Connection Info in the PostgreSQL Terminal**
```
\conninfo
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209011886-c0db4f45-bf48-4e5f-bcf7-69b7e9a8f604.png)


**Get the List of All database in postgreSQL**
```
\l
```
_Search Result of Getting all the database_
![image](https://user-images.githubusercontent.com/111234771/209012295-fc58ae2a-7e10-48c8-ba84-af6165991141.png)

**Get List of All User and their previllages**
```
\du
```
_List of User Previllages_
![image](https://user-images.githubusercontent.com/111234771/209012632-0abbb0f3-4c6a-46a9-a1d5-84d04b4852b3.png)

**Setting Up User Password**
```
\password postgres
```
_Password reseting_ ![image](https://user-images.githubusercontent.com/111234771/209012791-abea98a0-797b-4277-8280-2a0e01485af4.png)

**Creating New Database in PostGreSQL Terminal**
```
CREATE DATABASE test_erp;
```
![image](https://user-images.githubusercontent.com/111234771/209012957-1c434079-5a20-4447-90d9-21dc713a3daf.png)


**Connecting to the Database**
```
\c test_erp
```
_Result of Connecting the Database < test_erp >
![image](https://user-images.githubusercontent.com/111234771/209013129-7e644852-9162-4412-9849-2337957c2dd6.png)


**Creating the Table with Primary Key**
```
CREATE TABLE IF NOT EXISTS clients (id SERIAL PRIMARY KEY, first_name VARCHAR, last_name VARCHAR, role VARCHAR);
```
_Result for Creating Table_
![image](https://user-images.githubusercontent.com/111234771/209013743-715a1392-6658-4b5b-9b0b-5937c872bd92.png)


**Verify the List of Tables**
```
\dt
```
_Verify the list of tables_

![image](https://user-images.githubusercontent.com/111234771/209013817-0be98fd8-4704-4e1b-96f7-d3ba2b61b7b8.png)


**Inserting an Record**
```
INSERT INTO clients (first_name, last_name, role) VALUES ('John', 'Smith', 'CEO');
```
_Result for Inserting New Record_
![image](https://user-images.githubusercontent.com/111234771/209014039-c850af95-c8d2-41fb-a6c3-6cce0776c1d7.png)

**Query Table to get all rows**
```
SELECT * FROM clients;
```

![image](https://user-images.githubusercontent.com/111234771/209014315-4cd64766-8fbb-4b7a-897b-f0871275a007.png)


**Quit the Postgre Terminal**
```
\q
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209463997-572fdc22-0022-41f9-a9d1-d9cf8684c00c.png)


# Installation of Post Bird
```
sudo snap install postbird
```

# Setting Up PGAdmin4
```
curl -fsSL https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/pgadmin.gpg

sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
sudo apt update
sudo apt install -y pgadmin4
sudo /usr/pgadmin4/bin/setup-web.sh
```
- Verify in url - 185.185.185.185/pgadmin4
- 
