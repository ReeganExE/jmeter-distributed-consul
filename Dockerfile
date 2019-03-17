FROM java:8-jre-alpine

ARG JMETER_VERSION="5.1"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN ${JMETER_HOME}/bin

RUN apk add --update ca-certificates openssl unzip && update-ca-certificates; \
  mkdir -p ${JMETER_HOME};

# RUN wget -qO- https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz | tar xvzf - -C ${JMETER_HOME}; \
RUN wget -qO- http://mirror.downloadvn.com/apache//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz | tar xvzf - -C /opt/; \
  ln -s /opt/rmi_keystore.jks ${JMETER_BIN}/rmi_keystore.jks;

RUN touch /opt/rmi_keystore.jks

ENV PATH $PATH:$JMETER_BIN
