#!/bin/bash

#socat TCP-LISTEN:11211,fork TCP:memcached:11211 &
#socat TCP-LISTEN:6379,fork TCP:redis:6379 &

export RAILS_MASTER_KEY=$(cat /var/run/secrets/UI_MASTER_KEY)

if [[ $1 != '' ]]; then
    exec "$@"
    exit $?
fi

if [[ "$SERVICE_MODE" == "debug" ]]; then
    echo "SERVICE_MODE: $SERVICE_MODE"
    sleep infinity
else
    bundle check || bundle install
    yarn install
    bundle exec rails s -b 0.0.0.0 -p 3000
fi
