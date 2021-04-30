MAIN=thesis.tex
STYLE=uithesis.cls

ALL=$(MAIN) $(STYLE)

.PHONY: all clean watch

all:
	@scons

clean:
	@scons --clean

watch:
	@make all && while true; do \
		inotifywait -r $(ALL); \
		make all; \
		done

