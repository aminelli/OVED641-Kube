# Esporre i POD con i Services

## Creazione di un'immagine docker di servizio per utilityacere le utility di rete

```shell
docker build -t k8sutils:debian12 .
docker tag k8sutils:debian12 aminelli/k8sutils:debian12
docker push aminelli/k8sutils:debian12

```
