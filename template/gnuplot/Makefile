GPLS:=$(wildcard *.gpl)
SVGS:=$(GPLS:.gpl=.svg)
PNGS:=$(SVGS:.svg=.png)
LOGS:=$(SVGS:.svg=.png.log)
DATS:=$(wildcard *.dat)

DPI:=300

# keep SVGs as well - vector images can still be usefull at later stages
.SECONDARY:

.PHONY: all
all: $(PNGS)

%.svg: %.gpl $(DATS) Makefile
	gnuplot "$<" > "$@"

# woraround for inkscape's "feature" of returning always '0' (https://gitlab.com/inkscape/inkscape/-/issues/270)
%.png: %.svg Makefile
	inkscape --export-filename="$@" --export-dpi="$(DPI)" "$<" > "$@.log" 2>&1
	if ! [ -f "$@" ] ; then cat "$@.log" ; exit 4 ; fi

.PHONY: clean
clean:
	rm -fv $(PNGS) $(SVGS) $(LOGS)
