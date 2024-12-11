# mise-poetry

[Poetry](https://github.com/python-poetry/poetry) plugin for mise version
manager

## Build History

[![Build history](https://buildstats.info/github/chart/mise-plugins/mise-poetry?branch=main)](https://github.com/mise-plugins/mise-poetry/actions)

## Installation

```bash
mise plugin add poetry
```

## Usage

Check [mise](https://github.com/jdx/mise) readme for instructions on how to
install & manage versions.

### Overriding installer

`MISE_POETRY_INSTALL_URL` is an optional variable you can specific to point to
the hosted installer of your choosing, e.g. `get-poetry.py` or the new `install-poetry.py`
(compatible with [1.1.7+](https://github.com/python-poetry/poetry/releases/tag/1.1.7) and
[default in 1.2](https://python-poetry.org/blog/announcing-poetry-1.2.0a1/#deprecation-of-the-get-poetrypy-script)).

For example, to force `install-poetry.py` on 1.1.9:

```
MISE_POETRY_INSTALL_URL=https://install.python-poetry.org mise install poetry 1.1.9
```

Doing so is not recommended and may result in poetry installations which
disregard the `mise-python` plugin. See [issue #10](https://github.com/mise-plugins/mise-poetry/issues/10).

## Virtualenv Activation

Automatically activate the poetry virtualenv when entering the directory with the following
`.mise.toml`:

```toml
[tools]
poetry = {version='latest', pyproject='pyproject.toml'}
python = '3.11' # must be after poetry so the poetry bin is first in PATH
```

You can also set `MISE_POETRY_VENV_AUTO=1` to automatically activate the virtualenv if the  
project contains both `pyproject.toml` and `poetry.lock` files.

Set `MISE_POETRY_AUTO_INSTALL=1` to automatically run `poetry install` to create the virtualenv.

## License

Licensed under the
[MIT license](https://github.com/mise-plugins/mise-poetry/blob/main/LICENSE).
