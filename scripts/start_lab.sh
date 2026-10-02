#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

echo "Starting Industrial IIoT Supervision Lab..."
docker compose up -d

echo
docker compose ps
