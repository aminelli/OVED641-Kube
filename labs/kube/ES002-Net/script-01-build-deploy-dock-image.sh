#!/bin/bash

docker build -t k8sutils:debian12 .
docker tag k8sutils:debian12 aminelli/k8sutils:debian12
docker push aminelli/k8sutils:debian12