# Hive Installation on Hadoop [Ubuntu 22] #

## Prerequitist and Installation ##
current Logged User Name: **_hadoop_**
host: **_localhost_**
```
sudo hostnamectl set-hostname localhost
exec bash
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195283872-ad5b1a98-5f9d-4356-934a-b6ec31935701.png)

### Step-1 - Initial Setup and System Updates ###
```
sudo apt update
```
```
java -version
readlink -f $(which java) # Verify Java Location

sudo apt remove openjdk-11*
sudo apt remove icedtea*
```

### Step-2 - Java Installation ###
```
sudo apt install -y openjdk-8-jdk openjdk-8-jre
```

### Step-3 - Download hive from the below link ###
```
cd ~/Downloads
```

_**Note:** Run the command for the first time and complete 100% Downloads_
```
wget https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz 

```
_Result: Successfull Downloads_
![image](https://user-images.githubusercontent.com/111234771/195290913-ab0ea536-0459-4721-b040-adf13af19f9c.png)

_**Note:** Incase of Error while downloading and you wanted to continue from where download is left, run the bewlow command_
```
wget --continue https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz # Reconfirm or continue downloading or verify 100% downloads
```
**_Extract and Move the usr folder_**
```
tar -xzf apache-hive-3.1.2-bin.tar.gz
```
![image](https://user-images.githubusercontent.com/111234771/195287831-79824bcc-748e-4cb5-a671-9e66eecf6d7b.png)

```
ls -lhsrt
mv apache-hive-3.1.2-bin ../
```

```
#sudo mv apache-hive-3.1.3-bin /usr/local/
#sudo chown hadoop:root /usr/local/apache-hive-3.1.3-bin
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195231783-5f5cb19b-068d-4c85-9295-f93dedd8246b.png)

### Step-4 - Add Environment Variables ###
```
sudo nano ~/.bashrc
```
**_Add the below Change to the ~/.bashrc File and Save_**
```
#Hive Folder Path Settings
export HIVE_HOME=/home/hadoop/apache-hive-3.1.2-bin
export PATH=$PATH:$HIVE_HOME/bin
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195232613-d3769b55-a34d-4bdd-a2d1-08180efc40a2.png)

**_Initiate the default changes_**
```
source ~/.bashrc
```

**_Add the below Change to the HADOOP Code file core-site.xml File and Save_**
**_hadoop_ this as to be replaced with your user details**

```
sudo nano $HADOOP_HOME/etc/hadoop/core-site.xml
```
```
        <!--for Setting Up Hive -->
        <property>
                <name>hadoop.proxyuser.**_hadoop_**.groups</name>
                <value>*</value>
        </property>
        <property>
                <name>hadoop.proxyuser.**_hadoop_**.hosts</name>
                <value>*</value>
        </property>
        <property>
                <name>hadoop.proxyuser.server.hosts</name>
                <value>*</value>
        </property>
        <property>
                <name>hadoop.proxyuser.server.groups</name>
                <value>*</value>
        </property>
```

**_Add the below Change to the hive-config.sh File and Save_**
```
sudo nano $HIVE_HOME/bin/hive-config.sh
```
```
#Adding the Hadoop Home Path DIrectory to the Hive
export HADOOP_HOME=/usr/local/hadoop-3.3.3
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195233077-3a18aa31-3982-4a7c-ac59-130582aafe38.png)

### Step-5 - Create Hive Directories in DFS ###
***Note:*** _Make Sure your Hadoop is running sucessfully_
**_to create two separate directories to store data in the HDFS layer_**

•	The temporary, tmp directory is going to store the intermediate results of Hive processes.

•	The warehouse directory is going to store the Hive related tables.

```
hdfs dfs -ls /
hdfs dfs -mkdir /tmp
hdfs dfs -chmod g+w /tmp
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /user/hive/warehouse
hdfs dfs -ls /
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195234987-0c26e78e-c940-4220-bc34-dab53d019ef6.png)

### Step-6 - Configure hive-site.xml File ###
```
cd $HIVE_HOME/conf
sudo cp hive-default.xml.template hive-site.xml
```
_Result_
 ![image](https://user-images.githubusercontent.com/111234771/195235820-80e33ba2-a105-420a-8e50-e164d516b425.png) 

**_Add the below Change to the hive-site.xml File and Save_**
```
sudo nano $HIVE_HOME/conf/hive-site.xml
```
_change metastore location to above created hdfs path(/user/hive/warehouse_

![image](https://user-images.githubusercontent.com/111234771/195237700-fc8117f0-ccf1-44f9-8191-a8352c5fe144.png)


### Step-7 - Initiate Derby Database ###

**Note:** _Apache Hive uses the Derby database to store metadata. Initiate the Derby database, from the Hive bin directory using the **schematool** command_
```
$HIVE_HOME/bin/schematool -initSchema -dbType derby
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195275213-f45c38af-06d0-44a4-957f-dfba043670aa.png)

## Verify Using Shell ##
```
$HIVE_HOME/bin/hiveserver2
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195275570-06211297-210a-4665-8503-49a157c803ba.png)

**Note:** _Start a New Terminal_
```
cd $HIVE_HOME
bin/beeline -n hadoop -u jdbc:hive2://localhost:10000
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195278928-709db835-214f-4def-88ef-41a44201f4b3.png)

```
show databases;
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195280370-b049018f-1957-4b36-8850-b15ca3b53b20.png)


**Note:** _Start a New Terminal_
```
hive
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195281072-ab2eb396-e416-4340-a8aa-23900f950fcb.png)


# Congratulation..... Hive Sucessfully Installed...#

# Uninstall Hive #
```
sudo rm -R /usr/local/apache-hive-3.1.3-bin
```

### Remove the content from ~/.bashrc ###
```
sudo nano ~/.bashrc
```
```
export HIVE_HOME=/usr/local/apache-hive-3.1.3-bin
export PATH=$PATH:$HIVE_HOME/bin
```

### Remove the Directories ###
```
hdfs dfs -rm -R /tmp
hdfs dfs -rm -R /user/hive/warehouse
```


# Troubleshooting #
### TS-001 - SLF4J: Class path contains multiple SLF4J bindings ###

![image](https://user-images.githubusercontent.com/111234771/195240546-9ed7fc72-cd1e-47c6-9a64-8ec1c8deae46.png)

**Problem Statement:** _Same kind of Class Function are available in Two difference places with difference versions_

**Solution:** _We are going delete one file from New locaition and copy ands replace the other file from old location to new location, that means we will have same file in both places_

### Locate the Files ###
```
ls $HIVE_HOME/lib/guava*
ls $HADOOP_HOME/share/hadoop/hdfs/lib/guava*
```
_Result_
 ![image](https://user-images.githubusercontent.com/111234771/195242097-0af7ded1-bec2-47e3-b94b-6366061585c7.png) 

### Remove and Replace the file ###
```
sudo rm -f $HIVE_HOME/lib/guava-27.0-jre.jar
```
```
sudo cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/
```


## Continue from Step-7 - Initiate Derby Database ##

