UMLS:=$(wildcard *.plantuml)
SVGS:=$(UMLS:.plantuml=.svg)
PNGS:=$(SVGS:.svg=.png)

DPI:=300

.SECONDARY:

.PHONY: all
all: $(PNGS)

%.svg: %.plantuml Makefile
	DISPLAY="" plantuml -tsvg "$<"

# woraround for inkscape's "feature" of returning always '0' (https://gitlab.com/inkscape/inkscape/-/issues/270)
%.png: %.svg Makefile
	inkscape --without-gui --file="$<" --export-png="$@" --export-dpi="$(DPI)" > "$@.log" 2>&1
	if ! [ -f "$@" ] ; then cat "$@.log" ; exit 4 ; fi

.PHONY: clean
clean:
	rm -fv $(PNGS) $(SVGS)
