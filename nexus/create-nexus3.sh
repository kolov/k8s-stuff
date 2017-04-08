#!/bin/bash

dir="$(dirname "$0")"

kubectl create -f $dir/nexus3-rc.yaml
kubectl create -f $dir/nexus3-svc.yaml