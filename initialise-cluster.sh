#!/bin/sh
set -o errexit

reg_name="hello-world-registry"
reg_port="5000"

# Create a kind cluster.
# Configures containerd to use the local Docker registry.
cat <<EOF | kind create cluster --name hello-world --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
containerdConfigPatches:
- |-
  [plugins."io.containerd.grpc.v1.cri".registry.mirrors."localhost:${reg_port}"]
    endpoint = ["http://${reg_name}:${reg_port}"]
EOF

# Connect the local Docker registry with the kind network
docker network connect "kind" "${reg_name}" > /dev/null 2>&1 &