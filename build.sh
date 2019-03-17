#!/usr/bin/env bash

docker build -t jmeter-slave -f src/r.Dockerfile src
docker build -t jmeter-ctl -f src/ctl.Dockerfile src
