# Kubernetes Installation
```
sh -c "$(curl -fsSL https://github.com/YIRJohnGit/infra_setup/blob/main/k8s/step1_k8s_all_nodes.sh)"
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
