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

```
sudo systemctl status mongodb # Check the Status of MOngoDB Service, the result msust be active and running
```
```
mongod --version # Check the Version
```


```
mongo # Will open Shell
- show dbs
  - use admin
  - show collections
  - db.system.version
```

# Option 1
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
