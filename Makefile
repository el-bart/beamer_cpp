SRCS:=$(shell find . -follow -type f -iname '*.tex')
QRS :=$(shell find qr/ -follow -type f)
PICS:=$(shell find pic/ -follow -type f)
DOTS:=$(shell find dot/ -follow -type f)
GPLS:=$(shell find gnuplot/ -follow -type f)
HDRS:=$(wildcard cpp/)

TEXFLAGS:=-file-line-error -halt-on-error

MAIN:=main
DVI :=$(MAIN).dvi
PDF :=$(MAIN).pdf

.PHONY: all
#all: REM=@true
all: pdf script

.PHONY: pdf
pdf: $(PDF)

$(PDF): $(SRCS) $(QRS) $(PICS) $(DOTS) $(GPLS) $(HDRS) Makefile | cpp qr dot gnuplot
	pdflatex $(TEXFLAGS) $(MAIN) || ( echo ; rm -fv $(PDF) ; exit 1 )
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)

.PHONY: cpp qr dot gnuplot
cpp qr dot gnuplot:
	+$(MAKE) -C "$@"

.PHONY: script
script: script.log
script.log: $(SRCS)
	grep -e '% NOTE: ' -e 'slide{' slides.tex $$(cat slides.tex | grep input | sed 's:.*{\(.*\)}:\1:') > "$@"


.PHONY: clean
clean:
	+$(MAKE) -C cpp clean
	+$(MAKE) -C qr  clean
	+$(MAKE) -C dot clean
	+$(MAKE) -C gnuplot clean
	rm -fv *.dvi *.pdf *.aux *bak *.log *.lof *.lot *.toc *.bbl *.blg *.nav *.out *.snm *.vrb
