#!/bin/bash

dir="$(dirname "$0")"

kubectl create -f $dir/mongo-rc.yaml
kubectl create -f $dir/mongo-svc.yaml
kubectl create -f $dir/wcig-rc.yaml
kubectl create -f $dir/wcig-svc.yaml