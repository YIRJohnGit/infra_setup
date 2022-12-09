# Jenkins Installation

# Installation Method 1
```
wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.332.3_all.deb #Manually Download the Package 
sudo dpkg -i jenkins_2.332.3_all.deb # Installing using Package Manger
```

# Toubleshooting - Uninstall
```
which jenkins
sudo apt-get purge jenkins -y #Remove Jenkins
sudo apt-get autoclean && sudo apt-get autoremove

mv /var/lib/dpkg/info/jenkins.* /tmp/  # Remove Temp Folder
dpkg --remove --force-remove-reinstreq jenkins  # 
dpkg --purge Jenkins
```
