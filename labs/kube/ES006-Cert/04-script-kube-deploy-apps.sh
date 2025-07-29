#!/bin/bash

cd ./kube

echo "=== AVVIO PROVISIONING IN KUBE ==="
echo ""


read -p "Press [Enter] to deploy 02-deployment-server.yaml"
kubectl apply -f 02-deployment-server.yaml
echo ""

read -p "Press [Enter] to deploy 03-deployment-client.yaml"
kubectl apply -f 03-deployment-client.yaml
echo ""

cd ..

echo "=== FINE PROVISIONING IN KUBE ==="
echo ""