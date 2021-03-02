.PHONY: create
create:
	@kind create cluster --config kind-config.yaml --name hello-world

.PHONY: delete
delete:
	@kind delete cluster --name hello-world

.PHONY: create-build
create-kustomize:
	@make create && make kustomize

.PHONY: kustomize
kustomize:
	@kustomize build . | kubectl apply -f -