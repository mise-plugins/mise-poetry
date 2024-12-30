#! /usr/bin/env bash

if [[ ${MISE_TRACE-} == 1 ]]; then
  set -x
fi

echoerr() {
  printf 'mise-poetry: %s\n' "$@" >&2
}

is_enabled() {
  local name=$1
  local value=${!name:-false}
  [[ ${value} == "true" || ${value} == "1" ]]
}

poetry_bin() {
  local project_root=$1
  shift

  local args=(
    --directory "${project_root}"
    --no-interaction
  )
  if is_enabled MISE_PLUGIN_COLOR; then
    args+=(--ansi)
  fi

  "${MISE_INSTALL_PATH}/bin/poetry" "${args[@]}" "$@"
}

poetry_venv() {
  local project_root=$1
  shift

  local virtual_env
  virtual_env=$(poetry_bin "${project_root}" env info --path 2> /dev/null)

  if ! [[ -n ${virtual_env} && -d "${virtual_env}" ]]; then
    return 1
  fi

  printf '%s' "${virtual_env}"
}
