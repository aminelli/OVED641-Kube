#!/bin/bash

cd ./java/02-client

chmod +x mvnw

docker image prune -f

docker build -t aminelli/demo-cert-client:v1 .

read -p "Press [Enter] to push image to Docker HUB..."

docker push aminelli/demo-cert-client:v1

cd ../..
 