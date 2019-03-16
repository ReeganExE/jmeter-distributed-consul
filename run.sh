#!/usr/bin/env bash

network=jmeter-cluster
slave=3

docker network rm $network
docker network create $network

docker run --name consul --network $network -d consul consul agent -server -bootstrap -data-dir /consul/data -client 0.0.0.0

sleep 1
for i in $(seq 1 $slave); do
  echo "Starting slave $i"
  docker run --network $network -d jmeter-slave
done

sleep 4

docker run --network $network \
  -v $PWD/distributed_testing_sample1.jmx:/distributed_testing_sample1.jmx \
  -v $PWD/abc:/results \
  jmeter-ctl
