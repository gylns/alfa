BOOK  = alfa
jobname = -jobname=alfa
synctex = -synctex=1
interaction = -interaction=nonstopmode
preamble = "\input{preamble}"
alfa = "\input{alfa}"
AUX = alfa.aux toc.aux chap1.aux chap2.aux chap3.aux
LaTeX = pdflatex
opt = ${synctex} ${interaction} ${jobname}

all: ${BOOK}.pdf

aux: ${AUX}

${BOOK}.pdf: aux
	${LaTeX} ${opt} ${preamble} ${alfa}

${AUX}: *.tex
	${LaTeX} ${opt} ${preamble} ${alfa}

chap1 chap2 chap3:
	${LaTeX} ${opt} ${preamble} "\nofiles" "\includeonly{toc,$@}" ${alfa}
	${LaTeX} ${opt} ${preamble} "\includeonly{toc,$@}" ${alfa}

clean:
	rm -f *.aux *.out *.toc *.log *.gz *.pdf
