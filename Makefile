PYTHON=3.9
BASENAME=$(shell basename $(CURDIR))
CONDA_CH=conda-forge defaults
UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
	REQUIREMENTS=requirements.txt
endif
ifeq ($(UNAME), Darwin)
	REQUIREMENTS=requirements-mac.txt
endif

env:
	conda create -n $(BASENAME)  python=$(PYTHON)

setup:
	conda install --file requirements-gpu.txt cudatoolkit=11.3 -c pytorch
	conda install --file $(REQUIREMENTS) $(addprefix -c ,$(CONDA_CH))
	conda install --file requirements-pyg.txt -c pyg
	pip install -r requirements-pip.txt	
	
	
add_notebook:
	python -m ipykernel install --user --name $(BASENAME) --display-name $(BASENAME)