#!/bin/bash
# Starts a cluster and deploy the curri application

set -x
script_path=$(dirname "$0")
$script_path/create-cluster.sh
$script_path/../../curri-users/k8s/deploy-all-gke.sh