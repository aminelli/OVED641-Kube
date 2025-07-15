#!/bin/bash

# Installazione microk8s
sudo snap install microk8s --classic
microk8s status --wait-ready
# Se errore per causa autorizzazioni
sudo usermod -a -G microk8s corsokube
mkdir ~/.kube
sudo chown -R corsokube ~/.kube

# Test
microk8s kubectl get all --all-namespaces

# Enable Add-ons
microk8s enable dns 
microk8s enable dashboard
microk8s enable rbac
microk8s enable ingress

# If RBAC is not enabled access the dashboard using the token 
# retrieved with:
# 
# microk8s kubectl describe secret -n kube-system 
# microk8s-dashboard-token
# 
# Use this token in the https login UI of the kubernetes-dashboard 
# service.
# 
# In an RBAC enabled setup (microk8s enable RBAC) you need to create 
# a user with restricted
# permissions as shown in:
# https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

alias mkctl="microk8s kubectl"


  

# mkctl expose deployment nginx --port 80 --target-port 80 --selector app=nginx --type ClusterIP --name nginx
microk8s kubectl expose deployment nginx --port 80 --target-port 80 --selector app=nginx --type ClusterIP --name nginx

# watch microk8s kubectl get all

sudo apt-get -y install net-tools


microk8s dashboard-proxy
# porta 
# token auth: eyJhbGciOiJSUzI1NiIsImtpZCI6InU5ZU1qc29pQXJKdktNdEdIT0hnN3F6UG4wT0tiYTZXZVgxTDVRamt5THcifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImMyNjgwMDhkLTA1NzMtNGNmMC05MmYxLWNhNmM3MDQyYmFmOCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.ixpR5_fgI-c3FllFVYr6vF6rZSR_2Wf1CRnmhcPpkJyLZBfDvqwgFtowXwXBQ1QUXYRPqH4jDPzpS7QAKo0yT-McK2NqycqbwMzCcH_KrHqQy5yzVVST7Vl_KeoUUFwwvw_rRwhLrl4N9YNXYl_-WNdUkwHaRBplgYBs4ynbPVjaC-uvV9RpksZ36nt7fR9FGFBL7YqW2-p23_2oY9tUxxb6boWBByoNa2tss_w1VHdESRlqkIwTWIfyH__Ku-GXk9Wc38DKEnJgmKghKmCg7OEGFyTPErbqMe_2OcJdW2djGyHR5qG6596b8e6c5lOVFz0eSJJ5RbLTBmL7cc-2lA
# token auth: eyJhbGciOiJSUzI1NiIsImtpZCI6InU5ZU1qc29pQXJKdktNdEdIT0hnN3F6UG4wT0tiYTZXZVgxTDVRamt5THcifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImMyNjgwMDhkLTA1NzMtNGNmMC05MmYxLWNhNmM3MDQyYmFmOCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.ixpR5_fgI-c3FllFVYr6vF6rZSR_2Wf1CRnmhcPpkJyLZBfDvqwgFtowXwXBQ1QUXYRPqH4jDPzpS7QAKo0yT-McK2NqycqbwMzCcH_KrHqQy5yzVVST7Vl_KeoUUFwwvw_rRwhLrl4N9YNXYl_-WNdUkwHaRBplgYBs4ynbPVjaC-uvV9RpksZ36nt7fR9FGFBL7YqW2-p23_2oY9tUxxb6boWBByoNa2tss_w1VHdESRlqkIwTWIfyH__Ku-GXk9Wc38DKEnJgmKghKmCg7OEGFyTPErbqMe_2OcJdW2djGyHR5qG6596b8e6c5lOVFz0eSJJ5RbLTBmL7cc-2lA

# DASHBOARD: (model # https://[IP OR DNS OR HOSTNAME]:10443)
# https://132.164.250.156:10443

microk8s kubectl -n kube-system get secret $(microk8s kubectl -n kube-system get sa default -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"


 
