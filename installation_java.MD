# Setting Up Java


```
sudo apt update
sudo apt install -y default-jre              # version 2:1.11-72build1, or
java --version
```
```
sudo apt install -y default-jdk
# sudo apt install openjdk-8-jdk -y
# sudo apt install openjdk-11-jdk -y
javac -version
```
```
sudo update-alternatives --config java
sudo update-alternatives --config javac
```

```
which java
sudo nano /etc/environment
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
```
```
source /etc/environment
echo $JAVA_HOME
```

**Changing the***
```
sudo update-alternatives --config javac
```
