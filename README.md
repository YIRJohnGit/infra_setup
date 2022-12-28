# Setting Up Infrastructure Ubuntu
### Tested in Linux Ubuntu ###

###### ***Setting Up Default Git and curl***
```
sudo apt install -y git curl
```

###### ***Setting Up Default Setting for New Machine***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/default_utility.sh)"
```

###### ***Setting Up Docker and Running Sample Hello World App***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/docker_install.sh)"
```

###### ***Setting Up AWS CLi***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/terraform/main/install_aws_cli_v01.sh)"
```

###### ***Docker Installation***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/terraform/main/install_docker.sh)"
```

###### ***Terraform Installation***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/terraform/main/install_terraformv01.sh)"
```

###### ***Installation Java***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/java_current_ver_installation.sh)"
```

###### ***Setting Jenkins***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/jenkins_installation.sh)"
```


###### ***Setting Kafka and Zookeeper***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/kafka_zookeeper_install.sh)"
```

