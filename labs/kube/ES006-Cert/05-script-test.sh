#!/bin/bash

echo "=== AVVIO TEST ==="
echo ""

read -p "Press [Enter] to test pods..."
kubectl get pods

read -p "Press [Enter] to test service..."
kubectl get svc

read -p "Press [Enter] to test certificate..."
kubectl get certificate api-service-tls

read -p "Press [Enter] to test secret..."
kubectl get secret api-service-tls-secret -o yaml


kubectl get secret api-service-tls-password -o jsonpath="{.data.password}"  && echo ""
kubectl get secret api-service-tls-password -o jsonpath="{.data.password}" | base64 -d && echo ""


kubectl get secret api-service-tls-secret -o jsonpath='{.data.keystore\.p12}' | base64 -d > keystore.p12
keytool -list -v -keystore keystore.p12 -storetype PKCS12 -storepass changeit

kubectl get secret api-service-tls-secret -o jsonpath='{.data.truststore\.p12}' | base64 -d > truststore.p12
keytool -list -v -keystore truststore.p12 -storetype PKCS12 -storepass changeit


echo "=== STOP TEST ==="
echo ""

