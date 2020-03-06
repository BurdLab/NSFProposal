# Local makefile for the Postdoc mentoring plan


SFILES = PostdocPlan.tex
RM = rm

PHONY: all

all:
	latexmk -pdf $(SFILES)

clean:
	$(RM) *.aux *.fdb* *.fls *.log *.pdf

