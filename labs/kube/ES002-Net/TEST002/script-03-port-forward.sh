#!/bin/bash

kubectl port-forward pod/nginx 8080:80

kubectl port-forward --address 0.0.0.0 pod/nginx 8080:80