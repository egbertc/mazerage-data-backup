FROM memgraph/mgconsole:latest AS mgc

FROM mongo:7

RUN apt-get update \
    && apt-get install -y --no-install-recommends awscli ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=mgc /usr/bin/mgconsole /usr/local/bin/mgconsole
