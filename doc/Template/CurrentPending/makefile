# Local makefile for the Current and Pending

SFILES = CurrentPending.tex
RM = rm

PHONY: all 

all:
	latexmk -pdf $(SFILES)

clean:
	$(RM) *.aux *.fdb* *.fls *.log *.pdf

