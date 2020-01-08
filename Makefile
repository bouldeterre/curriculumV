
FILENAME=emonides-cv

clean:
	rm -f ${FILENAME}.log \
	${FILENAME}.aux \
	${FILENAME}.fdb_latexmk \
	${FILENAME}.fls \
	${FILENAME}.out
	
build:
	lualatex emonides-cv.tex

re: clean build	
