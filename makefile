all:
	git submodule update --init --recursive
	python3 dotty/dotty.py -r config.json
