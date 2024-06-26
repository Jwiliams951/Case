FROM grafana/tempo:latest

USER root

RUN mkdir -p /etc/tempo/traces /etc/tempo/wal /etc/tempo/compact && \
    chmod -R 777 /etc/tempo

USER 10001

FROM grafana/loki:2.9.8

USER root

RUN mkdir -p /loki/index /loki/cache /loki/wal /loki/chunks /loki/compactor && \
    chown -R 10001:10001 /loki

USER 10001

ENTRYPOINT ["loki", "-config.file=/etc/loki/local-config.yaml"]
