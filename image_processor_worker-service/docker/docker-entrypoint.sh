#!/bin/bash

#socat TCP-LISTEN:11211,fork TCP:memcached:11211 &
#socat TCP-LISTEN:6379,fork TCP:redis:6379 &

ln -sf /var/run/secrets/WORKER_MASTER_KEY config/master.key

if [[ $1 != '' ]]; then
    exec "$@"
    exit $?
fi

if [[ "$SERVICE_MODE" == "debug" ]]; then
    echo "SERVICE_MODE: $SERVICE_MODE"
    sleep infinity
else
    bundle check || bundle install
    QUEUE=image_fetch bundle exec rake resque:work
fi
