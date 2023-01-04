# Setting Up Java


```
sudo apt update
sudo apt install -y default-jre
echo "OR"
echo "sudo apt install -y openjdk-11-jre-headless"
echo "OR"
echo "sudo apt install -y openjdk-8-jre-headless"

java --version
```
```
sudo apt install -y default-jdk
# sudo apt install -y openjdk-8-jdk
# sudo apt install -y openjdk-11-jdk
javac -version
```
```
sudo update-alternatives --config java
sudo update-alternatives --config javac
```
**Findout the Softlink of Java**
```
readlink -f $(which java)
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
