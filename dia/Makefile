SRCS:=$(wildcard *.dia)
PNGS:=$(SRCS:.dia=.png)

DPI:=300

.PHONY: all
all: $(PNGS)

%.png: %.svg Makefile
	convert -units PixelsPerInch -density "$(DPI)" "$<" "$@"

%.svg: %.dia Makefile
	dia -t svg -e "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(PNGS)
