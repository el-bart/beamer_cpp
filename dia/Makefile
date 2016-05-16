SRCS:=$(wildcard *.dia)
PNGS:=$(SRCS:.dia=.png)

DPI:=300

.PHONY: all
all: $(PNGS)

%.png: %.svg Makefile
	inkscape --without-gui --file="$<" --export-png="$@" --export-dpi="$(DPI)"

%.svg: %.dia Makefile
	dia -t svg -e "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(PNGS)
