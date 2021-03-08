.PHONY: create-cluster
create-cluster:
	@kind create cluster --name hello-world && \
	make kustomize

.PHONY: delete-cluster
delete-cluster:
	@kind delete cluster --name hello-world

.PHONY: kustomize
kustomize:
	@kustomize build . | kubectl apply -f -