#!/usr/bin/env sh

sleep $WAIT_FOR

remote=$(curl -s $CONSUL_ADDR/v1/catalog/service/jmeter | jq -r '. | map(.Address) | join(",")')

# Wait for at least a remote to be availabe
while [[ -z "$remote" ]]; do
    echo "Waiting for more remote runner ..."
    sleep 1
    remote=$(curl -s $CONSUL_ADDR/v1/catalog/service/jmeter | jq -r '. | map(.Address) | join(",")')
done

jmeter -n -t "distributed_testing_sample1.jmx" -l "results/result.csv" -Jserver.rmi.ssl.disable=true -R $remote
