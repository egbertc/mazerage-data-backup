FROM memgraph/mgconsole:latest AS mgc

FROM mongo:8

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl unzip \
    && curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o /tmp/awscliv2.zip \
    && unzip -q /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/awscliv2.zip /tmp/aws \
    && apt-get purge -y --auto-remove unzip curl \
    && rm -rf /var/lib/apt/lists/*

COPY --from=mgc /usr/local/bin/mgconsole /usr/local/bin/mgconsole
