CLUSTER_NAME=cluster-curri
PROJECT_NAME=burnished-block-834

if gcloud beta container --project "$PROJECT_NAME" clusters list | grep $CLUSTER_NAME ; then
 echo Cluster $CLUSTER_NAME already exists
else
 gcloud beta container --project "$PROJECT_NAME" clusters \
  create "$CLUSTER_NAME" --zone "europe-west1-b" --username "admin" \
  --cluster-version "1.7.14-gke.1" --machine-type "g1-small" --image-type "COS" \
  --disk-size "100" --scopes "https://www.googleapis.com/auth/compute","https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
  --num-nodes "2" --network "default" --enable-cloud-logging --enable-cloud-monitoring --subnetwork "default" --enable-legacy-authorization
 kubectl create secret docker-registry regcred --docker-server=registry.gitlab.com \
    --docker-username=assen.kolov@gmail.com \
    --docker-password=$GTILAB_REG_TOKEN \
    --docker-email=assen.kolov@gmail.com
fi
