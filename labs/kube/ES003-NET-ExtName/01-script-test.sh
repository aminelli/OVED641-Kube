#!/bin/bash

# Creazione di un pod di test
kubectl run ubuntu-test --image=ubuntu --restart=Never --command -- sleep infinity

# Aggancio a nuovo processo in it mode all'interno del container del pod
kubectl exec -it ubuntu-test -- sh

# Nota: per pingare verso l'esterno, lancirare i seguenti comandi 
# all'interno del processo del container appena creato col comando exec
apt-get update
apt-get install -y iputils-ping

