#!/usr/bin/env sh

sleep $WAIT_FOR

remote=$(curl -s http://consul:8500/v1/catalog/service/jmeter | jq -r '. | map(.Address) | join(",")')

jmeter -n -t "distributed_testing_sample1.jmx" -l "results/result.csv" -Jserver.rmi.ssl.disable=true -R $remote
