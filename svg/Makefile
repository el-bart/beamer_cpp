SVGS:=$(wildcard *.svg)
EPSS:=$(SVGS:.svg=.eps)

DPI:=300

.PHONY: all
all: $(EPSS)

%.eps: %.svg Makefile
	inkscape --without-gui --file="$<" --export-eps="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(EPSS) $(wildcard *-eps-converted-to.pdf)
