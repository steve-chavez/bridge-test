FROM debian:jessie

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    libssl-dev \
    ca-certificates \
    curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -SLO https://github.com/steve-chavez/bridge-test/releases/download/v0.1.0/pgsql-amqp-bridge-debian && \
    mv pgsql-amqp-bridge-debian /usr/local/bin/pgsql-amqp-bridge && \
    chmod +x /usr/local/bin/pgsql-amqp-bridge

CMD exec pgsql-amqp-bridge
