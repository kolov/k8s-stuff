Executed instructions from http://kubernetes.io/docs/getting-started-guides/docker-multinode/deployDNS/

To run:

# If the kube-system namespace isn't already created, create it
$ kubectl get ns
$ kubectl create namespace kube-system

$ kubectl create -f ./skydns.yaml