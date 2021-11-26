SRCS:=$(wildcard *.dia)
PNGS:=$(SRCS:.dia=.png)
LOGS:=$(SRCS:.dia=.png.log)

DPI:=300

.PHONY: all
all: $(PNGS)

# woraround for inkscape's "feature" of returning always '0' (https://gitlab.com/inkscape/inkscape/-/issues/270)
%.png: %.svg Makefile
	inkscape --export-filename="$@" --export-dpi="$(DPI)" "$<" > "$@.log" 2>&1
	if ! [ -f "$@" ] ; then cat "$@.log" ; exit 4 ; fi

%.svg: %.dia Makefile
	dia -t svg -e "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(PNGS) $(LOGS)
