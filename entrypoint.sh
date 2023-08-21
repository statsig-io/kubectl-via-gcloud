#!/bin/sh -l

export PATH=$PATH:/google-cloud-sdk/bin

echo $GCLOUD_CREDENTIAL > /gcloud-credential.json

echo "Authenticating with gcloud"
gcloud auth activate-service-account --key-file=/gcloud-credential.json

echo "Writing kubeconfig"
gcloud container clusters get-credentials $CLUSTER_NAME --region=$CLUSTER_REGION --project=$CLUSTER_PROJECT

echo "Issuing kubectl command"
kubectl "$@"
