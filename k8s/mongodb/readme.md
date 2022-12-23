# Setting Up MongoDB

## Process to Follow installation on K8s
```
In Master and Worker Node
sudo mkdir /mnt/data
sudo mount /dev/sda1 /mnt/data

mkdir k8_mongodb
cd k8_mongodb/
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/ConfigMap.yaml
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/PersistentVolume.yaml
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/PersistentVolumeClaim.yaml
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/Secret.yaml
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/StatefulSet.yaml
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/StorageClass.yaml
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/kustomization.yaml
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/Service.yaml


kubectl apply -k .
kubectl get pod
kubectl exec -it mongodb-test-0 -- sh
mongo
use test
db.auth('test','password#@12')
```

## Video Reference
https://phoenixnap.com/kb/kubernetes-mongodb

```
https://phoenixnap.com/kb/kubernetes-mongodb
```
