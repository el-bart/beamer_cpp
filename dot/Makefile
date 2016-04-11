DOTS:=$(wildcard *.dot)
DIAGS:=$(wildcard *.diag)

EPSS+=$(DOTS:.dot=.eps)
EPSS+=$(DIAGS:.diag=.eps)

SVGS+=$(EPSS:.eps=.svg)

DPI:=300

# keep SVGs as well - vector images can still be usefull at later stages
.SECONDARY:

.PHONY: all
all: $(EPSS)

%.svg: %.dot Makefile
	dot -Tsvg -o "$@" "$<"

%.svg: %.diag Makefile
	seqdiag -Tsvg -o "$@" "$<"

%.eps: %.svg Makefile
	inkscape --without-gui --file="$<" --export-eps="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(EPSS) $(SVGS) $(wildcard *-eps-converted-to.pdf)
