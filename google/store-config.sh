echo $GPG_PASSPHRASE | gpg --passphrase-fd 0 --symmetric  -o- ~/.kube/config | base64 > config.gpg
aws s3 cp --acl public-read config.gpg s3://assen-configs
