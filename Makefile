.SUFFIXES: .pdf .tex .bib $(SUFFIXES)

FLAGS := -quiet
BUILD := build
SRC :=  lecture1.tex \
	lecture2.tex \
	lecture3.tex \
	lecture4.tex \
	lecture5.tex \
	lecture6.tex \
	lecture7.tex \
	lecture8.tex \
	lecture9.tex
SRC_DIR := tex
SRC := $(addprefix $(SRC_DIR)/,$(SRC))
TARGETS := acs-category-theory-notes.pdf

all: $(TARGETS)

%.pdf: %.tex $(SRC) | $(BUILD)
	latexmk -pdf -output-directory=$(BUILD) -pdflatex="pdflatex -interaction=nonstopmode" $< $(FLAGS) > build.log
	mv $(BUILD)/$@ ./$@

$(BUILD):
	mkdir -p $(BUILD)

clean:
	git clean -xfd $(foreach target, $(TARGETS), --exclude="$(target)")
