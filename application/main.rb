require 'prometheus/client'
require 'sinatra'
require 'logger'
require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/instrumentation/sinatra'

# Configuração do Prometheus
prometheus = Prometheus::Client.registry
counter = Prometheus::Client::Counter.new(:http_requests_total, docstring: 'A counter of HTTP requests made', labels: [:method, :path])
prometheus.register(counter)

# Configuração do Logger
loki_logger = Logger.new(STDOUT)
loki_logger.level = Logger::INFO

# Configuração do OpenTelemetry
OpenTelemetry::SDK.configure do |c|
  c.use_all
  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      OpenTelemetry::Exporter::OTLP::Exporter.new(endpoint: 'http://tempo:3200')
    )
  )
end

get '/' do
  counter.increment(labels: { method: 'get', path: '/' })
  loki_logger.info("This is a log message")
  tracer = OpenTelemetry.tracer_provider.tracer('example_tracer')
  tracer.in_span('example_operation') do |span|
    'Hello, world!'
  end
end

get '/metrics' do
  content_type 'text/plain'
  Prometheus::Client::Formats::Text.marshal(prometheus)
end
