# Jenkins Installation

# Installation Java
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

# Installation Method 1
```
wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.332.3_all.deb #Manually Download the Package 
sudo dpkg -i jenkins_2.332.3_all.deb # Installing using Package Manger
```
# Installation Method 2
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y # Updating the systems
sudo apt install -y jenkins # Installing Jenkins
sudo apt-get full-upgrade -y # Will Upgrade the system and its patches

systemctl start jenkins
systemctl status jenkins
```

# Installation Method 3
```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc &gt; /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list &gt; /dev/null
sudo apt update
sudo apt install jenkins -y
```

# Verify Jenking Status
```
sudo systemctl status jenkins
sudo systemctl enable --now jenkins # Make Jenkins Running and Active
```

# Setting Up Firwall Setting
```
sudo ufw allow 8080 # Open port 8080
sudo ufw status # Get Status of Firewall
sudo ufw enable # Enable Firewall
```

# Uninstall Jenkins
```
which jenkins
sudo service jenkins stop
sudo apt-get remove --purge -y jenkins 
sudo apt-get remove --auto-remove jenkins 
sudo apt-get purge jenkins -y #Remove Jenkins
sudo apt-get autoclean && sudo apt-get autoremove

mv /var/lib/dpkg/info/jenkins.* /tmp/  # Remove Temp Folder
sudo dpkg --remove --force-remove-reinstreq jenkins  # 
sudo dpkg --purge Jenkins
```

# Uninstall Java
- **Step 1**, Remove all the Java related packages (Sun, Oracle, OpenJDK, IcedTea plugins, GIJ)
```
dpkg-query -W -f='${binary:Package}\n' | grep -E -e '^(ia32-)?(sun|oracle)-java' -e '^openjdk-' -e '^icedtea' -e '^(default|gcj)-j(re|dk)' -e '^gcj-(.*)-j(re|dk)' -e '^java-common' | xargs sudo apt-get -y remove
sudo apt-get -y autoremove
```
- **Step 2**, Purge config files (careful. This command removed libsgutils2-2 and virtualbox config files too))
```
dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt-get -y purge
```
- **Step 3**, Remove Java config and cache directory
```
sudo bash -c 'ls -d /home/*/.java' | xargs sudo rm -rf
```
- **Step 4**, Remove manually installed JVMs
```
sudo rm -rf /usr/lib/jvm/*
```
  - **Step 5**, Remove Java entries, if there is still any, from the alternatives
```
for g in ControlPanel java java_vm javaws jcontrol jexec keytool mozilla-javaplugin.so orbd pack200 policytool rmid rmiregistry servertool tnameserv unpack200 appletviewer apt extcheck HtmlConverter idlj jar jarsigner javac javadoc javah javap jconsole jdb jhat jinfo jmap jps jrunscript jsadebugd jstack jstat jstatd native2ascii rmic schemagen serialver wsgen wsimport xjc xulrunner-1.9-javaplugin.so; do sudo update-alternatives --remove-all $g; done

```
- **Step 6**, eSarch for possible remaining Java directories
```
sudo updatedb
sudo locate -b '\pack200'
```

