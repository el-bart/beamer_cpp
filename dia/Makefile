SRCS:=$(wildcard *.dia)
EPSS:=$(SRCS:.dia=.eps)

DPI:=300

.PHONY: all
all: $(EPSS)

%.eps: %.svg Makefile
	inkscape --without-gui --file="$<" --export-eps="$@" --export-dpi="$(DPI)"

%.svg: %.dia Makefile
	dia -t svg -e "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(EPSS)
