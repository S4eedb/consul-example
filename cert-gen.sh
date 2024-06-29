#!/bin/bash
mkdir -p certs
openssl genpkey -algorithm RSA -out certs/ca-key.pem -pkeyopt rsa_keygen_bits:2048
openssl req -x509 -new -nodes -key certs/ca-key.pem -days 3650 -out certs/ca.pem -subj "/CN=Consul CA"
openssl genpkey -algorithm RSA -out certs/consul-key.pem -pkeyopt rsa_keygen_bits:2048
openssl req -new -key certs/consul-key.pem -out certs/consul.csr -subj "/CN=consul-server"

cat > certs/server-ext.cnf <<EOF
basicConstraints=CA:FALSE
keyUsage = digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = consul-server
DNS.2 = consul-server-1
DNS.3 = consul-server-2
DNS.4 = consul-server-3
EOF

# Sign the server certificate with the CA
openssl x509 -req -in certs/consul.csr -CA certs/ca.pem -CAkey certs/ca-key.pem -CAcreateserial -out certs/consul.pem -days 365 -extfile certs/server-ext.cnf


