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
sudo chmod 777 apache-hive-2.3.9-bin
sudo mv apache-hive-2.3.9-bin /usr/local/
```

### Step-4 - Add Environment Variables ###
```
sudo nano ~/.bashrc
```
**_Add the below Change to the ~/.bashrc File and Save_**
```
export HIVE_HOME=/usr/local/apache-hive-2.3.9-bin
export PATH=$PATH:$HIVE_HOME/bin
```
**_Initiate the default changes_**
```
source ~/.bashrc
```

**_Add the below Change to the hive-config.sh File and Save_**
```
sudo nano $HIVE_HOME/bin/hive-config.sh
```
```
export HADOOP_HOME=/usr/local/hadoop-3.3.3
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

### Step-6 - Configure hive-site.xml File ###
```
cd $HIVE_HOME/conf
sudo cp hive-default.xml.template hive-site.xml
sudo nano hive-site.xml
```
**_Add the below Change to the hive-site.xml File and Save_**
```
# change metastore location to above created hdfs path(/user/hive/warehouse)

```

### Step-7 - Initiate Derby Database ###

**Note:** _Apache Hive uses the Derby database to store metadata. Initiate the Derby database, from the Hive bin directory using the **schematool** command_
```
#schematool -dbType derby -initSchema
schematool -initSchema -dbType derby
```

## Verify Using Shell ##
```
cd $HIVE_HOME/bin
hive
```

# Troubleshooting #
### TS-001 - SLF4J: Class path contains multiple SLF4J bindings ###

![image](https://user-images.githubusercontent.com/111234771/194996405-3d66d8ab-e181-4521-8642-76c6b638cb54.png)


**Problem Statement:** _Same kind of Class Function are available in Two difference places with difference versions_

**Solution:** _We are going delete one file from New locaition and copy ands replace the other file from old location to new location, that means we will have same file in both places_

```
sudo mv /usr/local/apache-hive-2.3.9-bin/lib/log4j-slf4j-impl-2.6.2.jar /usr/local/apache-hive-2.3.9-bin/lib/log4j-slf4j-impl-2.6.2.jar.bak
```
```
sudo cp /usr/local/hadoop-3.3.3/share/hadoop/common/lib/slf4j-reload4j-1.7.36.jar /usr/local/apache-hive-2.3.9-bin/lib/
```
_Restart Hive Again_
```
cd $HIVE_HOME/bin
schematool -dbType derby -initSchema
hive
```
