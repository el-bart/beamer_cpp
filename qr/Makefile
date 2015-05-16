TXTS:=$(wildcard *.txt)
PNGS:=$(TXTS:.txt=.png)

.PHONY: all
all: $(PNGS)

%.png: %.txt Makefile
	qrencode -o "$@" -s 40 -l H -m 2 -t PNG < "$<"

.PHONY: clean
clean:
	rm -fv $(PNGS)
