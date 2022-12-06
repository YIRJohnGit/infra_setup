# Kubernetes Installation
_Run the Script in all the nodes_
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/step1_k8s_all_nodes.sh)"
```

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/step2_k8s_master_nodes.sh)"
```

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/step4_k8s_master_nodes.sh)"

```

# Kubernetes Resetting

# Kubernetes Testing

# Installation Velero

# Installation Sampele Application

# Backup Using Velero

# Restore using Velero

# Uninstall velero
```
kubectl delete namespace/velero clusterrolebinding/velero
kubectl delete crds -l component=velero
```


# Troubleshooting - How to Set the Node Role
```
kubectl label node worker-node-2.yir.com node-role.kubernetes.io/worker=worker
```
_The Result_
![image](https://user-images.githubusercontent.com/111234771/205987328-2603d5df-d6b1-4742-9677-9502923af400.png)
