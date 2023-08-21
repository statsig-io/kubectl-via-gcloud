FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine

RUN gcloud components install kubectl gke-gcloud-auth-plugin

RUN curl -sLO https://github.com/argoproj/argo-rollouts/releases/download/v1.2.1/kubectl-argo-rollouts-linux-amd64 && \
    mv kubectl-argo-rollouts-linux-amd64 /usr/bin/kubectl-argo-rollouts && \
    chmod +x /usr/bin/kubectl-argo-rollouts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
