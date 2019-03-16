#!/usr/bin/env sh

consul agent -config-dir=./consul.d -data-dir /opt/consul -retry-join=consul &

jmeter-server -Jserver.rmi.ssl.disable=true