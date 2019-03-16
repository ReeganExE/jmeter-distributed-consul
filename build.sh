#!/usr/bin/env bash

docker build -t jmeter .
docker build -t jmeter-slave -f r.Dockerfile .
docker build -t jmeter-ctl -f ctl.Dockerfile .