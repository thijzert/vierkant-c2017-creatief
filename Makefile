.SUFFIXES:
.SUFFIXES: .tex .pdf

all : creatief.pdf
	


.tex.pdf : kampprogramma.cls kleineproblemen.cls weekprobleem.cls
	pdflatex $*.tex
	pdflatex $*.tex
	
	@echo -n "Errors:   "
	@grep Error: $*.log | wc -l
	@echo -n "Warnings: "
	@grep Warning: $*.log | wc -l
	@echo -n "Badboxes: "
	@grep -P '(Over|Under)full \\[hv]box' $*.log | wc -l
	



