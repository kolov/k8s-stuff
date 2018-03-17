gcloud iam service-accounts create kube-deployer
gcloud iam service-accounts keys create kube-deployer-keys.json --iam-account=kube-deployer@burnished-block-834.iam.gserviceaccount.com
gcloud projects add-iam-policy-binding burnished-block-834 --member serviceAccount:kube-deployer@burnished-block-834.iam.gserviceaccount.com --role roles/container.developer
echo $GPG_PASSPHRASE | gpg --passphrase-fd 0 --symmetric  -o- kube-deployer-keys.json | base64 > kube-deployer-keys.json.gpg
aws s3 cp --acl public-read kube-deployer-keys.json.gpg s3://assen-configs

# to use:
#gcloud auth activate-service-account kube-deployer@burnished-block-834.iam.gserviceaccount.com --key-file=kube-deployer-keys.json
