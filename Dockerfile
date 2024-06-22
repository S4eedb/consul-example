FROM ubuntu
RUN wget https://releases.hashicorp.com/consul/1.18.2/consul_1.18.2_linux_amd64.zip
RUN apt-get update && apt-get install -y unzip
RUN unzip consul_1.18.2_linux_amd64.zip
RUN mv consul /usr/local/bin/
RUN rm consul_1.18.2_linux_amd64.zip
RUN mkdir -p /opt/consul/data
COPY ./config /etc/consul.d/
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8500 8600 8600/udp
CMD ["consul", "agent", "-config-dir=/etc/consul.d"]
