# Kubernetes Installation
_Run the Script in all the nodes_
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/YIRJohnGit/infra_setup/main/k8s/step1_k8s_all_nodes.sh)"
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
