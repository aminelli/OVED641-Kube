#!/bin/bash

echo "=== AVVIO DELETE IN KUBE ==="
echo ""

cd ./kube
kubectl delete -f 01-cert-manager-issuer.yaml
kubectl delete -f 02-deployment-server.yaml
kubectl delete -f 03-deployment-client.yaml
cd ..

docker image rm aminelli/demo-cert-server:v1
docker image rm aminelli/demo-cert-client:v1 
docker image prune -f

echo "=== FINE DELETE IN KUBE ==="

echo ""
echo ""
echo ""

microk8s ctr images rm docker.io/aminelli/demo-cert-server:v1 
microk8s ctr images rm docker.io/aminelli/demo-cert-client:v1 

echo ""
echo ""
echo ""
microk8s ctr images ls | grep aminelli

echo ""
echo ""
echo ""