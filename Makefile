############################
# Usage
# make         # converts all *.md files to *.pdf and *.pptx files using pandoc
# make clean   # cleans up *.pdf and *.pptx artifacts
############################

all:

############################
# Common
############################

PANDOC = pandoc

PUBLISH_DIR = publish

############################
# Targets
############################

SRC  = $(filter-out README.md, $(wildcard *.md) $(wildcard **/*.md))
PDF  = $(SRC:.md=.pdf)
PPTX = $(SRC:.md=.pptx)

PDF_PUBLISH = $(addprefix $(PUBLISH_DIR)/,$(PDF))

SVG = $(wildcard *.svg) $(wildcard **/*.svg)
SVG_PDF = $(SVG:.svg=.pdf)

DOT = $(wildcard *.dot) $(wildcard **/*.dot)
DOT_PDF = $(DOT:.dot=.pdf)

############################
# Goals
############################

.PHONY: all clean pdf pptx publish
.DEFAULT_GOAL := all

all: pdf

publish: $(PDF_PUBLISH)
pdf:  $(PDF)
pptx: $(PPTX)

clean: 
	@echo "Cleaning up..."
	rm -rvf $(PDF) $(PPTX) $(SVG_PDF) $(DOT_PDF)

############################
# Publish patterns
############################

$(PDF_PUBLISH): $(PUBLISH_DIR)/%.pdf: %.pdf
	@mkdir -p $(@D)
	cp $< $@

############################
# Pandoc patterns
############################

PANDOC_ARGS :=

$(PDF): %.pdf: %.md
	$(PANDOC) $(PANDOC_ARGS) -t beamer --pdf-engine xelatex $< -o $@

%.pptx: %.md
	$(PANDOC) $(PANDOC_ARGS) $< -o $@
	
############################
# Image patterns
############################

$(SVG_PDF): %.pdf: %.svg
	inkscape -D $< -o $@


$(DOT_PDF): %.pdf: %.dot
	dot -Tpdf $< -o $@

############################
# Custom patterns
############################

pres.pdf pres.pptx pres.odp: pres.yaml $(filter images/%,$(DOT_PDF) $(SVG_PDF))
pres.pdf: pres-preamble.tex pres-template.tex
pres.pdf: PANDOC_ARGS = pres.yaml -H pres-preamble.tex --listings --template pres-template.tex --slide-level=1

