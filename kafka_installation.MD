# Install Apache Kafka on Ubuntu 20.04

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

