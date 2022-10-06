
```
sudo apt update
```

java -version
sudo apt install -y default-jre
java -version
#sudo apt install -y default-jdk
sudo apt install -y openjdk-8-jdk


$ sudo apt-get install -y apt-transport-https curl 
$ sudo apt-get install -y openssh-server
$ sudo apt-get install -y ssh 
$ ssh-keygen

$ sudo nano /etc/hosts 
	127.0.0.1 localhost 


$ sudo addgroup hadoop 
$ sudo adduser --ingroup hadoop hduser 
$ sudo usermod -a -G sudo hduser 
$ su hduser 


$ sudo apt-get install -y ssh
$ ssh-keygen 

$ sudo cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
$ ssh localhost 

$ sudo nano /etc/sysctl.conf
	net.ipv6.conf.all.disable_ipv6 = 1
	net.ipv6.conf.default.disable_ipv6 = 1
	net.ipv6.conf.lo.disable_ipv6 = 1

$ sudo reboot

$ sudo update-alternatives --config javac
or
$ sudo update-java-alternatives -l

IF NOT FOUND JAVAC
sudo apt install openjdk-8-jdk-headless
or
sudo apt install -y openjdk-8-jdk

There is only one alternative in link group javac (providing /usr/bin/javac): /usr/lib/jvm/java-11-openjdk-amd64/bin/javac
Nothing to configure.

$ cd Downloads


$ sudo wget https://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz # Please download using URL to download complete file
OR
$ sudo wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz

$ cd /usr/local 
$ sudo tar -xf $HOME/Downloads/hadoop-3.3.3.tar.gz
$ sudo chmod 777 hadoop-3.3.3
$ sudo nano $HOME/.bashrc 

	# Set Hadoop-related environment variables  export 
	HADOOP_HOME=/usr/local/hadoop-3.3.3  

	# Set JAVA home directory 
	export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
	
	#Set aliases and functions for running Hadoop-related commands 
	unalias fs &> /dev/null 
	alias fs="hadoop fs"  
	unaliash ls &> /dev/null 
	alias hls="fs-ls" 

	#Add Hadoop bin/ directory to PATH 
	export PATH=$PATH:$HADOOP_HOME/bin

$ sudo nano /etc/profile
	# Insert JAVA_HOME 
	JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
	
	# Insert  HADOOP_HOME 
	HADOOP_HOME=/usr/local/hadoop-3.3.3 
	
	#--in PATH variable just append at the end of the line 
	PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin 
	
	#--Append HADOOP_HOME at end of the export statement  
	export PATH JAVA_HOME HADOOP_HOME  


$ source $HOME/.bashrc 
$ source /etc/profile 
$ cd $HADOOP_HOME
$ cd etc/hadoop 

$ pwd
/usr/local/hadoop-3.3.3/etc/hadoop


$ sudo nano hadoop-env.sh
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	export HADOOP_HOME=/usr/local/hadoop-3.3.3


$ sudo mkdir -p /app/hadoop/tmp 
$ sudo chown hduser:hadoop /app/hadoop/tmp  

$ sudo nano core-site.xml

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


$ sudo nano mapred-site.xml
	<property> 
		<name>mapreduce.framework.name</name> 
		<value>yarn</value> 
	</property> 


$ sudo nano hdfs-site.xml 
	<property> 
		<name>dfs.replication</name> 
		<value>1</value> 
	</property>  

$ sudo nano yarn-site.xml 
	<property> 
		<name>yarn.nodemanager.aux-services</name> 
		<value>mapreduce_shuffle</value> 
	</property>  

$ cd ../../bin 

$ readlink -f $(which java) # Verify Java Location
	result
	/usr/lib/jvm/java-11-openjdk-amd64/bin/java

$ hadoop namenode -format

$ cd ../sbin 

$ cd $HADOOP_HOME/sbin
$ ./start-all.sh 
$ jps 

Check Hadoop GUI in browser
localhost:9870 
