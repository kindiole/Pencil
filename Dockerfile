FROM cicirello/alpine-plus-plus:latest

RUN mkdir -p /scripts

COPY fetch-config.sh /scripts/fetch-config.sh

RUN chmod +x /scripts/fetch-config.sh

ENTRYPOINT ["/bin/bash", "/scripts/fetch-config.sh"]
