#!/bin/bash

kubectl create deployment nginx --image nginx 
kubectl expose deployment nginx --port 80 --target-port 80 --selector app=nginx --type ClusterIP --name nginx
