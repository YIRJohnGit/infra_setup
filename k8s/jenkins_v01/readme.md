# Setting Up Jenkins on Kubernetes
```
mkdir jenkins
cd jenkins
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/jenkins_v01/deployment.yaml
wget https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/jenkins_v01/service.yaml
```

```
kubectl create namespace jenkins
kubectl get namespaces
```
```
kubectl create -f jenkinsdeployment.yaml -n jenkins
kubectl get deployments -n jenkins
kubectl create -f jenkinsservice.yaml -n jenkins
kubectl get services -n jenkins
```
```
kubectl get pods -n jenkins
kubectl logs pod_name -n jenkins # Logs will help to get th details of jenkins installation
```
