# Setting Up Infrastructure Ubuntu
- Incase if you need and issue please call me, will assist you to fix the issue
- How to use this document?
  - Each Installation setup is having document file, refer the document to gain more confidence
  - Copy the link from this repo and paste in your installation environment using temrinal  

### Tested in Linux Ubuntu ###

###### ***Setting Up Hostname***
```
sudo hostnamectl set-hostname jenkins-yir.com   # Set the Hostname for the master node
exec bash
```
_Result_

![image](https://user-images.githubusercontent.com/111234771/211171282-d34816f2-8cf5-4fe9-a1ef-b6628c0bea0e.png)

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

###### ***Setting Kubernetes***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/step1_k8s_all_nodes.sh)" #To run in all nodes

sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/step2_k8s_master_nodes.sh)" #To run on Master Node and follow the on screen instruction

sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/step3_k8s_worker_nodes.sh)" #Use this to generate the Joinging and and connect it in your worker node to join the master cluster
```
###### ***Installation of Postgre SQL***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/postgreSQL_installation.sh)"
```

###### ***Setting Kafka and Zookeeper***
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/kafka_zookeeper_install.sh)"
```

