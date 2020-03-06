# Local makefile for the Budget Justification

SFILES = BudgetJustification.tex
RM = rm

PHONY: all

all:
	latexmk -pdf $(SFILES)

clean:
	$(RM) *.aux *.fdb* *.fls *.log *.pdf

