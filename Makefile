.PHONY: local-registry
local-registry:
	sh initialise-local-registry.sh

.PHONY: create-cluster
create-cluster: local-registry
	sh initialise-cluster.sh

.PHONY: delete-cluster
delete-cluster:
	@kind delete cluster --name hello-world

.PHONY: recreate-cluster
recreate-cluster: delete-cluster create-cluster

.PHONY: apply-kustomize-base
apply-kustomize-base:
	@kustomize build . | kubectl apply -f -