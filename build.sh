#!/usr/bin/env bash

docker build -t reeganexe/jmeter-slave -f src/slave.Dockerfile .
docker build -t reeganexe/jmeter-ctl -f src/ctl.Dockerfile .
