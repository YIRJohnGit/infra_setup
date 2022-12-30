# MongoDB Installation



# Option 1
```
sudo apt update # Update Local Database 
sudo apt install -y mongodb 
```
**_Following Pacakes will be Installed_**
- libboost-program-options1.71.0 
- libgoogle-perftools4 
- libpcrecpp0v5
- libsnappy1v5 
- libtcmalloc-minimal4 
- libyaml-cpp0.6 
- mongo-tools
- mongodb-clients 
- mongodb-server 
- mongodb-server-core

_Result_
![image](https://user-images.githubusercontent.com/111234771/207018468-81cdf836-d62e-4ccb-b1e4-724f413601f2.png)
![image](https://user-images.githubusercontent.com/111234771/207018575-141b354e-a896-4c26-a53c-53b903f9925a.png)
![image](https://user-images.githubusercontent.com/111234771/207018748-905ed048-b93c-40f0-b970-7fbb85129aa8.png)


```
sudo systemctl status mongodb # Check the Status of MOngoDB Service, the result msust be active and running
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/207018871-7e111909-a7a4-4b6a-a976-00435eee2bcf.png)

```
mongod --version # Check the Version
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/207018996-81536de9-4442-4724-9f93-bf3a14e973d5.png)

```
mongo # Will open Shell
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/207019104-18056138-e835-4aa9-a85e-566adc8ca58d.png)

_Testing in Shell_
```
show dbs
use admin
show collections
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/207019476-f053b857-7800-4749-ba1a-ec211462825b.png)

```
db.system.version
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/207019626-382409f8-76a2-4fa1-86b7-c686bf7cb21a.png)

# Option 2
https://www.mongodb.com/try/download/community-kubernetes-operator

```
sudo apt install -y mongodb-org
```
```
tput clear
```
```
sudo service mongod start # Start the Service
sudo service mongod status # Get the STatus of the MOngodb Servive
sudo service mongod stop # Stop the MOngodb Service
sudo service mongod restart # restart the MOngodb Service
```

# Setting Up MongoDB Compose

```
wget https://downloads.mongodb.com/compass/mongodb-compass_1.30.1_amd64.deb
```
