#!/bin/bash

microk8s kubectl apply -f 01-service-account.yaml
microk8s kubectl apply -f 02-cluster-role-binding.yaml
call 03-generate-token.sh
microk8s kubectl apply -f 04-secret.yaml
call 05-get-generate-token.sh