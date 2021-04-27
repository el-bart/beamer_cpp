SRCS:=$(wildcard *.tex)
QRS:=$(wildcard qr/*)
PICS:=$(wildcard pic/*)
DOTS:=$(wildcard dot/*)
SVGS:=$(wildcard svg/*)
DIAS:=$(wildcard dia/*)
GPLS:=$(wildcard gnuplot/*)
HDRS:=$(wildcard cpp/*)
UMLS:=$(wildcard plantuml/*)
JSONS:=$(wildcard json/*)

TEXFLAGS:=
TEXFLAGS+=-file-line-error
TEXFLAGS+=-halt-on-error
TEXFLAGS+=-shell-escape


MAIN:=main
DVI :=$(MAIN).dvi
PDF :=$(MAIN).pdf

.PHONY: all
#all: REM=@true
all: pdf script

.PHONY: pdf
pdf: $(PDF)

$(PDF): $(SRCS) $(QRS) $(PICS) $(DOTS) $(SVGS) $(DIAS) $(GPLS) $(HDRS) $(UMLS) $(JSONS) Makefile | cpp qr dot svg dia gnuplot plantuml json
	pdflatex $(TEXFLAGS) $(MAIN) < /dev/null || ( echo ; rm -fv $(PDF) ; exit 1 )
	$(REM) pdflatex $(TEXFLAGS) $(MAIN) < /dev/null

.PHONY: fast
fast: REM:=true
fast: pdf

.PHONY: cpp qr dot svg dia gnuplot plantuml json
cpp qr dot svg dia gnuplot plantuml json:
	+$(MAKE) -C "$@"

.PHONY: script
script: script.log
script.log: $(SRCS) Makefile
	grep -e '% NOTE: ' -e 'slide{' -e 'subSlide{' slides.tex $$(cat slides.tex | grep '\\input' | sed 's:.*{\(.*\)}:\1:') > "$@" ; true


.PHONY: clean
clean:
	+$(MAKE) -C cpp clean
	+$(MAKE) -C qr  clean
	+$(MAKE) -C dot clean
	+$(MAKE) -C svg clean
	+$(MAKE) -C dia clean
	+$(MAKE) -C gnuplot clean
	+$(MAKE) -C plantuml clean
	+$(MAKE) -C json clean
	rm -fv *.dvi *.pdf *.aux *bak *.log *.lof *.lot *.toc *.bbl *.blg *.nav *.out *.snm *.vrb
