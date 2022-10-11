# Hive Installation on Hadoop [Ubuntu 22] #

## Prerequitist and Installation ##
### Step-1 - Initial Setup and System Updates ###
```
sudo apt update
java -version
readlink -f $(which java) # Verify Java Location
```

### Step-2 - Java Installation ###
```
sudo apt install -y default-jdk
#sudo apt install -y openjdk-8-jdk
```

### Step-3 - Download hive from the below link ###
```
cd ~/Downloads
wget https://dlcdn.apache.org/hive/stable-2/apache-hive-2.3.9-bin.tar.gz # Download the hive file
wget --continue https://dlcdn.apache.org/hive/stable-2/apache-hive-2.3.9-bin.tar.gz # Reconfirm or continue downloading or verify 100% downloads
```
```
sudo tar -xvzf apache-hive-2.3.9-bin.tar.gz
sudo chmod 777 apche-hive-2.3.9-bin
sudo mv apache-hive-2.3.9-bin /usr/local/
```

### Step-4 - Add Environment Variables ###
```
sudo nano ~/.bashrc
```
**_Add the below Change to the File and Save_**
```
export HIVE_HOME=/usr/local/apache-hive-2.3.9-bin
export PATH=$PATH:$HIVE_HOME/bin
```
**_Initiate the default changes_**
```
source ~/.bashrc
```

### Step-4 - Create Hive Directories in DFS ###
```
sudo nano ~/.bashrc
```
**_Add the below Change to the File and Save_**

_Create two separate directories to store data in the HDFS layer_

•	The temporary, tmp directory is going to store the intermediate results of Hive processes.

•	The warehouse directory is going to store the Hive related tables.

```
hdfs dfs -mkdir /tmp
hdfs dfs -chmod g+w /tmp
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /user/hive/warehouse
```

### Step-5 - Configure hive-site.xml File ###
```
sudo nano $HIVE_HOME/conf/hive-site.xml
```
