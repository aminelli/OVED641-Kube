

```sh

# In microk8s verifica addons ingress installato
microk8s status 
## Output atteso: tra gli addons in "enable"
## ingress              # (core) Ingress controller for external access

# Verifica del controller nginx della community di kube installato
# verifica del pod contenente il controller nel namespace ingress (namespace che usa microk8s ingress per il controller)
kubectl get pods -n ingress


# Verifica dei controller
kubectl get ingressclasses
# Output atteso:
# NAME     CONTROLLER             PARAMETERS   AGE
# nginx    k8s.io/ingress-nginx   <none>       13d
# public   k8s.io/ingress-nginx   <none>       13d

kubectl create ingress route-test-ingress \
    --rule="test.example.com/app01=app-service-01:8080" \
    --rule="test.example.com/app02=app-service-02:9090"  


```