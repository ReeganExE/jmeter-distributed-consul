FROM reeganexe/jmeter

ENV WAIT_FOR=${WAIT_FOR:-3} CONSUL_ADDR=${CONSUL_ADDR:-"http://consul:8500"}

RUN apk update && apk add curl jq && \
  rm -rf /var/cache/apk/*

COPY control.sh /

VOLUME ["/results"]

CMD ["/control.sh"]