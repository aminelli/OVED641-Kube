#!/bin/bash

microk8s kubectl run hazelcast \
    --image=hazelcast/hazelcast:5.1.7 \
    --port=5701 \
    --env="DNS_DOMAIN=cluster" \
    --labels="app=hazelcast,env=prod"