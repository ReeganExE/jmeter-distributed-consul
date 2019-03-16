FROM jmeter

RUN \
  wget https://releases.hashicorp.com/consul/1.4.3/consul_1.4.3_linux_amd64.zip -O /tmp/consul_1.4.3_linux_amd64.zip; \
  unzip /tmp/consul_1.4.3_linux_amd64.zip -d /usr/local/bin/ ;\
  rm /tmp/consul_1.4.3_linux_amd64.zip; \
  rm -rf /var/cache/apk/*

WORKDIR /working

RUN mkdir consul.d

COPY entrypoint.sh /
COPY consul.json ./consul.d/


CMD ["/entrypoint.sh"]
