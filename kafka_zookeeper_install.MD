# Install Apache Kafka on Ubuntu 20.04

- https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-20-04
- Require Java VERSION Installed
```
java --version
javac --version
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209470734-a10c2052-d78b-4d88-879e-1aa6014b6846.png)

## Stpe 1 - Sudo User Creation 
```
sudo adduser kafka
sudo adduser kafka sudo
su -l kafka
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209464207-a4517cfa-511d-4604-8d71-3c662ad0d1e3.png)

![image](https://user-images.githubusercontent.com/111234771/209464319-b3417b9e-43ca-4c6c-9d93-4f8836e765f1.png)


## Stpe 2 - Downloading and Extracting Kafla
**Download the Binary File**
```
mkdir ~/Downloads
#curl "https://downloads.apache.org/kafka/2.6.3/kafka_2.13-2.6.3.tgz" -o ~/Downloads/kafka.tgz
curl  "https://dlcdn.apache.org/kafka/3.2.3/kafka_2.12-3.2.3.tgz" -o ~/Downloads/kafka.tgz
ls -l
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209465160-c2f9d25c-ff5a-4dd9-a024-3387f2983664.png)
![image](https://user-images.githubusercontent.com/111234771/209465769-62645fe4-eaff-48f5-acc8-8c9f21134e3e.png)


**Move the Binary to installation Location and Extract**
```
mkdir -p ~/kafka && cd ~/kafka
tar -xvzf ~/Downloads/kafka.tgz --strip 1
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209465832-d6e4290d-0bc2-4335-ac38-77089056d6ef.png)

## Stpe 3 - Configuring the Kafka Server
**Deleting the Kafka Topics and Adding the Log Files**
- nano ~/kafka/config/server.properties
```

log.dirs=/home/kafka/logs

#setting will allow to delete Kafka topics.
delete.topic.enable = true
```

_Result_
![image](https://user-images.githubusercontent.com/111234771/209466656-fac10fe3-9387-4d45-8725-e94d158b8345.png)

![image](https://user-images.githubusercontent.com/111234771/209466628-58392c59-5547-46d9-bd1f-36399ee934a0.png)

**Verify the changes**
```
cat -n  ~/kafka/config/server.properties | grep 'kafka/logs\|delete.topic'
```

_Final Result_
![image](https://user-images.githubusercontent.com/111234771/209466924-a43ced86-8363-454f-bc5b-767d17ec092d.png)

## Stpe 4 - Creating Systemd Unit Files and Starting the Kafka Server
**...set up for starting, stopping, and restarting Kafka with unit file for zookeeper**
- sudo nano /etc/systemd/system/zookeeper.service
- Add the below content to the file and save
```
[Unit]
Requires=network.target remote-fs.target
After=network.target remote-fs.target

[Service]
Type=simple
User=kafka
ExecStart=/home/kafka/kafka/bin/zookeeper-server-start.sh /home/kafka/kafka/config/zookeeper.properties
ExecStop=/home/kafka/kafka/bin/zookeeper-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209467655-756c4be1-ba50-4089-8ac3-3ee897086e8c.png)


**...set up for creating the systemd service file for kafka**
- sudo nano /etc/systemd/system/kafka.service
- Add the following content to the file
```
[Unit]
Requires=zookeeper.service
After=zookeeper.service

[Service]
Type=simple
User=kafka
ExecStart=/bin/sh -c '/home/kafka/kafka/bin/kafka-server-start.sh /home/kafka/kafka/config/server.properties > /home/kafka/kafka/kafka.log 2>&1'
ExecStop=/home/kafka/kafka/bin/kafka-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target
```

**Verify the Server Status**
```
sudo systemctl daemon-reload
sudo systemctl status kafka
sudo systemctl start kafka
sudo systemctl status kafka
```
_Working Result_
![image](https://user-images.githubusercontent.com/111234771/209470417-1bd0d96e-4c56-45cf-b9bc-f20cefefbe57.png)


## Stpe 5 - Testing the Kafka Installation
**To begin, create a topic named __TutorialTopic__**
```
~/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic TutorialTopic
```
**Now publish the string "Hello, World" to the __TutorialTopic__**
```
echo "Hello, World" | ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic > /dev/null
```
**Next, create a Kafka consumer using the kafka-console-consumer.sh script __TutorialTopic__**
```
~/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic TutorialTopic --from-beginning
```

_Testing Kafka Result_
![image](https://user-images.githubusercontent.com/111234771/209471281-e0ede740-cc7a-44b4-a9fc-7643e18760e6.png)

_Start a new Terminal and run the below, you will get the result in the consumer output terminal_
```
echo "Hello World from YIR John and for Simpragma!" | ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic > /dev/null
```
_Result_
![tempsnip](https://user-images.githubusercontent.com/111234771/209471854-f43bc6b0-9e31-4465-a799-1ffd033d1edd.png)


# OPTION 3 for Complete Setup using terminal

sudo apt install -y openjdk-8-jdk 
sudo apt update
sudo apt-get install -y zookeeperd
#telnet localhost 2181

sudo ufw status
sudo ufw enable
sudo ufw allow 22/tcp comment 'Open port ssh tcp port 22' # follows to open ssh port
sudo ufw status

java -version
sudo apt install -y default-jre
sudo apt install -y default-jdk 
java -version


cat /etc/os-release

#https://kafka.apache.org/downloads
https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz


cd ~/Downloads
#wget --output-document=kafka.tgz --continue https://archive.apache.org/dist/kafka/3.2.0/kafka_2.12-3.2.0.tgz 
wget --output-document=kafka.tgz --continue https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz

wget --continue https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz --output-document=zookeeper.tar.gz

sudo tar -xvf zookeeper.tar.gz
sudo tar -xzf kafka.tgz

sudo mv apache-zookeeper-3.8.0-bin/ /usr/local/zookper
sudo mv kafka_2.12-3.2.0 /usr/local/kafka

sudo vi ~/.bashrc
	# Adding the path for Kafka and Zookeeper
	export KAFKA_HOME=/usr/local/kafka
	export ZOOKPER_HOME=/usr/local/zookper
	export PATH=$PATH:$KAFKA_HOME/bin:$ZOOKPER_HOME/bin

sudo vi /etc/profile
	# Adding the path for Kafka and zookeeper
	KAFKA_HOME=/usr/local/kafka
	ZOOKER_HOME=/usr/local/zookper
	export PATH KAFKA_HOME ZOOKER_HOME


sudo mkdir -p /usr/local/kafka/data-logs

sudo vi /usr/local/kafka/config/server.properties
	listeners=PLAINTEXT://:9092
	log.dirs=/usr/local/kafka/data-logs

sudo mkdir -p /usr/local/zookper/data
sudo vi /usr/local/kafka/config/zookeeper.properties
	dataDir=/usr/local/zookper/data


#https://hevodata.com/blog/how-to-install-kafka-on-ubuntu/

sudo systemctl daemon-reload
sudo systemctl status kafka
sudo systemctl status zookeeper

 sudo systemctl start kafka
 sudo systemctl start zookeeper

which zookeeper-server-stop.sh
which zookeeper-server-start.sh 

#find / -name "zookeeper.properties"

sudo vi /etc/systemd/system/zookeeper.service
[Unit]
Requires=network.target remote-fs.target
After=network.target remote-fs.target

[Service]
Type=simple
User=kafka
ExecStart=/usr/local/kafka/bin/zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties
ExecStop=/usr/local/kafka/bin/zookeeper-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target

#SAVE AND CLOSE THE ABOVE FILE


#Locate the path and copy the path
which kafka-server-start.sh
which kafka-server-stop.sh

sudo vi /etc/systemd/system/kafka.service
[Unit]
Requires=zookeeper.service
After=zookeeper.service

[Service]
Type=simple
User=kafka
ExecStart=/bin/sh -c '/usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties > /tmp/kafka-logs 2>&1'
ExecStop=/usr/local/kafka/bin/kafka-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target

sudo systemctl daemon-reload
sudo chmod 777 /tmp/kafka-logs
sudo chmod 0644 /tmp/kafka-logs # This is the deault File Property

ls -l /tmp/kafka-logs

sudo vi /etc/sudoers
	kafka   ALL=(ALL:ALL) ALL

cat -n /tmp/kafka-logs | head -n10

#Get the Kafa Current Directy and the same in to the environment
pwd

	/usr/local/kafka

sudo vi /etc/environment
#Add the below path to the path
 :/usr/local/kafka/bin

#Save and close

source /etc/environment
kafka-topics.sh

cd /home/kafka/kafka_2.13-3.3.1
zookeeper-server-start.sh config/zookeeper.properties

Terminal 1
cd /usr/local/kafka
zookeeper-server-start.sh config/zookeeper.properties

 sudo vi /usr/local/kafka/config/server.properties








===== Option 3 =====
https://fitdevops.in/how-to-install-kafka-zookeeper-on-ubuntu/

sudo su -

sudo apt install openjdk-8-jre-headless
sudo update-alternatives --config java

sudo adduser --system --no-create-home --disabled-password --disabled-login kafka

cd /opt/
mkdir kafka

wget https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz

tar xvzf kafka_2.13-3.3.1.tgz --directory kafka --strip-components 1

mkdir /var/lib/kafka
mkdir /var/lib/kafka/data

vi /opt/kafka/config/server.properties
delete.topic.enable=true
log.dirs=/var/lib/kafka/data

chown -R kafka: /var/lib/kafka
chown -R kafka: /opt/kafka



apt-get install -y zookeeperd



vi /etc/systemd/system/zookeeper.service
[Unit]
Requires=network.target remote-fs.target
After=network.target remote-fs.target


[Service]
Type=simple
User=kafka
ExecStart=/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties
ExecStop=/opt/kafka/bin/zookeeper-server-stop.sh
Restart=on-abnormal


[Install]
WantedBy=multi-user.target


vi /etc/systemd/system/kafka.service
[Unit]
Requires=zookeeper.service
After=zookeeper.service
Description=High-available, distributed message broker
After=network.target

[Service]
Type=simple
User=kafka
ExecStart=/bin/sh -c '/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties'
ExecStop=/opt/kafka/bin/kafka-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target


systemctl start kafka
systemctl enable kafka

systemctl status kafka



start the Zookeeper service and enable
systemctl start zookeeper
systemctl enable zookeeper
systemctl status zookeeper

Kafka runs on the port 9092 and the Zookeeper runs on the port 2181.


/opt/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic yirforsimpragma


echo "Testing Kafka by YIRJohn" | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic yirforsimpragma > /dev/null

/opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic yirforsimpragma --from-beginning


# Troubleshooting 1

_The Error_
![image](https://user-images.githubusercontent.com/111234771/209468090-6163d72c-67ee-4f6c-926d-8ab19b0f308c.png)
```
sudo apt update
sudo apt install -y default-jdk
sudo apt update
sudo apt install -y default-jre
sudo systemctl daemon-reload
sudo systemctl stop kafka
sudo systemctl start kafka
sudo systemctl enable kafka
sudo systemctl status kafka
```
_Error Fixed_
![image](https://user-images.githubusercontent.com/111234771/209470528-3fdfc2fe-89d7-48e6-ada3-94aa3fabf060.png)

# Troubleshooting 2

| Attempt | #1    | #2    |
| :---:   | :---: | :---: |
| Seconds | 301   | 283   |


