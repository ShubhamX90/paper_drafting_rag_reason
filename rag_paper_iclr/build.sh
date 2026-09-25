#!/bin/sh
# Build the ICLR 2027 version of the paper.
#
# Four pdflatex passes after bibtex: longtable/float-heavy appendices and the
# bibliography both need multiple passes to converge page breaks and
# cross-references.
set -e
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
echo "Build complete."
