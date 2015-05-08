GPLS:=$(wildcard *.gpl)
SVGS:=$(GPLS:.gpl=.svg)
PNGS:=$(SVGS:.svg=.png)

DPI:=300

# keep SVGs as well - vector images can still be usefull at later stages
.SECONDARY:

.PHONY: all
all: $(PNGS)

%.svg: %.gpl Makefile
	gnuplot "$<" > "$@"

%.png: %.svg Makefile
	convert -units PixelsPerInch -density "$(DPI)" "$<" "$@"

.PHONY: clean
clean:
	rm -fv $(PNGS) $(SVGS)
