#!/bin/sh
set -o errexit

reg_name="hello-world-registry"
reg_port="5000"

# Start a local Docker registry (unless it already exists)
running="$(docker inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)"

if [ "${running}" != 'true' ]; then
  docker run \
    -d --restart=always -p "${reg_port}:5000" --name "${reg_name}" \
    registry:2
fi