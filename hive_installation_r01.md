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
sudo apt install -y openjdk-8-jdk openjdk-8-jre
```

### Step-3 - Download hive from the below link ###
```
cd ~/Downloads
```

_**Note:** Run the command for the first time and complete 100% Downloads_
```
sudo wget https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz 

```
_Result: Successfull Downloads_
![image](https://user-images.githubusercontent.com/111234771/195228590-1c012576-78e2-4645-bd55-0c16022b4a66.png)

_**Note:** Incase of Error while downloading and you wanted to continue from where download is left, run the bewlow command_
```
sudo wget --continue https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz # Reconfirm or continue downloading or verify 100% downloads
```
**_Extract and Move the usr folder_**
```
sudo tar -xzf apache-hive-3.1.3-bin.tar.gz
sudo chmod 777 apache-hive-3.1.3-bin
ls -lhsrt
```
![image](https://user-images.githubusercontent.com/111234771/195231142-53c8afce-e9d2-4715-a4ac-ed9e05332b2f.png) 

```
sudo mv apache-hive-3.1.3-bin /usr/local/
sudo chown hadoop:root /usr/local/apache-hive-3.1.3-bin
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
export HIVE_HOME=/usr/local/apache-hive-3.1.3-bin
export PATH=$PATH:$HIVE_HOME/bin
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/195232613-d3769b55-a34d-4bdd-a2d1-08180efc40a2.png)

**_Initiate the default changes_**
```
source ~/.bashrc
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

## Verify Using Shell ##
```
cd $HIVE_HOME/bin
hive
```

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

