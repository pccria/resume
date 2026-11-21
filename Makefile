.PHONY: all en fa build-image clean

IMAGE ?= resume-builder:latest

all: en fa

build-image:
	docker build -t $(IMAGE) .

en:
	cd resume && pdflatex -interaction=nonstopmode resume.tex

fa:
	docker run --rm --user $$(id -u):$$(id -g) -e HOME=/tmp -v "$$(pwd)/resume:/work" $(IMAGE) xelatex -interaction=nonstopmode resume_fa.tex

clean:
	cd resume && rm -f *.aux *.log *.out *.toc *.synctex.gz
