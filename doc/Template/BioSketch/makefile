# Local makefile for the BioSketch

SFILES = BioSketch.tex
RM = rm

PHONY: all

all:
	latexmk -pdf $(SFILES)

clean:
	$(RM) *.aux *.bbl *.blg *.fdb* *.fls *.log *.pdf
