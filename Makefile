project = polyu-thesis
engine = xelatex
backend = biber

all: paper clean

paper:
	quarto render --output-dir outputs

%:
	quarto render --output-dir outputs --to $*

# make release-<version>
release-%:
	mkdir -p releases/$*
	quarto render --output-dir releases/$*
	cp $(project).tex releases/$*/$(project).tex
	cp cleanthesis.sty PolyU_Logo_CMKY.pdf releases/$*/
	cp bibliography.bib releases/$*/
	echo $* > releases/VERSION

# make diff previous=<previous release> current=<current release>
diff:
	cd releases/$(current) && latexdiff --graphics-markup=both --math-markup=whole --config SCALEDELGRAPHICS=1 ../$(previous)/$(project).tex $(project).tex > $(project)-diff-$(previous)-$(current).tex
	mkdir -p releases/$(current)/temp/
	mkdir -p releases/$(current)/temp/figures/
	cp releases/$(current)/*.* releases/$(current)/temp/ || true
	cp releases/$(current)/figures/* releases/$(current)/temp/figures/ || true
	cp -n releases/$(previous)/figures/* releases/$(current)/temp/figures/ || true
	cd releases/$(current)/temp && $(engine) -interaction=nonstopmode $(project)-diff-$(previous)-$(current) || true
	cd releases/$(current)/temp && $(backend)                         $(project)-diff-$(previous)-$(current) || true
	cd releases/$(current)/temp && $(engine) -interaction=nonstopmode $(project)-diff-$(previous)-$(current) || true
	cd releases/$(current)/temp && $(engine) -interaction=nonstopmode $(project)-diff-$(previous)-$(current) || true
	cp releases/$(current)/temp/$(project)-diff-$(previous)-$(current).pdf releases/$(current)
	rm -rf releases/$(current)/temp/

clean:
	git clean -Xdf
