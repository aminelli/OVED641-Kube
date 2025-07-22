# Esporre i POD con i Services

## K8S-UTILS - Creazione di un'immagine docker di servizio per le utility di rete

```shell
docker build -t k8sutils:debian12 .
docker tag k8sutils:debian12 aminelli/k8sutils:debian12
docker push aminelli/k8sutils:debian12
```


## Service di tipo ClusterIP



### TEST001 - Comprendere l'assegnazione degli IP ai POD

```shell
# Creazione POD
kubectl create -f 01-new-nginx-pod.yaml
# Verifica assengazione IP
kubectl get pod new-nginx-pod -o wide

#### OUTPUT SIMILE A QUESTO ####
# NAME            READY   STATUS    RESTARTS   AGE   IP           NODE              NOMINATED NODE   READINESS GATES
# new-nginx-pod   1/1     Running   0          95s   10.1.9.143   vm-ania-docente   <none>           <none>

# Eliminazione e ricreazione POD
kubectl delete -f 01-new-nginx-pod.yaml
kubectl create -f 01-new-nginx-pod.yaml

kubectl get pod new-nginx-pod -o wide
#### OUTPUT SIMILE A QUESTO ####
# NAME            READY   STATUS    RESTARTS   AGE   IP           NODE              NOMINATED NODE   READINESS GATES
# new-nginx-pod   1/1     Running   0          21s   10.1.9.147   vm-ania-docente   <none>           <none>
```


### TEST002 - Service di tipo ClusterIP

```shell
# Creiamo un servizio
kubectl run nginx --image nginx --expose=true --port=80

# Verifica stato del servizio e del POD
kubectl get po,svc nginx

### OUTPUT
# NAME        READY   STATUS    RESTARTS   AGE
# pod/nginx   1/1     Running   0          2m25s
# 
# NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
# service/nginx   ClusterIP   10.152.183.51   <none>        80/TCP    2m25s


kubectl get po nginx --show-labels

### OUTPUT
# NAME    READY   STATUS    RESTARTS   AGE     LABELS
# nginx   1/1     Running   0          3m17s   run=nginx


kubectl describe svc nginx
### OUTPUT
# Name:                     nginx
# Namespace:                default
# Labels:                   <none>
# Annotations:              <none>
# Selector:                 run=nginx
# Type:                     ClusterIP
# IP Family Policy:         SingleStack
# IP Families:              IPv4
# IP:                       10.152.183.51
# IPs:                      10.152.183.51
# Port:                     <unset>  80/TCP
# TargetPort:               80/TCP
# Endpoints:                10.1.9.145:80
# Session Affinity:         None
# Internal Traffic Policy:  Cluster
# Events:                   <none>

kubectl get pod nginx -o wide
# NAME    READY   STATUS    RESTARTS   AGE   IP           NODE              NOMINATED NODE   READINESS GATES
# nginx   1/1     Running   0          11m   10.1.9.145   vm-ania-docente   <none>           <none>

# Curl sul servizio "nginx"
curl 10.152.183.51
# Curl sul pod del servizio "nginx"
curl 10.1.9.145


## Ora proviamo degli expose con port-forward utilizzato solitamente per testare i servizi
# Caso 1: Expose sull'host sulla 8080
kubectl port-forward pod/nginx 8080:80

# Caso 2: Expose sull'host sulla 8080 con binding su tutte le interfacce
# Expose con binding 0.0.0.0
kubectl port-forward --address 0.0.0.0 pod/nginx 8080:80

```

## Alla scoperta dei servizi

```shell
# Creazione del pod di servizio
kubectl apply -f kube-k8s-utils.yaml

# Verifica stato del pod di servizio
kubectl exec -it k8sutils -- nslookup nginx.default.svc.cluster.local
```
