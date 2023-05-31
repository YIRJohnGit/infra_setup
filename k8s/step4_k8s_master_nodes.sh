#!/bin/bash

kubectl get nodes # Verify the status of nodes
wget https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
kubectl apply -f  weave-daemonset-k8s.yaml
kubectl get pods -n kube-system

# kubectl get nodes # Verify the status of nodes
# wget https://raw.githubusercontent.com/projectcalico/calico/master/manifests/calico.yaml
# kubectl apply -f calico.yaml
# kubectl get pods -n kube-system
