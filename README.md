<h1 align="center">Kubernetes Hello World Kustomization</h1>
<p align="center">A Kuberbetes Kustomization KRM config example to run the <a href="https://github.com/bakeruk/kubernetes-hello-world-api">kubernetes-hello-world-api</a> project.</p>
<br />

## Table of contents
- [Table of contents](#table-of-contents)
- [Prerequisites](#prerequisites)
- [Getting started](#getting-started)
  - [1. Start the local registry](#1-start-the-local-registry)
  - [2. Create the Kubernetes cluster](#2-create-the-kubernetes-cluster)
  - [3. Apply the Kubernetes Resource Model (KRM) using Kustomize](#3-apply-the-kubernetes-resource-model-krm-using-kustomize)

## Prerequisites

 - [Docker](https://docs.docker.com/engine/install/)
 - [Kind](https://kind.sigs.k8s.io/docs/user/quick-start#installation)
 - [kubectl](https://kubectl.docs.kubernetes.io/installation/kubectl/)
 - [Kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/)

## Getting started

Before we begin, make sure that you have the adjacent [kubernetes-hello-world-api](https://github.com/bakeruk/kubernetes-hello-world-api) project and build the corresponding Docker image using the commands in the project's `README.md`.

It is also worth viewing the `Makefile` in this project. This houses most of the initial commands to manage the cluster.

### 1. Start the local registry

In order to serve local Docker images to your Kubernetes cluster, we firstly need to call a script that will pull and run another Docker a registry container.

```bash
make local-registry
```

### 2. Create the Kubernetes cluster

This will create the cluster and configure it to use the local Docker registry. It will also ensure that the local registry is running prior to the cluster's creation.

```bash
make create-cluster
```

### 3. Apply the Kubernetes Resource Model (KRM) using Kustomize

At this point....

```bash
make apply-kustomize-base
```