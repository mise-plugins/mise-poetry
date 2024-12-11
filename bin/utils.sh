#!/usr/bin/env bash

if [ "${MISE_TRACE-}" = "1" ]; then
  set -x
fi

echoerr() {
  echo "$1" >&2
}

poetry_bin() {
  "$MISE_INSTALL_PATH/bin/poetry" "$@"
}

poetry_venv() {
  local pyproject
  pyproject="$(eval "echo ${MISE_TOOL_OPTS__PYPROJECT-}")"
  if [[ "${MISE_POETRY_VENV_AUTO:-}" != "true" ]] && [[ "${MISE_POETRY_VENV_AUTO:-}" != "1" ]]; then
    if [ "$pyproject" = "" ]; then
      return 1
    fi
  elif [[ ! -f "poetry.lock" ]] | [[ ! -f "pyproject.toml" ]]; then
    return 1
  else
    pyproject="pyproject.toml"
  fi
  if [[ $pyproject != /* ]] && [[ -n ${MISE_PROJECT_ROOT-} ]]; then
    pyproject="${MISE_PROJECT_ROOT-}/$pyproject"
  fi
  if [[ ! -f $pyproject ]]; then
    echoerr "mise-poetry: No pyproject.toml found. Execute \`poetry init\` to create \`$pyproject\` first."
    return 1
  fi
  poetry_bin -C "${pyproject%/*}" env info --path 2>/dev/null
  true
}
