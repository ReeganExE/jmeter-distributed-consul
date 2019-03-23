#!/usr/bin/env bash

jmx=${1:-"$PWD/test/testplan.jmx"}
output=${2:-"$PWD/results"}

slave=3
network=jmeter-cluster

docker network rm $network
docker network create $network

docker run --name consul --network $network -d consul consul agent -server -bootstrap -data-dir /consul/data -client 0.0.0.0

sleep 1

containers=()
for i in $(seq 1 $slave); do
  echo "Starting slave $i"
  id=$(docker run --network $network -d reeganexe/jmeter-slave)
  containers+=("$id")
done

sleep 1

docker run --rm --network $network \
  -v $jmx:/testplan.jmx \
  -v $output:/results \
  reeganexe/jmeter-ctl

echo "Tearing down..."
for i in ${containers[@]}; do
  docker rm -f "$i"
done
docker rm -f consul
