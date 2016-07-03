#!/usr/bin/env bash

export KUBERNETES_PROVIDER=aws

export KUBE_AWS_ZONE=eu-west-1c
export NUM_NODES=4
export MASTER_SIZE=m3.medium
export NODE_SIZE=t2.micro
export AWS_S3_REGION=eu-west-1
export AWS_S3_BUCKET=wcig-kubernetes-artifacts
export INSTANCE_PREFIX=wcig