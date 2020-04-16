.DEFAULT_GOAL := help

define build_specific_version
	git checkout master
	git branch -D $(1) || true
	git checkout -b $(1)
	sed -i -e "s/FROM node:latest/FROM node:$(1)/" Dockerfile
	git commit -am "Change base image to node:$(1)"
	git push origin $(1) --force-with-lease
	git checkout master
endef

.PHONY: build
build: ## build all branches
	$(call build_specific_version,"11.9")



.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
