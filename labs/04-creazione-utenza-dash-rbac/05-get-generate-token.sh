#!/bin/bash

#microk8s kubectl secret kubernetes-dashboard -n default 
microk8s kubectl get secret admin-user -n default -o jsonpath="{.data.token}" | base64 -d


