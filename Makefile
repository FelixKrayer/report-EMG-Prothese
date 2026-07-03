# Name der Haupt-LaTeX-Datei (ohne die Endung .tex)
FILE := main
OUT  := build

.PHONY: pdf
pdf:
	mkdir -p $(OUT)
	latexmk -interaction=nonstopmode -outdir="$(OUT)" -pdf -halt-on-error $(FILE)

.PHONY: watch
watch:
	mkdir -p $(OUT)
	latexmk -interaction=nonstopmode -outdir="$(OUT)" -pdf -pvc -halt-on-error $(FILE)

.PHONY: clean
clean:
	rm -rf $(filter-out $(wildcard $(OUT)/*.pdf), $(wildcard $(OUT)/*))

.PHONY: purge
purge:
	rm -rf $(OUT)