datacenter = "dc1"
data_dir = "/opt/consul/data"
log_level = "INFO"
server = true
bootstrap_expect = 1
client_addr = "0.0.0.0"
ui = true
disable_update_check = true
retry_join = ["consul-server-1", "consul-server-2", "consul-server-3"]