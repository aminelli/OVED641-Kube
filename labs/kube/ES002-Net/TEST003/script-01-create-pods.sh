#!/bin/bash

kubectl run whoami1 --image=traefik/whoami --port 80 --labels="app=whoami"
kubectl run whoami2 --image=traefik/whoami --port 80 --labels="app=whoami"

read -p "Press [Enter] to continue..."

kubectl get pods --show-labels