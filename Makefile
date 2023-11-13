#!/usr/bin/env make -f
# -*- makefile -*-

SHELL = bash -e


image:
	@docker-compose -p latex -f docker-compose.yml build --force-rm --pull

start:
	@docker-compose -p latex -f docker-compose.yml up --remove-orphans -d

generate: start
	@docker-compose -p latex -f docker-compose.yml exec \
		-T --user luisalejandro latex xelatex cv-compact.tex
	@docker-compose -p latex -f docker-compose.yml exec \
		-T --user luisalejandro latex xelatex cv-compact-es.tex
	@docker-compose -p latex -f docker-compose.yml exec \
		-T --user luisalejandro latex xelatex cv-compact-2.tex

console: start
	@docker-compose -p latex -f docker-compose.yml exec \
		--user luisalejandro latex bash

stop:
	@docker-compose -p latex -f docker-compose.yml stop latex

down:
	@docker-compose -p latex -f docker-compose.yml down \
		--remove-orphans

destroy:
	@docker-compose -p latex -f docker-compose.yml down \
		--rmi all --remove-orphans -v
