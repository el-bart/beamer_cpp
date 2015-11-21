GPLS:=$(wildcard *.gpl)
SVGS:=$(GPLS:.gpl=.svg)
PNGS:=$(SVGS:.svg=.png)
DATS:=$(wildcard *.dat)

DPI:=300

# keep SVGs as well - vector images can still be usefull at later stages
.SECONDARY:

.PHONY: all
all: $(PNGS)

%.svg: %.gpl $(DATS) Makefile
	gnuplot "$<" > "$@"

%.png: %.svg Makefile
	inkscape -D -z --file="$<" --export-png="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(PNGS) $(SVGS)
