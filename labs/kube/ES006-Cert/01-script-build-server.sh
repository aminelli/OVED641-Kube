#!/bin/bash

echo "=== AVVIO CRAZIONE Immagine Docker ==="
echo ""

cd ./java/01-server

chmod +x mvnw

docker image prune -f

read -p "Press [Enter] to build SERVER"
docker build -t aminelli/demo-cert-server:v1 .

read -p "Press [Enter] to push image to Docker HUB..."
docker push aminelli/demo-cert-server:v1

cd ../..

echo "=== FINE CRAZIONE Immagine Docker ==="
echo ""
