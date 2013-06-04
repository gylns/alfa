BOOK  = alfa
jobname = "-jobname=alfa"
preamble = "\input{preamble}"
alfa = "\input{alfa}"
AUX = alfa.aux toc.aux chap1.aux chap2.aux chap3.aux

all: ${BOOK}.pdf

aux: ${AUX}

${BOOK}.pdf: aux
	pdflatex ${jobname} ${preamble} ${alfa}

${AUX}: *.tex
	pdflatex ${jobname} ${preamble} ${alfa}

chap1 chap2 chap3: aux
	pdflatex ${jobname} ${preamble} "\includeonly{toc,$@}" ${alfa}

clean:
	rm *.aux *.out *.toc *.log
