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
```
