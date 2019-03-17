FROM reeganexe/jmeter

ARG CONSUL_VERSION="1.4.3"
ENV CONSUL_HOST=${CONSUL_HOST:-"consul"}

RUN wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -O /tmp/consul_${CONSUL_VERSION}_linux_amd64.zip && \
  unzip /tmp/consul_${CONSUL_VERSION}_linux_amd64.zip -d /usr/local/bin/ && \
  rm /tmp/consul_${CONSUL_VERSION}_linux_amd64.zip && \
  rm -rf /var/cache/apk/*

WORKDIR /working
COPY slave.sh consul.json ./

ENV PATH $PATH:/working
ENTRYPOINT ["slave.sh"]
CMD ["jmeter-server", "-Jserver.rmi.ssl.disable=true"]
