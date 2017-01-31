all:
	git submodule init --recursive
	python dotty/dotty.py -r config.json
