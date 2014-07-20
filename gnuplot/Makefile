GPLS:=$(wildcard *.gpl)
PNGS:=$(GPLS:.gpl=.png)


.PHONY: all
all: $(PNGS)

%.png: %.gpl Makefile
	gnuplot "$<" > "$@"

.PHONY: clean
clean:
	rm -fv $(PNGS)
