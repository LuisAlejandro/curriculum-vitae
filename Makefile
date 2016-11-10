#!/usr/bin/make -f
# -*- makefile -*-
#

SHELL = sh -e

generate:

	@docker run --rm -i --user="$(shell id -u):$(shell id -g)" --net=none -v $(PWD):/data -w /data luisalejandro/curriculum-vitae pdflatex curriculumvitae-es.tex
	@docker run --rm -i --user="$(shell id -u):$(shell id -g)" --net=none -v $(PWD):/data -w /data luisalejandro/curriculum-vitae pdflatex curriculumvitae-en.tex
	@rm *.aux *.out *.log
