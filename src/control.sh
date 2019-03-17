#!/usr/bin/env sh

sleep $WAIT_FOR

REMOTES=$(curl -s $CONSUL_ADDR/v1/catalog/service/jmeter | jq -r '. | map(.Address) | join(",")')

# Wait for at least a remote to be availabe
while [[ -z "$REMOTES" ]]; do
    echo "Waiting for more remote runner ..."
    sleep 1
    REMOTES=$(curl -s $CONSUL_ADDR/v1/catalog/service/jmeter | jq -r '. | map(.Address) | join(",")')
done

echo $REMOTES
if [ "$1" = 'jmeter' ]; then
    set -- "$@" -R "$REMOTES"
fi

exec "$@"