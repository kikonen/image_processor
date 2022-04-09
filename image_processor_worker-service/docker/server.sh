#!/usr/bin/env bash
SCRIPT_DIR=$(realpath $(dirname $0)/../../../scripts)
CONTAINER=worker

$SCRIPT_DIR/rails_server.sh $CONTAINER "$@"
