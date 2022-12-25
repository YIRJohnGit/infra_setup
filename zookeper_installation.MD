# Installation of Zookeeper on Ubuntu 20

- Require Java VERSION Installed
```
java --version
javac --version
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/209470734-a10c2052-d78b-4d88-879e-1aa6014b6846.png)


## Step 1 - Downloading and Extracting
**Downloading the Zookeeper**
```
curl  "https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz" --output ~/Downloads/zookeeper.tgz
```
**Extracting the Files in user local folder**
```
sudo mkdir -p /usr/local/zookper
cd /usr/local/zookper/
sudo tar -xvzf ~/Downloads/zookeeper.tgz --strip 1
cd
```

## Step 2 - Updating the Path in BaseFile
**Updating the content**
- sudo vi ~/.bashrc
```
export KAFKA_HOME=/home/kafka/kafka
export ZOOKPER_HOME=/usr/local/zookper
export PATH=$PATH:$KAFKA_HOME/bin:$ZOOKPER_HOME/bin
```

- sudo vi /etc/profile
```
KAFKA_HOME=/home/kafka/kafka
ZOOKPER_HOME=/usr/local/zookper
export PATH KAFKA_HOME ZOOKER_HOME
```

**Updating the Configureation logs**
- sudo vi ~/kafka/config/server.properties
- Uncomment < listeners=PLAINTEXT://:9092 >

![image](https://user-images.githubusercontent.com/111234771/209476861-710afb05-3b31-4d28-a9cf-5c56f2a42ed0.png)
