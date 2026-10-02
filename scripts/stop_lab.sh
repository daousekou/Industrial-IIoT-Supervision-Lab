#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

echo "Stopping Industrial IIoT Supervision Lab..."
docker compose stop

echo
docker compose ps
