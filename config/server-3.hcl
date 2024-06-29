datacenter           = "dc1"
data_dir             = "/opt/consul/data"
log_level            = "INFO"
server               = true
bootstrap_expect     = 3
client_addr          = "0.0.0.0"
disable_update_check = true
retry_join           = ["consul-server-1", "consul-server-2", "consul-server-3"]
encrypt              = "kIO1Z7rslP+4N7yiVn4h2qps73ZI13Qo0dWmgOG6v7Y="
ui_config {
  enabled = true
}

tls {
  defaults {
    verify_incoming = false
    verify_outgoing = false
    ca_file         = "/opt/consul/tls/ca.pem"
    cert_file       = "/opt/consul/tls/consul.pem"
    key_file        = "/opt/consul/tls/consul-key.pem"
  }
}

acl {
  enabled        = true
  default_policy = "allow"
}

service {
  name = "consul"
  port = 8500
  check {
    id       = "api"
    name     = "HTTP API on port 8500"
    http     = "http://localhost:8500/v1/agent/self"
    interval = "10s"
    timeout  = "1s"
  }
}

telemetry {
  prometheus_retention_time = "24h"
  disable_hostname          = true
}
