#!/bin/bash

sudo usermod -a -G microk8s $USER
mkdir -p $HOME/.kube
chmod 0700 $HOME/.kube
sudo chown -R $USER ~/.kube

microk8s status --wait-ready
microk8s kubectl get nodes
microk8s kubectl get services
microk8s kubectl get pods

# mkdir -p ~/.kube
# chmod 0700 ~/.kube
