ARG ATLANTIS_VERSION=v0.27.3
FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}
ARG AZURE_CLI_VERSION=2.60.0
USER root
RUN apk add --no-cache py3-pip && \
    pip install --break-system-packages --upgrade --no-cache pip && \
    apk add --no-cache --virtual .azure-cli-deps gcc musl-dev python3-dev libffi-dev openssl-dev cargo make && \
    pip install --break-system-packages --no-cache-dir azure-cli==${AZURE_CLI_VERSION} && \
    apk del .azure-cli-deps;
USER atlantis

