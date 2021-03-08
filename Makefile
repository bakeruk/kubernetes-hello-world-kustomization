.PHONY: local-registry
local-registry:
	@sh initialise-local-registry.sh

.PHONY: create-cluster
create-cluster:
	@make local-registry && \
	sh initialise-cluster.sh

.PHONY: delete-cluster
delete-cluster:
	@kind delete cluster --name hello-world

.PHONY: recreate-cluster
recreate-cluster:
	@make delete-cluster && \
	make create-cluster

.PHONY: kustomize
kustomize:
	@kustomize build . | kubectl apply -f -