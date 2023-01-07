#!/bin/bash

kubectl get nodes # Verify the status of nodes
sudo kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
