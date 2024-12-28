project = paper

all: paper clean

paper:
	quarto render --output-dir outputs

%:
	quarto render --output-dir outputs --to $*

clean:
	git clean -Xdf
