# Esporre i POD con i Services NodePort

## TEST003 - Creazione di un Service di tipo NodePort

```shell
# https://hub.docker.com/r/traefik/whoami

# Creazione primo POD
kubectl run whoami1 --image=traefik/whoami --port 80 --labels="app=whoami"

# Creazione secondo POD
kubectl run whoami2 --image=traefik/whoami --port 80 --labels="app=whoami"

# Show delle labels dei pod
kubectl get pods --show-labels

# Creazione del service NodePOrt
kube apply -f kube-nodeport-whoami.yaml

# Info su service NodePort
kubectl get service nodeport-whoami

```