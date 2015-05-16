SRCS:=$(wildcard *.tex)
QRS :=$(wildcard qr/*)
PICS:=$(wildcard pic/*)
DOTS:=$(wildcard dot/*)
SVGS:=$(wildcard svg/*)
GPLS:=$(wildcard gnuplot/*)
HDRS:=$(wildcard cpp/*)

TEXFLAGS:=-file-line-error -halt-on-error

MAIN:=main
DVI :=$(MAIN).dvi
PDF :=$(MAIN).pdf

.PHONY: all
#all: REM=@true
all: pdf script

.PHONY: pdf
pdf: $(PDF)

$(PDF): $(SRCS) $(QRS) $(PICS) $(DOTS) $(SVGS) $(GPLS) $(HDRS) Makefile | cpp qr dot svg gnuplot
	pdflatex $(TEXFLAGS) $(MAIN) || ( echo ; rm -fv $(PDF) ; exit 1 )
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)

.PHONY: fast
fast: REM:=true
fast: pdf

.PHONY: cpp qr dot svg gnuplot
cpp qr dot svg gnuplot:
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
	+$(MAKE) -C svg clean
	+$(MAKE) -C gnuplot clean
	rm -fv *.dvi *.pdf *.aux *bak *.log *.lof *.lot *.toc *.bbl *.blg *.nav *.out *.snm *.vrb
