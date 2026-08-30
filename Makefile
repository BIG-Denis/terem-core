#
# This file is a part of Terem Core project (https://github.com/BIG-Denis/terem-core).
#
# @author: BIG-Denis (https://github.com/BIG-Denis)
# @description: project makefile
#

# ----------------------------------------
#   Makefile configuration and variables
# ----------------------------------------

# Makefile utls
.PHONY: help init build lint lint-wall clean clean-all
.DEFAULT_GOAL := help

# Variables
PYTHON        = python3
VENV_NAME     = .venv
VENV_PYTHON   = $(VENV_NAME)/bin/python
VENV_PIP      = $(VENV_NAME)/bin/pip
REQUIREMENTS  = scripts/requirements.txt
BUILD_SCRIPT  = scripts/build.py
BUILD_DIR     = build
FILELIST_PATH = project/filelists/trmc_filelist.f

# ----------------------------------------
#   Makefile targets
# ----------------------------------------

# help (default) - show help message
help:
	@echo "> Available commands:"
	@echo ">     help      - show help message"
	@echo ">     init      - init repository and install dependencies"
	@echo ">     build     - build project with default config"
	@echo ">     lint      - lint builded project with verilator"
	@echo ">     lint-wall - lint builded project with verilator showing all warnings"
	@echo ">     clean     - clean files from previous build"
	@echo ">     clean-all - clean files from previous build and venv"

# init - update submodules, create venv
init:
	@echo "> Initializing repository..."
	git submodule update --init --recursive
	$(PYTHON) -m venv $(VENV_NAME)
	$(VENV_PIP) install --upgrade pip
	$(VENV_PIP) install -r $(REQUIREMENTS)

# build - build project with default config
build:
	@echo "> Building project with default config..."
	$(VENV_PYTHON) $(BUILD_SCRIPT)

# lint - lint builded design with verilator
lint:
	@echo "> Linting design with verilator..."
	cd build && \
	verilator --lint-only -sv -f $(FILELIST_PATH)

# lint-wall: lint builded design with verilator showing all warnings
lint-wall:
	@echo "> Linting design with verilator showing all warnings..."
	cd build && \
	verilator --lint-only -sv -Wall -f $(FILELIST_PATH)

# clean - clean build folder
clean:
	@echo "> Cleaning files from previous build..."
	rm -rf $(BUILD_DIR)

# clean-all - clean build and venv folders
clean-all:
	@echo "> Cleaning files from previous build and venv..."
	rm -rf $(BUILD_DIR)
	rm -rf $(VENV_NAME)
