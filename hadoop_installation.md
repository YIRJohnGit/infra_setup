
```
sudo apt update
```
```
sudo apt-get install -y apt-transport-https curl 
```
```
sudo apt-get install -y openssh-server
```
```
sudo apt-get install -y ssh 
```
```
ssh-keygen
```
```
sudo apt update
```
```
java -version
```
```
sudo apt install -y default-jre
java -version
```
```
#sudo apt install -y default-jdk
sudo apt install -y openjdk-8-jdk
```
```
sudo nano /etc/hosts # 127.0.0.1 localhost 
```
	
### ***User Creation from Hadoop User*** ###

```
sudo addgroup hadoop
```
```
sudo adduser --ingroup hadoop hduser 
```
```
sudo usermod -a -G sudo hduser 
```
```
su hduser 
```
## Restart the system ###
```
sudo reboot
```

## Login to hduser ##
```
sudo apt-get install -y ssh 
```
```
ssh-keygen 
```
```
sudo cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
```
```
ssh localhost 
```

## Edit the file and disable IPV6 ##
```
sudo nano /etc/sysctl.conf
```
```
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```

## Reboot the machine to make the changes and logon to hduser ##
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
sudo update-java-alternatives -l
```

## IF NOT FOUND JAVAC ##
```
sudo apt install -y openjdk-8-jdk
```
There is only one alternative in link group javac (providing /usr/bin/javac): /usr/lib/jvm/java-11-openjdk-amd64/bin/javac
Nothing to configure.

## Download & Install Hadoop ##
```
cd Downloads
sudo wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz # Please download using URL to download complete file
```
***Make sure you have 100% Download Complete***
![image](https://user-images.githubusercontent.com/111234771/194428956-0a9ea0df-6954-487a-b478-ec7d36c8defc.png)

```
cd /usr/local 
sudo tar -xf $HOME/Downloads/hadoop-3.3.3.tar.gz
sudo chmod 777 hadoop-3.3.3
```

```
sudo nano $HOME/.bashrc 
```
```
# Set Hadoop-related environment variables  export 
HADOOP_HOME=/usr/local/hadoop-3.3.3  

# Set JAVA home directory 
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	
#Set aliases and functions for running Hadoop-related commands 
unalias fs &> /dev/null 
alias fs="hadoop fs"  
unaliash ls &> /dev/null 
alias hls="fs-ls" 

#Add Hadoop bin/ directory to PATH 
export PATH=$PATH:$HADOOP_HOME/bin
```

```
sudo nano /etc/profile
```
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

```
source $HOME/.bashrc 
source /etc/profile 
```
```
cd $HADOOP_HOME
cd etc/hadoop 
```
```
$ pwd
```
### /usr/local/hadoop-3.3.3/etc/hadoop ###

```
sudo nano hadoop-env.sh
```
```
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/usr/local/hadoop-3.3.3
```

```
sudo mkdir -p /app/hadoop/tmp 
sudo chown hduser:hadoop /app/hadoop/tmp  
```
```
sudo nano core-site.xml
```
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
```
sudo nano mapred-site.xml
```
```
<property> 
	<name>mapreduce.framework.name</name> 
	<value>yarn</value> 
</property> 
```

```
sudo nano hdfs-site.xml 
<property> 
	<name>dfs.replication</name> 
	<value>1</value> 
</property>  
```

```
sudo nano yarn-site.xml 
```
<property> 
	<name>yarn.nodemanager.aux-services</name> 
	<value>mapreduce_shuffle</value> 
</property>  
```

```
cd ../../bin 
readlink -f $(which java) # Verify Java Location
```
***result: /usr/lib/jvm/java-11-openjdk-amd64/bin/java***

```
hadoop namenode -format
```

```
cd $HADOOP_HOME/sbin
./start-all.sh 
jps 
```

## Check Hadoop GUI in browser ##
```
localhost:9870 
```
