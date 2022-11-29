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

# Adding Sudo User
```
sudo adduser yirjohn
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201988286-49168147-3887-4e71-be27-8169e54702e4.png)

```
cat /etc/passwd | grep yirjohn
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201988342-cb36c570-ed9a-43ae-b31f-76de0d81c4c9.png)

```
id yirjohn
```
![image](https://user-images.githubusercontent.com/111234771/201988396-5e5f68cb-68c9-4473-80c6-6e5ea5baa98d.png)

```
sudo usermod -aG sudo yirjohn
groups yirjohn
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201988589-31c56939-a498-4e7f-8194-36cc489941a2.png)

```
su -  yirjohn
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201988917-05887540-e1e3-4dac-85a1-f696cdcbebdc.png)

```
ssh-keygen
```
_Result_
![image](https://user-images.githubusercontent.com/111234771/201989515-75087d2b-8658-4bab-a4ca-ffd4557b84d2.png)


# Setting Kubernetes (k8s) Master Node and Worker Nodes 
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/step1_k8s_all_nodes.sh)"
```
