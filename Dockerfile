FROM alpine:3.7
MAINTAINER emcniece@gmail.com

ARG RELEASE=0.2.0

ENV SCHEDULE=daily \
    RELEASE=${RELEASE} \
    VBM_EXPORT=secret/ \
    VBM_EXPORT_TO=/export \
    VBM_FILE=secret.json \
    VAULT_ADDR=http://vault:8200/ \
    VAULT_TOKEN= \
    SRC=https://github.com/adamdecaf/vault-backend-migrator/releases/download/$RELEASE/vault-backend-migrator-linux

ADD ./entrypoint.sh /entrypoint.sh

RUN wget $SRC -O /usr/bin/vault-backend-migrator \
 && chmod a+x /usr/bin/vault-backend-migrator \
 && chmod a+x /entrypoint.sh

CMD /entrypoint.sh