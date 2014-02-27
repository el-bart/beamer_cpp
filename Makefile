SRCS:=$(shell find . -follow -type f -iname '*.tex')
PICS:=$(shell find . -follow -type f -iname '*.jpg' -o -iname '*.png')
HDRS:=$(wildcard cpp/*.hpp)

TEXFLAGS:=-file-line-error -halt-on-error

MAIN:=main
DVI :=$(MAIN).dvi
PDF :=$(MAIN).pdf

.PHONY: all
#all: REM=@true
all: pdf

.PHONY: pdf
pdf: $(PDF)

$(PDF): $(SRCS) $(PICS) $(HDRS) Makefile | cpp
	pdflatex $(TEXFLAGS) $(MAIN) || ( echo ; rm -fv $(PDF) ; exit 1 )
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)

.PHONY: cpp
cpp:
	+$(MAKE) -C cpp

.PHONY: clean
clean:
	+$(MAKE) -C cpp clean
	rm -fv *.dvi *.pdf *.aux *bak *.log *.lof *.lot *.toc *.bbl *.blg *.nav *.out *.snm *.vrb
