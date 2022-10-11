# Hive Installation on Hadoop [Ubuntu 22] #

## Prerequitist and Installation ##
### Step-1 - Initial Setup and System Updates ###
```
sudo apt update
```
```
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
sudo wget https://dlcdn.apache.org/hive/stable-2/apache-hive-2.3.9-bin.tar.gz # Download the hive file
sudo wget --continue https://dlcdn.apache.org/hive/stable-2/apache-hive-2.3.9-bin.tar.gz # Reconfirm or continue downloading or verify 100% downloads
```
```
sudo tar -xvzf apache-hive-2.3.9-bin.tar.gz
sudo chmod 777 apache-hive-2.3.9-bin/
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

### Step-5 - Create Hive Directories in DFS ###

**_Create two separate directories to store data in the HDFS layer_**

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
cd $HIVE_HOME/conf
sudo cp hive-default.xml.template hive-site.xml
sudo nano hive-site.xml
```
**_Add the below Change to the File and Save_**
```
# check hive directory path
```

### Step-6 - Initiate Derby Database ###

**Note:** _Apache Hive uses the Derby database to store metadata. Initiate the Derby database, from the Hive bin directory using the **schematool** command_
```
schematool -dbType derby -initSchema
```

## Verify Using Shell ##
```
cd $HIVE_HOME/bin
hive
```
