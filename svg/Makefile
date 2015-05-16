SVGS:=$(wildcard *.svg)
PNGS:=$(SVGS:.svg=.png)

DPI:=300

.PHONY: all
all: $(PNGS)

%.png: %.svg Makefile
	convert -units PixelsPerInch -density "$(DPI)" "$<" "$@"

.PHONY: clean
clean:
	rm -fv $(PNGS)
