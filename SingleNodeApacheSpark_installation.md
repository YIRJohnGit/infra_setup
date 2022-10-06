## Single Node Apache Spark Installation on Ubuntu 16.04 ##
#### Step 1: Install Java  ####
Java is the main prerequisite for Apache Spark. Install latest java. 
```
sudo apt-get update
sudo apt install -y openjdk-8-jdk
```
Then, verify the existence of java in your system using the command “java - version”. 
```
java -version 
```
#### Step 2. Set the Host Name as ‘localhost’ in /etc/hostname file  ####
 
#### Step 3. Set the Known Hosts in /etc/hosts file ###
```
sudo gedit /etc/hosts 
```
```
127.0.0.1 	localhost 
```
Then, Save and close the document

## Restart the system & Login  ##
```
sudo reboot
```


#### Step 4 Create a dedicated user account for hadoop  ####
```
sudo addgroup hadoop
sudo adduser --ingroup hadoop hduser
sudo usermod -a -G sudo hduser
su hduser  
```

## Restart the system & Login to ***hduser*** ##
 
#### Step 5. Configure ssh   ###
5.1. Generate private and public key pair at terminal using  
``` 
sudo apt-get install ssh
ssh-keygen  
``` 
5.2. To enable ssh to the local machine  
``` 
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
ssh localhost  
```

#### Step 6. Disable IPV6 by including the following lines in /etc/sysctl.conf file  #### 
```
sudo gedit /etc/sysctl.conf 
```  
```
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1  
```
Then, Save and close the document
## Restart the machine to make the changes & Login to ***hduser*** ##
 
#### Step 7. To find the java path   ####
sudo update-alternatives --config javac 
 
### Step 8. Install Scala ###
Download Scala and extract
```
cd /usr/local  
sudo tar -xvzf $HOME/Downloads/scala-2.12.1.tar.gz
sudo chmod 777 scala-2.12.1 
``` 
 
### Step 9. Install Spark ###
```
cd /usr/local
sudo tar -xvzf $HOME/Downloads/spark-2.1.0-bin-hadoop2.7.tar.gz
sudo chmod 777 spark-2.1.0-bin-hadoop2.7 
```

#### Step 10. Set the environment variables.   ####
```
sudo gedit $HOME/.bashrc 
```
Include the following lines in the $HOME/.bashrc file  

```
# Set JAVA home directory  
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64  
 
# Set Scala-related environment variables  
export SCALA_HOME =/usr/local/scala-2.12.1 
 
# Set Spark-related environment variables  
export SPARK_HOME =/usr/local/spark-2.1.0-bin-hadoop2.7 
 
#Add Spark bin/ directory to PATH  
export PATH=$PATH:$SCALA_HOME/bin:$SPARK_HOME/bin 
```
Then, Save and close the document

#### Step 11. Set environment variables ####
```
sudo gedit /etc/profile  
``` 
Include the following lines /etc/profile file  
```
# Insert JAVA_HOME  
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64  
 
#--in PATH variable just append at the end of the line 
PATH=$PATH:$JAVA_HOME/bin: $SCALA_HOME/bin:$SPARK_HOME/bin  
 
#--Append SPARK_HOME at end of the export statement  
export PATH JAVA_HOME SCALA_HOME SPARK_HOME 
```


#### Step 12. Run the .bashrc & profile files from the $ prompt for updating the changes ####
```
source $HOME/.bashrc
source /etc/profile  
```

#### Step 13. Spark installation using   ####
```
echo $SPARK_HOME  
bin/spark -version  
```

#### Step 14. Run Spark ####
```
cd $SPARK_HOME  
cd sbin
./start-master.sh 
``` 

## Open the browser and type: ##
```
https://localhost:8080 
```
