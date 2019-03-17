#!/usr/bin/env bash

docker build -t jmeter-slave -f src/slave.Dockerfile src
docker build -t jmeter-ctl -f src/ctl.Dockerfile src
