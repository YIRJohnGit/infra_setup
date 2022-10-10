# Single Node Hadoop Installation on Ubuntu 22 #

## Prerequitist and Installation ##
### Step-1 Initial Setup and System Updates ###
```
sudo apt update
sudo apt-get install -y apt-transport-https curl 
sudo apt-get install -y openssh-server
sudo apt-get install -y ssh 
ssh-keygen
```
```
sudo apt update
java -version
```

### Step-2 Java Installation ###
```
#sudo apt install -y default-jre
#java -version
```
```
sudo apt install -y default-jdk
#sudo apt install -y openjdk-8-jdk
```

### Step-3 Setting Up Host Details ###
```
sudo hostnamectl set-hostname localhost
exec bash
hostname
```
Change the **_localhost_**
```
sudo nano /etc/hosts 
```
127.0.0.1 localhost 

![image](https://user-images.githubusercontent.com/111234771/194789510-9cee067a-2bc7-49f7-80c9-e495a9eb3ab3.png)


### Step-4 User Creation (Optional) ###

```
sudo addgroup hadoop
sudo adduser --ingroup hadoop hduser 
sudo usermod -a -G sudo hduser 
su hduser 
```
***Restart the system***
```
sudo reboot
```

***Login to hduser***
```
sudo apt-get install -y ssh 
ssh-keygen 
```
```
sudo cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
ssh localhost 
```

### Step-5 Disable IPV6 ###
```
sudo nano /etc/sysctl.conf
```
***Update the below content in the config file***
```
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```

***Restart the system***
```
sudo reboot
```

#### get the Java Locatoin ####
```
sudo update-alternatives --config javac
```
![image](https://user-images.githubusercontent.com/111234771/194428412-47bcc3ca-56d9-4aac-a286-5edb138d1a51.png)
#### or ####
```
sudo update-java-alternatives -l # Get the list of Java
sudo update-alternatives --config java
```

### Step-6 Installation of Hadoop ###
***IF NOT FOUND JAVAC***
```
sudo apt install -y openjdk-8-jdk
```
There is only one alternative in link group javac (providing /usr/bin/javac): /usr/lib/jvm/java-11-openjdk-amd64/bin/javac
Nothing to configure.

***Download & Install Hadoop***
```
cd ~/Downloads
sudo wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz # Please download using URL to download complete file
```
***Incase of broken installaton please use the below***
```
sudo wget --continue https://dlcdn.apache.org/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz # Please continue download using URL to download complete file
```

***Make sure you have 100% Download Complete***
![image](https://user-images.githubusercontent.com/111234771/194428956-0a9ea0df-6954-487a-b478-ec7d36c8defc.png)

```
cd /usr/local 
sudo tar xzvf ~/Downloads/hadoop-3.3.3.tar.gz
sudo chmod 777 hadoop-3.3.3
```

***_Get the Java Enveronment Path_***
```
readlink -f $(which java) # Verify Java Location
```
![image](https://user-images.githubusercontent.com/111234771/194933267-60615dbb-0b6d-4a64-90ac-0f2c0003d41f.png)
***In My Case : ***_/usr/lib/jvm/java-11-openjdk-amd64/bin/java_

***Setting Up Environment _~/.bashrc_***
```
sudo nano $HOME/.bashrc 
```
_Add the below content to the file_
```
# Set Hadoop-related environment variables
export HADOOP_HOME=/usr/local/hadoop-3.3.3

# Set JAVA home directory
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

#Set aliases and functions for running Hadoop-related commands
unalias fs &> /dev/null
alias fs="hadoop fs"
unaliash ls &> /dev/null
alias hls="fs-ls"

#Add Hadoop bin/ directory to PATH
export PATH=$PATH:$HADOOP_HOME/bin
```

***Setting Up Environment _/etc/profile_***
```
sudo nano /etc/profile
```
_Add the below contet to the file_
```
# Insert JAVA_HOME
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Insert  HADOOP_HOME
HADOOP_HOME=/usr/local/hadoop-3.3.3

#--in PATH variable just append at the end of the line
PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin

#--Append HADOOP_HOME at end of the export statement
export PATH JAVA_HOME HADOOP_HOME
```

***_Resetting the Environment_***
```
source $HOME/.bashrc 
source /etc/profile 
cd $HADOOP_HOME
cd etc/hadoop 
```

***Setting Up Environment _$HADOOP_HOME/etc/hadoop/hadoop-env.sh_***
```
sudo nano $HADOOP_HOME/etc/hadoop/hadoop-env.sh
```
_Add the below contet to the file_
```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export HADOOP_HOME=/usr/local/hadoop-3.3.3
```
![image](https://user-images.githubusercontent.com/111234771/194935754-18aab709-81b3-490e-8693-4c7c23af8058.png)

***Creating Temp Folder***
```
sudo mkdir -p /app/hadoop/tmp 
sudo chown hduser:hadoop /app/hadoop/tmp  
```
***Setting Up Environment _core-site.xml_***
```
sudo nano core-site.xml
```
_Add the below contet to the file_
```
<configuration>
	<property> 
		<name>hadoop.tmp.dir</name> 
		<value>/app/hadoop/tmp</value> 
	</property> 
	<property> 
		<name>fs.default.name</name> 
		<value>hdfs://localhost:9000</value> 
	</property>  
</configuration>
```
***Setting Up Environment _mapred-site.xml_***
```
sudo nano mapred-site.xml
```
_Add the below contet to the file_
```
<configuration>
	<property> 
		<name>mapreduce.framework.name</name> 
		<value>yarn</value> 
	</property> 
</configuration>
```
***Setting Up Environment _hdfs-site.xml _***
```
sudo nano hdfs-site.xml 
```
_Add the below contet to the file_
```
<configuration>
	<property> 
		<name>dfs.replication</name> 
		<value>1</value> 
	</property>  
</configuration>
```
***Setting Up Environment _yarn-site.xml_***
```
sudo nano yarn-site.xml 
```
_Add the below contet to the file_
```
<configuration>
	<property> 
		<name>yarn.nodemanager.aux-services</name> 
		<value>mapreduce_shuffle</value> 
	</property>  
</configuration>
```

```
cd ../../bin 
readlink -f $(which java) # Verify Java Location
```
![image](https://user-images.githubusercontent.com/111234771/194431744-cc2226a3-f778-4741-aa35-af1aa9538197.png)

## Start the Hadoop and its Services ##
**_Note: The below command will take time to initialize, please be patient_** 
**_The Successfull Setup will show the below result_** 
![image](https://user-images.githubusercontent.com/111234771/194432514-7413c5d9-8926-4b9c-8640-83af1a140da8.png)

```
hadoop namenode -format
```

```
cd $HADOOP_HOME/sbin
./start-all.sh 
jps 
```


## Verify User GUI ##
_Access Hadoop UI from Browser_
```
localhost:9870 
```

_Access individual DataNodes directly_
```
localhost:9864 
```

_Access YARN Resource Manager directly_
```
localhost:8088
```
