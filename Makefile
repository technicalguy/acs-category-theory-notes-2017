.SUFFIXES: .pdf .tex .bib $(SUFFIXES)

BUILD=build
TARGETS=acs-category-theory-notes.pdf

all: $(TARGETS)

%.pdf: %.tex
	latexmk -pdf  -output-directory=$(BUILD) -pdflatex="pdflatex -shell-escape -interaction=nonstopmode" -use-make $<
	mv $(BUILD)/$@ ./$@

clean:
	git clean -xfd $(foreach target, $(TARGETS), --exclude="$(target)")
