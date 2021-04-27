JSONS := $(filter-out %.format.json, $(wildcard *.json))
FORMATS := $(JSONS:.json=.format.json)

.SECONDARY:

.PHONY: all
all: $(FORMATS)

%.format.json: %.json Makefile
	@echo "JSON $@"
	@jq -r . < $< > $@ || { RET=$$? ; rm -fv "$@" ; exit "$$RET" ; }

.PHONY: clean
clean:
	rm -fv $(FORMATS)
