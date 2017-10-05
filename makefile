.SUFFIXES: .pdf .tex .bib $(SUFFIXES)

TARGETS=acs-category-theory-notes.pdf

all: $(TARGETS)

%.pdf: %.tex
	latexmk -pdf -pdflatex="pdflatex -shell-escape -interaction=nonstopmode" -use-make $<

clean:
	git clean -xf $(foreach target, $(TARGETS), --exclude="$(target)")
