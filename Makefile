# Cross-platform Makefile (macOS / Linux / Windows-with-make).
#
# Windows users running cmd.exe or PowerShell should use the .bat scripts in
# the scripts/ folder. This Makefile works on Windows only inside an
# environment that provides `make` (Git Bash, MSYS2, WSL, Cygwin).

# --- OS detection -----------------------------------------------------------
ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
else
    DETECTED_OS := $(shell uname -s)
endif

# --- Python executable auto-detection --------------------------------------
# Priority: explicit PYTHON override > python3 > python > py -3
ifeq ($(origin PYTHON),undefined)
    ifneq ($(shell command -v python3 2>/dev/null),)
        PYTHON := python3
    else ifneq ($(shell command -v python 2>/dev/null),)
        PYTHON := python
    else ifneq ($(shell command -v py 2>/dev/null),)
        PYTHON := py -3
    else
        PYTHON := python3
    endif
endif

VENV ?= .venv

# venv layout differs between POSIX (bin/) and Windows (Scripts/)
ifeq ($(DETECTED_OS),Windows)
    BIN = $(VENV)/Scripts
    PY  = $(BIN)/python.exe
    PIP = $(BIN)/pip.exe
else
    BIN = $(VENV)/bin
    PY  = $(BIN)/python
    PIP = $(BIN)/pip
endif

APP ?= src/main.py

.PHONY: help venv install setup run clean reset

help:
	@echo "Available targets:"
	@echo "  make venv     - create virtual environment in $(VENV)"
	@echo "  make install  - install dependencies from requirements.txt"
	@echo "  make setup    - venv + install (one-shot project setup)"
	@echo "  make run      - run the app ($(APP))"
	@echo "  make clean    - remove caches and build artifacts"
	@echo "  make reset    - remove the virtual environment"

venv:
	@test -d $(VENV) || $(PYTHON) -m venv $(VENV)
	@$(PY) -m pip install --upgrade pip

install: venv
	@$(PIP) install -r requirements.txt

setup: install
	@echo "Setup complete. Run with: make run"

run:
	@$(PY) $(APP)

clean:
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@rm -rf .pytest_cache .mypy_cache .ruff_cache build dist *.egg-info

reset:
	@rm -rf $(VENV)
