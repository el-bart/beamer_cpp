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

# woraround for inkscape's "feature" of returning always '0' (https://gitlab.com/inkscape/inkscape/-/issues/270)
%.png: %.svg Makefile
	inkscape --without-gui --file="$<" --export-png="$@" --export-dpi="$(DPI)" > "$@.log" 2>&1
	if ! [ -f "$@" ] ; then cat "$@.log" ; exit 4 ; fi

.PHONY: clean
clean:
	rm -fv $(PNGS) $(SVGS)
