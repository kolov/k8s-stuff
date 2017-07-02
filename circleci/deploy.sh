#!/usr/bin/env bash
echo $GCLOUD_SERVICE_KEY | base64 --decode --ignore-garbage > ${HOME}/gcloud-service-key.json
sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update --version 158.0.0
sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update kubectl --version 158.0.0
sudo /opt/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
sudo /opt/google-cloud-sdk/bin/gcloud config set project $PROJECT_NAME
sudo /opt/google-cloud-sdk/bin/gcloud config set container/cluster $CLUSTER_NAME
sudo /opt/google-cloud-sdk/bin/gcloud config set compute/zone ${CLOUDSDK_COMPUTE_ZONE}
sudo /opt/google-cloud-sdk/bin/gcloud container clusters get-credentials $CLUSTER_NAME
docker build -t eu.gcr.io/${PROJECT_NAME}/${APP_NAME}:$CIRCLE_SHA1 build/libs
sudo /opt/google-cloud-sdk/bin/gcloud docker -- push eu.gcr.io/${PROJECT_NAME}/${APP_NAME}:$CIRCLE_SHA1
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
sudo chown -R $USER /home/ubuntu/.config
sed s/%VERSION%/$CIRCLE_SHA1/g k8s-deployment.yml > k8s-deployment-latest.yml
kubectl apply -f k8s-deployment-latest.yml
kubectl apply -f k8s-service.yml