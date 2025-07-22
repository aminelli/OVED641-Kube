#!/bin/bash

kubectl get po,svc nginx
read -p "Press [Enter] to continue after checking the pod and service status..."
kubectl get po nginx --show-labels
read -p "Press [Enter] to continue after checking the pod labels..."
kubectl describe svc nginx

