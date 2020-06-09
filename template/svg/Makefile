SVGS:=$(wildcard *.svg)
PNGS:=$(SVGS:.svg=.png)

DPI:=300

.PHONY: all
all: $(PNGS)

%.png: %.svg Makefile
	inkscape --without-gui --file="$<" --export-png="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(PNGS)
