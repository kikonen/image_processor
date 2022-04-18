#!/bin/bash

if [[ $1 != '' ]]; then
    exec "$@"
    exit $?
fi

echo "SERVICE_MODE: $SERVICE_MODE"

if [[ "$SERVICE_MODE" == "debug" ]]; then
    sleep infinity
else
    QUEUE=image_fetch bundle exec rake resque:work
fi
