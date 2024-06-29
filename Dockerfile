FROM ubuntu
COPY ./bin/consul /usr/local/bin/consul
RUN mkdir -p /opt/consul/data
RUN mkdir -p /etc/consul.d
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8500 8600 8600/udp
CMD ["consul", "agent", "-config-dir=/etc/consul.d"]
