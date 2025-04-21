all: pdf

algorithmic.sty: algorithms.ins algorithms.dtx
	latex algorithms.ins

pdf: main.tex main.bib algorithmic.sty questions.tex
	pdflatex main.tex
	biber main
	pdflatex main.tex
	pdflatex main.tex
	cp main.pdf qoptics.pdf

clean:
	rm -rf qo.pdf qo.dvi main.aux main.bbl main.dvi main.pdf main.blg main.toc main.out questions.pdf questions.aux questions.log main.bcf 
	rm -rf algorithmic.sty  algorithm.sty
	rm -rf main.blg main.toc main.out main.idx main.ilg main.ind
	find . \( -name "*.log" -o -name "*~" \) -exec rm -rf {} \; 
