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
