.PHONY: all clean
all: main

mtheme:
	if [ -z "$(ls -A mtheme)" ]; then git submodule update --init --recursive; cd mtheme; make install; cd ..; fi

main: main.tex mtheme
	pdflatex $@.tex
	pdflatex $@.tex

clean:
	$(RM) main.aux main.log main.nav main.out main.pdf main.snm main.toc
