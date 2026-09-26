#
# This file is a part of Terem Core project (https://github.com/BIG-Denis/terem-core).
#
# @author: BIG-Denis (https://github.com/BIG-Denis)
# @description: project makefile
#

# ----------------------------------------
#   Makefile configuration and variables
# ----------------------------------------

# Makefile utils
.PHONY: help init build lint lint-wall clean clean-all
.DEFAULT_GOAL := help

# Makefile variables
#   executables
PYTHON       = python3
VERILATOR    = verilator
#   python utils
VENV_NAME    = .venv
VENV_PYTHON  = $(VENV_NAME)/bin/python
VENV_PIP     = $(VENV_NAME)/bin/pip
#   files and folders
REQUIREMENTS = scripts/requirements.txt
BUILD_SCRIPT = scripts/gen/build.py
BUILD_DIR    = build
FILELIST     = project/filelists/trmc_filelist.f
WAIVERS      = project/waivers/trmc_waivers.vlt
#   command line arguments
ARGS_VERILATOR_COMMON    = -sv $(WAIVERS) -f $(FILELIST)
ARGS_VERILATOR_LINT      = $(ARGS_VERILATOR_COMMON) --lint-only
ARGS_VERILATOR_LINT_WALL = $(ARGS_VERILATOR_LINT) -Wall

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
	git submodule update --init --recursive --checkout
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
	cd $(BUILD_DIR) && \
	$(VERILATOR) $(ARGS_VERILATOR_LINT)

# lint-wall: lint builded design with verilator showing all warnings
lint-wall:
	@echo "> Linting design with verilator showing all warnings..."
	cd $(BUILD_DIR) && \
	$(VERILATOR) $(ARGS_VERILATOR_LINT_WALL)

# clean - clean build folder
clean:
	@echo "> Cleaning files from previous build..."
	rm -rf $(BUILD_DIR)

# clean-all - clean build and venv folders
clean-all:
	@echo "> Cleaning files from previous build and venv..."
	rm -rf $(BUILD_DIR)
	rm -rf $(VENV_NAME)
