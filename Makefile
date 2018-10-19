TEXFILES = paper.tex
FIGURES = 
GRAPHS =

paper.pdf: $(FIGURES) $(TEXFILES) $(GRAPHS) paper.bib
	texi2pdf paper.tex
	xdg-open paper.pdf

clean: clean-graphs clean-figures
	rm -f paper.dvi paper.ps paper.pdf
	rm -f paper.log paper.aux paper.out missfont.log
	rm -f paper.bbl paper.blg

clean-graphs:
	rm -f $(GRAPHS)

clean-figures:
	rm -f $(FIGURES)

%.pdf: %.svg
	inkscape $< --export-pdf=$@
