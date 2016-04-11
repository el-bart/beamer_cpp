UMLS:=$(wildcard *.plantuml)
SVGS:=$(UMLS:.plantuml=.svg)
EPSS:=$(SVGS:.svg=.eps)

DPI:=300

.SECONDARY:

.PHONY: all
all: $(EPSS)

%.svg: %.plantuml Makefile
	plantuml -tsvg "$<"

%.eps: %.svg Makefile
	inkscape --without-gui --file="$<" --export-eps="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(EPSS) $(SVGS) $(wildcard *-eps-converted-to.pdf)
