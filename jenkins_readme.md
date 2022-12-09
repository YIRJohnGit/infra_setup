# Jenkins Installation

# Installation Method 1
```
wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.332.3_all.deb #Manually Download the Package 
sudo dpkg -i jenkins_2.332.3_all.deb # Installing using Package Manger
```
# Installation Method 
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

# Uninstall
```
which jenkins
sudo apt remove -y jenkins 
sudo apt-get purge jenkins -y #Remove Jenkins
sudo apt-get autoclean && sudo apt-get autoremove

mv /var/lib/dpkg/info/jenkins.* /tmp/  # Remove Temp Folder
dpkg --remove --force-remove-reinstreq jenkins  # 
dpkg --purge Jenkins
```
