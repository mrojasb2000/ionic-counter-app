SHELL := /bin/sh
.DEFAULT_GOAL := help

.PHONY: help install start build watch lint test test-watch test-coverage test-ci clean deps \
        coverage-open status diff log stash pull push

help:
	@echo "Comandos disponibles:"
	@echo "  make install        - Instala dependencias"
	@echo "  make deps           - Alias de install"
	@echo "  make start          - Inicia servidor de desarrollo"
	@echo "  make build          - Genera build de produccion"
	@echo "  make watch          - Build en modo watch (development)"
	@echo "  make lint           - Ejecuta lint"
	@echo "  make test           - Ejecuta tests"
	@echo "  make test-watch     - Ejecuta tests en modo watch"
	@echo "  make test-coverage  - Ejecuta tests con coverage"
	@echo "  make test-ci        - Ejecuta tests para CI (sin watch + coverage)"
	@echo "  make coverage-open  - Abre el reporte de coverage en el navegador"
	@echo "  make clean          - Limpia artefactos comunes"
	@echo ""
	@echo "Git:"
	@echo "  make status         - git status"
	@echo "  make diff           - git diff (unstaged)"
	@echo "  make log            - Ultimos 10 commits (compacto)"
	@echo "  make stash          - git stash"
	@echo "  make pull           - git pull"
	@echo "  make push           - git push"

install:
	npm install

deps: install

start:
	npm run start

build:
	npm run build

watch:
	npm run watch

lint:
	npm run lint

test:
	npm run test

test-watch:
	npm run test:watch

test-coverage:
	npm run test:coverage

test-ci:
	npm run test:ci

coverage-open:
	open coverage/lcov-report/index.html

clean:
	rm -rf dist coverage .angular/cache

# --- Git ---

status:
	git status

diff:
	git diff

log:
	git log --oneline --graph --decorate -10

stash:
	git stash

pull:
	git pull

push:
	git push
