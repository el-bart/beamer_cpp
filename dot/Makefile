DOTS:=$(wildcard *.dot)
PNGS:=$(DOTS:.dot=.png)


.PHONY: all
all: $(PNGS)

%.png: %.dot Makefile
	dot -Tpng -o "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(PNGS)
