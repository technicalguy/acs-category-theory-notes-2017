.SUFFIXES: .pdf .tex .bib $(SUFFIXES)

FLAGS := -quiet
BUILD := build
SRC := lecture1.tex \
       lecture2.tex \
       lecture3.tex \
       lecture4.tex \
       lecture5.tex \
       lecture6.tex \
       lecture7.tex \
       lecture8.tex \
       lecture9.tex \
       lecture11.tex

SRC_DIR := tex
SRC := $(addprefix $(SRC_DIR)/,$(SRC))
BUILD_AUX := $(BUILD)/$(SRC_DIR)
TARGETS := acs-category-theory-notes.pdf

.PHONY: all
all: $(TARGETS)

%.pdf: %.tex $(SRC) | $(BUILD) $(BUILD_AUX)
	latexmk -pdf -output-directory=$(BUILD) -pdflatex="pdflatex -interaction=nonstopmode" $< $(FLAGS) > build.log
	mv $(BUILD)/$@ ./$@

$(BUILD_AUX): $(BUILD)
$(BUILD) $(BUILD_AUX): %:
	mkdir -p $@

.PHONY: clean
clean:
	git clean -xfd $(foreach target, $(TARGETS), --exclude="$(target)")
