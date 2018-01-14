.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | \
	sort | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: format
format: ## Format the whole codabase with the upcoming formatter
	@docker run \
	--rm --name elixir_dev -it \
	-v $(shell pwd):/app leifg/elixir:edge \
	sh -c "cd /app && mix format ${FILE}"

.PHONY: publish-package
publish-package: ## Publish the package
	@mix hex.publish package

.PHONY: publish-docs
publish-docs: ## Publish the documentation
	@mix hex.publish docs
