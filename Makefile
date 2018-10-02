#!/usr/bin/make -f
# -*- makefile -*-
#

SHELL = sh -e

generate:

	@docker run --rm -i -u "$(shell id -u):$(shell id -g)" \
		-v "$(PWD):/data" -w /data dockershelf/latex:basic \
		pdflatex curriculumvitae-es.tex
	@docker run --rm -i -u "$(shell id -u):$(shell id -g)" \
		-v "$(PWD):/data" -w /data dockershelf/latex:basic \
		pdflatex curriculumvitae-en.tex
	@rm *.aux *.out *.log
