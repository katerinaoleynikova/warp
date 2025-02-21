FROM adoptopenjdk/openjdk8:debian-slim

ARG PICARD_PRIVATE_VERSION=257537c72dae29257b09bacf413505eed295ac32

ENV TERM=xterm-256color \
    NO_VAULT=true \
    ARTIFACTORY_URL=https://broadinstitute.jfrog.io/artifactory/libs-snapshot-local/org/broadinstitute/picard-private \
    TINI_VERSION=v0.19.0 \
    PATH=$PATH:/root/google-cloud-sdk/bin 


LABEL MAINTAINER="Broad Institute DSDE <dsde-engineering@broadinstitute.org>" \
        PICARD_PRIVATE_VERSION=${PICARD_PRIVATE_VERSION}

WORKDIR /usr/gitc

# Install dependencies
RUN set -eux; \
        apt-get update; \
        apt-get install -y \    
            bash \
            curl \ 
            findutils \
            jq \ 
            python3 \
            unzip \
            wget \
    ; \
# Install Picard private
    curl -L ${ARTIFACTORY_URL}/${PICARD_PRIVATE_VERSION}/jars/picard-private-all-${PICARD_PRIVATE_VERSION}.jar > picard-private.jar \
    ; \
# Download the gsutil install script
    curl -sSL https://sdk.cloud.google.com | bash \
    ; \
# Set up Vault
    curl -L https://releases.hashicorp.com/vault/1.0.2/vault_1.0.2_linux_amd64.zip > temp.zip; \
    unzip temp.zip; \
    rm temp.zip; \ 
    mv vault /usr/local/bin/ \
    ; \
# Install tini
    wget https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini -O /sbin/tini; \
    chmod +x /sbin/tini \
    ; \
# Clean up cached files
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set tini as default entry point
ENTRYPOINT ["/sbin/tini", "--"]
