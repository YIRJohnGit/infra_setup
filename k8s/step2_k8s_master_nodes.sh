#!/bin/bash

sudo kubeadm init
# OR Collect the master  and run the INitIP Address
export MASTER_IP=`hostname -I | awk '{print $2}'`
sudo kubeadm init --apiserver-advertise-address=${MASTER_IP} --pod-network-cidr 10.10.0.0/16


sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
