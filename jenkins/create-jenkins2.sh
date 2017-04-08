#!/bin/bash

dir="$(dirname "$0")"

kubectl create -f $dir/jenkins2-rc.yaml
kubectl create -f $dir/jenkins2-svc.yaml