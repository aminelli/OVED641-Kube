

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

# o in alternativa, usare un piano dichiarativo:;ì

kubectl apply -f 01-ingress.yaml


# Per verificare se l'ingress è sato creato:
kubectl get ingress
# Outpu atteso:
# NAME                 CLASS    HOSTS              ADDRESS     PORTS   AGE
# route-test-ingress   public   test.example.com   127.0.0.1   80      8m7s

# Per ottenere un dettaglio del servizio e del suo stato:
kubectl describe ingress route-test-ingress
# Outpu atteso:
# Name:             route-test-ingress
# Labels:           <none>
# Namespace:        default
# Address:          127.0.0.1
# Ingress Class:    public
# Default backend:  <default>
# Rules:
#   Host              Path  Backends
#   ----              ----  --------
#   test.example.com
#                     /app01   app-service-01:8080 (<error: services "app-service-01" not found>)
#                     /app02   app-service-02:9090 (<error: services "app-service-02" not found>)
# Annotations:        nginx.ingress.kubernetes.io/rewrite-target: /$1
# Events:             <none>


# Creazione Pod da mettere sotto i service gestiti dall'ingress

kubectl run app-01 --image=k8s.gcr.io/echoserver:1.10 --port=8080 -l app=app-service-01
kubectl run app-02 --image=k8s.gcr.io/echoserver:1.10 --port=8080 -l app=app-service-02

# Creazione Service da mettere sotto ingress

kubectl create service clusterip app-service-01 --tcp=8080:8080
kubectl create service clusterip app-service-02 --tcp=9090:8080




```