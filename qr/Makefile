TXTS:=$(wildcard *.txt)
EPSS:=$(TXTS:.txt=.eps)

.PHONY: all
all: $(EPSS)

%.eps: %.txt Makefile
	qrencode -o "$@" -s 40 -l H -m 0 -t EPS < "$<"

.PHONY: clean
clean:
	rm -fv $(EPSS) $(wildcard *-eps-converted-to.pdf)
