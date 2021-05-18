MAIN=example/thesis.tex
STYLE=uithesis.cls

ALL=$(MAIN) $(STYLE)

.PHONY: all clean release watch

all:
	@scons

clean:
	@scons --clean
	@rm -rf release

release:
	@make; \
		tmp_dir="$$(mktemp -d)"; \
		trap 'rm -rf -- "$$tmp_dir"' EXIT; \
		cp -r example "$$tmp_dir/thesis"; \
		cp -r -t "$$tmp_dir/thesis/" uithesis.cls thesis.pdf; \
		make clean; \
		cd "$$tmp_dir"; \
		zip -r thesis.zip thesis ; \
		cd - ; \
		mkdir -p release ; \
		cp -t release "$$tmp_dir/thesis/thesis.pdf" "$$tmp_dir/thesis.zip"

watch:
	@make all && while true; do \
		inotifywait -r $(ALL); \
		make all; \
		done

