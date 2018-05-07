.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build the container
	docker build -t nottsjs/contained .

run: ## Run the container
	docker run --rm -p 80:80 --name nottsjs-contained nottsjs/contained

clean: ## Remove the image
	docker image rm nottsjs/contained
