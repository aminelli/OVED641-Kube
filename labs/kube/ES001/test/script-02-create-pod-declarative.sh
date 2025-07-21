#!/bin/bash

microk8s kubectl apply -f kube-pod.yaml


kubectl get pods
kubectl get pods --watch
kubectl get pods hazelcast
kubectl describe pods hazelcast
kubectl describe pods hazelcast | grep Image
kubectl logs hazelcast
kubectl exec -it hazelcast -- /bin/sh


