EXAMPLE=example
CLASS=uiowa-thesis.sty

ALL=$(CLASS) $(EXAMPLE)

.PHONY: all clean example help release watch

all:
	@scons

clean: ## Remove any build artifacts
	@rm -rf dist build

example: ## Build the example document
	@scons example

release: ## Create a release folder with all release artifacts for github
	@scons release

ctan: ## Create a release archive for ctan
	@scons ctan

watch: ## Watch the example document for changes, rebuild on change (requires inotifywait)
	@make all && while true; do \
		inotifywait -r $(ALL); \
		make all; \
		done

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
