#!/usr/bin/env bash

network=jmeter-cluster
slave=2

docker network rm $network
docker network create $network

docker run --name consul --network $network -d consul consul agent -server -bootstrap -data-dir /consul/data -client 0.0.0.0

sleep 1

containers=()
for i in $(seq 1 $slave); do
  echo "Starting slave $i"
  id=$(docker run --network $network -d jmeter-slave)
  containers+=("$id")
done

sleep 4

docker run --rm --network $network \
  -v $PWD/distributed_testing_sample1.jmx:/distributed_testing_sample1.jmx \
  -v $PWD/abc:/results \
  jmeter-ctl

echo "Tearing down..."
for i in ${containers[@]}; do
  docker rm -f "$i"
done
docker rm -f consul
