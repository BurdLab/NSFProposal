# Local makefile for the Data Management Plan

SFILES = DataManagement.tex
RM = rm

PHONY: all

all:
	latexmk -pdf $(SFILES)

clean:
	$(RM) *.aux *.fdb* *.fls *.log *.pdf

