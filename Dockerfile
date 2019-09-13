FROM docker:19.03.2

RUN apk --no-cache add bash curl jq \
&& mkdir /argo-wf \
&& curl -sSL -o /usr/local/bin/argo https://github.com/argoproj/argo/releases/download/v2.3.0/argo-linux-amd64 \
&& chmod +x /usr/local/bin/argo \
&& curl -sSL -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
&& chmod +x /usr/local/bin/kubectl \
&& curl -sSL -o /usr/local/bin/k3d https://github.com/rancher/k3d/releases/download/v1.3.1/k3d-linux-amd64 \
&& chmod +x /usr/local/bin/k3d

WORKDIR /argo-wf

COPY scripts /argo-wf/scripts
COPY argo-workflow-manifest.yaml /argo-wf/

ENTRYPOINT [ "/bin/bash", "-c" ]