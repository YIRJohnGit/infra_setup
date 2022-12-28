#!/bin/bash

sudo su -

java --version

update-alternatives --config java
apt install openjdk-8-jre-headless
apt update
cd /opt/
adduser --system --no-create-home --disabled-password --disabled-login kafka
mkdir -p /opt/kafka


wget https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz
tar xvzf kafka_2.13-3.3.1.tgz --directory kafka --strip-components 1

mkdir /var/lib/kafka
mkdir /var/lib/kafka/data


vi /opt/kafka/config/server.properties
    log.dirs=/var/lib/kafka/data


    #Adding the delete topic to true
    delete.topic.enable=true


chown -R kafka: /var/lib/kafka
chown -R kafka: /opt/kafka
apt-get install zookeeperd
ls -l /etc/systemd/system

cat <<EOF | sudo tee /etc/systemd/system/kafka.service
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
EOF

cat <<EOF | sudo tee /etc/systemd/system/zookeeper.service
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
EOF

systemctl start kafka
systemctl enable kafka
systemctl status kafka

systemctl start zookeeper
systemctl enable zookeeper
systemctl status zookeeper

/opt/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic yirforsimpragma
echo "Testing Kafka by YIRJohn" | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic yirforsimpragma > /dev/null
/opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic yirforsimpragma --from-beginning



in terminal 2 
systemctl status zookeeper
systemctl status kafka

echo "Hello World @2, from YIR John and for Simpragma! " | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic yirforsimpragma > /dev/null
/opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic yirforsimpragma --from-beginning
echo "Hello World @3, from YIR John for Simpragma! " | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic yirforsimpragma > /dev/null
