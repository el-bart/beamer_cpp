DOTS:=$(wildcard *.dot)
DIAGS:=$(wildcard *.diag)
PNGS+=$(DOTS:.dot=.png)
PNGS+=$(DIAGS:.diag=.png)


.PHONY: all
all: $(PNGS)

%.png: %.dot Makefile
	dot -Tpng -o "$@" "$<"

%.png: %.diag Makefile
	seqdiag -Tpng -o "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(PNGS)
