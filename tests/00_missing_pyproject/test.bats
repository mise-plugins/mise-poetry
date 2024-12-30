#! /usr/bin/env bats

@test "missing pyproject.toml warning" {
  result=$(XDG_CACHE_HOME=/dev/null mise exec -- true 2>&1)
  pattern='mise-poetry: Project file not found \((/.+)/pyproject\.toml\)\. Execute `poetry init` to create it\.'
  [[ ${result} =~ ${pattern} ]]
}

@test "check environment: poetry install in path and functioning" {
  version=$(poetry --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
  [[ ":${PATH}:" == *":${XDG_DATA_HOME}/mise/installs/poetry/${version}/bin:"* ]]
}

@test "check environment: VIRTUAL_ENV is not set" {
  [[ ! -v VIRTUAL_ENV ]]
}

@test "check environment: POETRY_ACTIVE is not set" {
  [[ ! -v POETRY_ACTIVE ]]
}
