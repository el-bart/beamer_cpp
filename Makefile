SRCS:=$(shell find . -follow -type f -iname '*.tex')
PICS:=$(shell find pic/* -follow -type f)
DOTS:=$(shell find dot/* -follow -type f)
GPLS:=$(shell find gnuplot/* -follow -type f)
HDRS:=$(wildcard cpp/*.hpp)

TEXFLAGS:=-file-line-error -halt-on-error

MAIN:=main
DVI :=$(MAIN).dvi
PDF :=$(MAIN).pdf

.PHONY: all
#all: REM=@true
all: pdf script

.PHONY: pdf
pdf: $(PDF)

$(PDF): $(SRCS) $(PICS) $(DOTS) $(GPLS) $(HDRS) Makefile | cpp dot gnuplot
	pdflatex $(TEXFLAGS) $(MAIN) || ( echo ; rm -fv $(PDF) ; exit 1 )
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)

.PHONY: cpp dot gnuplot
cpp dot gnuplot:
	+$(MAKE) -C "$@"

.PHONY: script
script: script.log
script.log: $(SRCS)
	grep -e '% NOTE: ' -e 'slide{' slides.tex $$(cat slides.tex | grep input | sed 's:.*{\(.*\)}:\1:') > "$@"


.PHONY: clean
clean:
	+$(MAKE) -C cpp clean
	+$(MAKE) -C dot clean
	+$(MAKE) -C gnuplot clean
	rm -fv *.dvi *.pdf *.aux *bak *.log *.lof *.lot *.toc *.bbl *.blg *.nav *.out *.snm *.vrb
