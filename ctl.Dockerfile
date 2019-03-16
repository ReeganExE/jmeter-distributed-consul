FROM jmeter

ENV WAIT_FOR=${WAIT_FOR:-3}

RUN apk add curl jq; \
  rm -rf /var/cache/apk/*

COPY control.sh /

VOLUME [ "/results" ]

CMD ["/control.sh"]
