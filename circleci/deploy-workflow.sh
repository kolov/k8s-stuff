#!/usr/bin/env bash

set +x
mkdir ~/.kube
echo $KUBECONFIGDATA | base64 --decode --ignore-garbage > ~/.kube/config
echo AWS_ACCOUNT_ID=$AWS_ACCOUNT_ID
eval $(aws ecr get-login --no-include-email)
docker build --rm=false -t $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/$APP_NAME:$CIRCLE_SHA1 $BUILD_TARGET_DIR
REGISTRY=$AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com
docker push $REGISTRY/$APP_NAME:$CIRCLE_SHA1
sed -e s/%VERSION%/$CIRCLE_SHA1/g -e s/%APP_NAME%/$APP_NAME/g -e s/%REGISTRY%/$REGISTRY/g $K8S_DEPLOYMENT > k8s-deployment-latest.yml
kubectl apply -f k8s-deployment-latest.yml
kubectl apply -f K8S_SERVICE