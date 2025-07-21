#!/bin/bash

kubectl apply -f kube-pod.yaml


kubectl get pods
kubectl get pods --watch
kubectl get pods hazelcast
kubectl describe pods hazelcast
kubectl describe pods hazelcast | grep Image
kubectl logs hazelcast
kubectl exec -it hazelcast -- /bin/sh
kubectl exec hazelcast -- env

# Cancellazione del POD
# kubectl delete -f kube-pod.yaml

