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


# Troubleshooting 

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
