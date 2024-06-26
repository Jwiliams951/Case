# Observabilidade - Estudo de Caso

Este projeto fornece uma solução para instrumentar uma aplicação legada que não tem suporte a OpenTelemetry ou Prometheus Exporter. Utiliza uma abordagem baseada em containers com Grafana, Prometheus, Loki, Tempo e Nginx para monitoramento e observabilidade.

## Arquitetura
A arquitetura do projeto inclui as seguintes componentes:

- **Abordagem de Monitoramento**: Contêiner com Grafana, Prometheus, Mimir, Loki, e Tempo.
- **Aplicação Legada**: Contêiner da aplicação Ruby.
- **Nginx**: Contêiner para atuar como ingress.

### Tecnologias Utilizadas
- **Prometheus**: Para coleta de métricas.
- **Grafana**: Para visualização de métricas e logs.
- **Loki**: Para agregação e consulta de logs.
- **Tempo**: Para rastreamento de traces.
- **Nginx**: Como servidor web e balanceador de carga.
- **Sinatra**: Framework web para Ruby usado na aplicação legada.
- **OpenTelemetry**: Biblioteca para instrumentação da aplicação.

## Estrutura do Projeto
```plaintext
├── application/
│   ├── Dockerfile
│   ├── Gemfile
│   ├── Gemfile.lock
│   └── main.rb
├── tempo-data/
│   ├── compact/
│   ├── traces/
│   └── wal/
├── tmp/
│   ├── compact/
│   ├── traces/
│   └── wal/
├── docker-compose.yaml
├── Dockerfile
├── local-config.yaml
├── mimir.yml
├── nginx.conf
├── prometheus.yml
└── tempo-local.yaml

Passo a Passo
1 - Clone o repositório
2 - Configure o Prometheus:
3 - Configure o Loki:
4 - Configure o Tempo:
5 - Configure o Nginx:
6- Configure a aplicação Ruby:
7- Construa e inicie os contêineres:

Endpoints
Grafana: http://localhost:3000
Prometheus: http://localhost:9090
Loki: http://localhost:3100
Tempo: http://localhost:3200
Nginx: http://localhost:80
Aplicação: http://localhost:8080
