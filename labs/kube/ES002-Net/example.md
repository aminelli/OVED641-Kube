# Esporre i POD con i Services

## Creazione di un'immagine docker di servizio per utilityacere le utility di rete

```shell
docker build -t k8sutils:debian12 .
docker tag k8sutils:debian12 aminelli/k8sutils:debian12
docker push aminelli/k8sutils:debian12
```


## Comprendere l'assegnazione degli IP ai POD


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

## Creazione di un SERVICE

```shell
# Creiamo un servizio
kubectl run nginx --image nginx --expose=true --port=80

# Verifica stato del servizio e del POD
kubectl get po,svc nginx
kubectl get po nginx --show-labels
kubectl describe svc nginx

```
