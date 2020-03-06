# Set up the tools needed for the local make
#

SFILES = Description.tex References.tex
RM = rm

PHONY: all

all:
	latexmk -pdf $(SFILES)

clean:
	$(RM) *.aux *.bbl *.blg *.fdb* *.fls *.log *.pdf




