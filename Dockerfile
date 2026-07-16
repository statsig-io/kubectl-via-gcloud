FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine

RUN gcloud components install kubectl gke-gcloud-auth-plugin

# PLAT-875: statsig-io fork of the v1.6.4 dashboard — serves the rollouts
# list from label-filtered informer caches instead of re-listing the whole
# namespace per request (3.4s -> 0.03s on prod-gke-us-west1).
RUN curl -sLO https://github.com/statsig-io/argo-rollouts/releases/download/v1.6.4-statsig.2/kubectl-argo-rollouts-linux-amd64 && \
    mv kubectl-argo-rollouts-linux-amd64 /usr/bin/kubectl-argo-rollouts && \
    chmod +x /usr/bin/kubectl-argo-rollouts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
