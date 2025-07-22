#!/bin/bash

kubectl delete -f 01-new-nginx-pod.yaml
read -p "Press [Enter] to continue after the pod is destroyed..."
kubectl create -f 01-new-nginx-pod.yaml