UMLS:=$(wildcard *.plantuml)
SVGS:=$(UMLS:.plantuml=.svg)
PNGS:=$(SVGS:.svg=.png)

DPI:=300

.SECONDARY:

.PHONY: all
all: $(PNGS)

%.svg: %.plantuml Makefile
	DISPLAY="" plantuml -tsvg "$<"

%.png: %.svg Makefile
	inkscape --without-gui --file="$<" --export-png="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(PNGS) $(SVGS)
