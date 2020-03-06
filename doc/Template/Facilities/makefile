# Local makefile for the Facilites document

SFILES = Facilities.tex
RM = rm

PHONY: all 

all:
	latexmk -pdf $(SFILES)

clean:
	$(RM) *.aux *.fdb* *.fls *.log *.pdf

