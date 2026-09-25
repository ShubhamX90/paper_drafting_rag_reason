#!/bin/sh
# Build the paper.
#
# IMPORTANT: this document requires FOUR pdflatex passes after bibtex.
# With only three, the `lineno` package (ACL review-mode line numbers) has not
# converged and ~150 line numbers are typeset inside the column text instead of
# the margins. The extra pass is needed because longtable and the large number
# of floats change page breaks on each pass, and lineno resolves its column
# placement from the previous pass's positions.
set -e
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
echo "Build complete. Verify line numbers converged with: sh check_linenumbers.sh"
