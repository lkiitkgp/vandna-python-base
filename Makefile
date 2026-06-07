# Cross-platform-ish Makefile for mac/linux.
# Windows users: use the .bat scripts in the scripts/ folder.

PYTHON ?= python3
VENV   ?= .venv
BIN     = $(VENV)/bin
PIP     = $(BIN)/pip
PY      = $(BIN)/python
APP    ?= src/main.py

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
