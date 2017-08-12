#!/usr/bin/env bash
# Params:
# KUBECONFIGDATA, APP_NAME, AWS_ACCOUNT_ID
set +x
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl ~/bin
PATH=$PATH:$(pwd)/bin
echo $PATH
mkdir ~/.kube
echo $KUBECONFIGDATA | base64 --decode --ignore-garbage > ~/.kube/config
aws configure set default.region eu-central-1
aws configure set default.output json
eval $(aws ecr get-login --region eu-central-1)
docker build --rm=false -t $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/$APP_NAME:$CIRCLE_SHA1 .
REGISTRY=$AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com
docker push $REGISTRY/$APP_NAME:$CIRCLE_SHA1
sed 's/%VERSION%/$CIRCLE_SHA1/g; s/%APP_NAME%/$APP_NAME/g; s/%REGISTRY%/$REGISTRY/g' k8s-deployment.yml > k8s-deployment-latest.yml
kubectl apply -f k8s-deployment-latest.yml
kubectl apply -f k8s-service.yml