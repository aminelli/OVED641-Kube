#!/bin/bash

cd ./kube

echo "=== AVVIO PROVISIONING IN KUBE ==="
echo ""

read -p "Press [Enter] to deploy 01-cert-manager-issuer.yaml"
kubectl apply -f 01-cert-manager-issuer.yaml
echo ""

cd ..

echo "=== FINE PROVISIONING IN KUBE ==="
echo ""