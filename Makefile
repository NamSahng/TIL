PYTHON=3.9
BASENAME=$(shell basename $(CURDIR))
CONDA_CH= conda-forge defaults pyg
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
	# conda install --file requirements-gpu.txt cudatoolkit=11.3 -c pytorch
	conda install --file $(REQUIREMENTS) $(addprefix -c ,$(CONDA_CH)) 
	pip install -U -r requirements-pip.txt	--no-deps pandas
	
add_notebook:
	python -m ipykernel install --user --name $(BASENAME) --display-name $(BASENAME)