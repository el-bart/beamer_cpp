DOTS:=$(wildcard *.dot)
DIAGS:=$(wildcard *.diag)

PNGS+=$(DOTS:.dot=.png)
PNGS+=$(DIAGS:.diag=.png)

SVGS+=$(PNGS:.png=.svg)

DPI:=300

# keep SVGs as well - vector images can still be usefull at later stages
.SECONDARY:

.PHONY: all
all: $(PNGS)

%.svg: %.dot Makefile
	dot -Tsvg -o "$@" "$<"

%.svg: %.diag Makefile
	seqdiag3 -Tsvg -o "$@" "$<"

%.png: %.svg Makefile
	inkscape --without-gui --file="$<" --export-png="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(PNGS) $(SVGS)
