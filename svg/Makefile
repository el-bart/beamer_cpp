SVGS:=$(wildcard *.svg)
PNGS:=$(SVGS:.svg=.png)

DPI:=300

.PHONY: all
all: $(PNGS)

%.png: %.svg Makefile
	inkscape -D -z --file="$<" --export-png="$@" --export-dpi="$(DPI)"

.PHONY: clean
clean:
	rm -fv $(PNGS)
