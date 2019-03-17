#!/usr/bin/env sh

consul agent -config-file=consul.json -data-dir /opt/consul -retry-join=$CONSUL_HOST -retry-interval=2s &

jmeter-server -Jserver.rmi.ssl.disable=true