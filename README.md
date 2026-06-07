# vandna-python-base

A minimal Python project base with virtual environment and dependency management
driven by a `Makefile` (macOS / Linux / Git Bash / WSL) and `.bat` scripts
(Windows `cmd.exe` / PowerShell).

> Assumes Python 3 is already installed and available on your `PATH`.
> The Makefile auto-detects `python3`, `python`, or the `py` launcher.
> The `.bat` scripts prefer the `py -3` launcher and fall back to `python`.
>
> **Windows note:** If `python` opens the Microsoft Store, either install
> Python from [python.org](https://www.python.org/downloads/windows/) with
> "Add python.exe to PATH" checked, or disable the App Execution Alias
> (Settings → Apps → Advanced app settings → App execution aliases).

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

## Windows (cmd.exe / PowerShell)

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

> If you have `make` available (Git Bash, MSYS2, or WSL), the `make` targets
> above also work on Windows — the [`Makefile`](Makefile:1) auto-detects the
> Python executable and the correct venv layout (`Scripts/` on Windows,
> `bin/` on POSIX).

## Adding dependencies

1. Add the package (with a pinned version) to [`requirements.txt`](requirements.txt:1).
2. Re-run `make install` (macOS/Linux) or `scripts\setup.bat` (Windows).

## Editing the entry point

The application starts in [`src/main.py`](src/main.py:1). Replace the contents
of [`main()`](src/main.py:4) with your own logic.
