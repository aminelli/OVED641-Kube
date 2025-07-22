#!/bin/bash

kubectl create -f 01-new-nginx-pod.yaml
kubectl get pod new-nginx-pod -o wide