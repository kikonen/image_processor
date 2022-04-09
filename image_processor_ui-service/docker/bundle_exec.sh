#!/usr/bin/env bash
SCRIPT_DIR=$(realpath $(dirname $0)/../../../scripts)
CONTAINER=ui

$SCRIPT_DIR/rails_bundle_exec.sh $CONTAINER rails "$@"
