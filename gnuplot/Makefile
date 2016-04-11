GPLS:=$(wildcard *.gpl)
SVGS:=$(GPLS:.gpl=.svg)
EPSS:=$(SVGS:.svg=.eps)
DATS:=$(wildcard *.dat)

DPI:=300

# keep SVGs as well - vector images can still be usefull at later stages
.SECONDARY:

.PHONY: all
all: $(EPSS)

%.svg: %.gpl $(DATS) Makefile
	gnuplot "$<" > "$@"

%.eps: %.svg Makefile
	inkscape --without-gui --file="$<" --export-eps="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(EPSS) $(SVGS)
