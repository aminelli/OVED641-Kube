#!/bin/bash

#####  KUBECTL #####  
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
sudo snap install kubectl --classic
# Copia "config" microk8s per kubectl
microk8s config > ~/.kube/config
kubectl version --client
kubectl cluster-info


#####  KUBECTL AUTO COMPLETITION #####  
# https://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/
sudo apt install -y bash-completion

# Installing bash completion on Linux
## If bash-completion is not installed on Linux, install the 'bash-completion' package
## via your distribution's package manager.
## Load the kubectl completion code for bash into the current shell
source <(kubectl completion bash)
## Write bash completion code to a file and source it from .bash_profile
kubectl completion bash > ~/.kube/completion.bash.inc
printf "
# kubectl shell completion
source '$HOME/.kube/completion.bash.inc'
" >> $HOME/.bash_profile
source $HOME/.bash_profile