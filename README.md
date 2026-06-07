# vandna-python-base

A minimal Python project base with virtual environment and dependency management
driven by a `Makefile` (macOS / Linux) and `.bat` scripts (Windows).

> Assumes Python 3 is already installed and available on your `PATH`
> (`python3` on macOS/Linux, `python` on Windows).

## Project structure

```
vandna-python-base/
├── src/
│   └── main.py          # Application entry point
├── scripts/
│   ├── setup.bat        # Windows: create venv + install deps
│   └── run.bat          # Windows: run the app
├── Makefile             # macOS/Linux: setup & run targets
├── requirements.txt     # Python dependencies
├── .gitignore
└── README.md
```

## macOS / Linux

One-time setup (creates [`.venv`](.venv) and installs dependencies):

```bash
make setup
```

Run the application:

```bash
make run
```

Other useful targets:

```bash
make venv      # only create the virtual environment
make install   # only install requirements
make clean     # remove caches and build artifacts
make reset     # delete the virtual environment
make help      # list all targets
```

## Windows

One-time setup:

```bat
scripts\setup.bat
```

Run the application:

```bat
scripts\run.bat
```

You can pass extra arguments through to the script, e.g.:

```bat
scripts\run.bat --some-flag value
```

## Adding dependencies

1. Add the package (with a pinned version) to [`requirements.txt`](requirements.txt:1).
2. Re-run `make install` (macOS/Linux) or `scripts\setup.bat` (Windows).

## Editing the entry point

The application starts in [`src/main.py`](src/main.py:1). Replace the contents
of [`main()`](src/main.py:4) with your own logic.
