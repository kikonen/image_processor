#!/usr/bin/env bash
SCRIPT_DIR=$(realpath $(dirname $0)/../../../scripts)
CONTAINER=auth

$SCRIPT_DIR/rails_bundle_exec.sh $CONTAINER rails "$@"
