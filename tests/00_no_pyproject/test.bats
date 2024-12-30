#! /usr/bin/env bats

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
