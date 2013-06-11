BOOK  = alfa
jobname = "-jobname=alfa"
synctex = "-synctex=1"
preamble = "\input{preamble}"
alfa = "\input{alfa}"
AUX = alfa.aux toc.aux chap1.aux chap2.aux chap3.aux

all: ${BOOK}.pdf

aux: ${AUX}

${BOOK}.pdf: aux
	pdflatex ${jobname} ${synctex} ${preamble} ${alfa}

${AUX}: *.tex
	pdflatex ${jobname} ${preamble} ${alfa}

chap1 chap2 chap3:
	pdflatex ${jobname} ${preamble} "\nofiles" "\includeonly{toc,$@}" ${alfa}
	pdflatex ${jobname} ${synctex} ${preamble} "\includeonly{toc,$@}" ${alfa}

clean:
	rm *.aux *.out *.toc *.log
