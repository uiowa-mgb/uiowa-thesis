EXAMPLE=example
CLASS=uiowa-thesis.sty

ALL=$(CLASS) $(EXAMPLE)

.PHONY: all clean example help release watch

all: example

clean: ## Remove any build artifacts
	@scons --clean
	@rm -rf release

example: ## Build the example document
	@scons

release: example ## Create a release folder with all release artifacts
	@mkdir -p release; \
		cp -t release thesis.pdf; \
		tmp_dir="$$(mktemp -d)"; \
		trap 'rm -rf -- "$$tmp_dir"' EXIT; \
		cp -r example "$$tmp_dir/thesis"; \
		cp -r -t "$$tmp_dir/thesis/" uithesis.cls; \
		output="$$(pwd)/release/thesis.zip"; \
		cd "$$tmp_dir"; \
		zip -r "$$output" thesis; \

watch: ## Watch the example document for changes, rebuild on change (requires inotifywait)
	@make all && while true; do \
		inotifywait -r $(ALL); \
		make all; \
		done

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
