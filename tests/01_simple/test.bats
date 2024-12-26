#! /usr/bin/env bats

@test "check environment: VIRTUAL_ENV is set" {
  [[ ${VIRTUAL_ENV} == "${PWD}/.venv" ]]
}

@test "check environment: POETRY_ACTIVE == 1" {
  [[ ${POETRY_ACTIVE} == "1" ]]
}

@test "check environment: PATH contains venv bin" {
  [[ ":${PATH}:" == *":${VIRTUAL_ENV}/bin:"* ]]
}

@test "check installed packages" {
  result=$(which pbr)
  [[ ${result} == "${VIRTUAL_ENV}/bin/pbr" ]]
}
