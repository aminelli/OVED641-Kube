#!/bin/bash

kubectl get po,svc nginx
read -p "Press [Enter] "
kubectl get po nginx --show-labels
read -p "Press [Enter]"
kubectl describe svc nginx
read -p "Press [Enter]"
kubectl get pod nginx -o wide