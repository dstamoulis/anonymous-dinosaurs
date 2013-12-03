# source file - no spaces after the defintion
file=report


# pdf output uses .pdf figure files
# for make pdf, a make clean may be necessary after a make dvi
pdf:
	xelatex ${file}
	xelatex ${file}

# dvi output uses .eps figure files
#dvi:
#	latex ${file}

# ps output uses .eps figure files
#ps:	dvi
#	dvips ${file}.dvi -o ${file}.ps

backup:
	zip -9y version-`date +"%Y%m%d"`.zip *


# target clean is not complete
clean:
	-rm  ${file}.pdf ${file}.aux ${file}.log ${file}.out 
