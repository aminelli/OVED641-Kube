#!/bin/bash

kubectl apply -f kube-nodeport-whoami.yaml

read -p "Press [Enter] to continue..."

kubectl get service nodeport-whoami