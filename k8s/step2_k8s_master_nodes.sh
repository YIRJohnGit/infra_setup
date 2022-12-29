#!/bin/bash

echo "Kube admin can be run on specific IP Address or current local IP Address also below is example"
echo "=============================================================================================="
echo "- to run the below for auto ip address for master node"
echo "sudo kubeadm init"
echo "\n\n\nOR Build the cluster on the Current IP Address as menstion below (Copy Paste)"
echo "export MASTER_IP=`hostname -I | awk '{print $2}'`"
echo "sudo kubeadm init --apiserver-advertise-address=${MASTER_IP} --pod-network-cidr 10.10.0.0/16"


sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
