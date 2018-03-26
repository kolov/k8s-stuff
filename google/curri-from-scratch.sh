#!/bin/bash
# Starts a cluster and deploy the curri application

set -x
script_path=$(dirname "$0")
$script_path/create-cluster.sh
$script_path/../../curri-users/k8s/deploy-all-gke.sh
$script_path/../../curri-gate/k8s/deploy-all-gke.sh
$script_path/../../curri-fe/k8s/deploy-all-gke.sh
$script_path/../../curriculi-nginx/k8s/deploy-all-gke.sh
kubectl apply -f $script_path/ingress.yml