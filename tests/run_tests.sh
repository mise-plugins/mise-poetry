#! /usr/bin/env bash

set -u
shopt -s nullglob

BASE_DIR=${0%/*}
if [ "${BASE_DIR}" = "." ]; then
  BASE_DIR=${PWD}
elif [ "${BASE_DIR}" = "${BASE_DIR#/}" ]; then
  BASE_DIR=${PWD}/${BASE_DIR}
fi

SUCCESS=()
FAILURE=()

printf '██ Running tests\n'

FILES=("${BASE_DIR}"/*)
for DIR in "${FILES[@]}"; do
  if [[ ! -d ${DIR} ]]; then
    continue
  fi
  NAME=${DIR#"${BASE_DIR}/"}
  printf '█ %s\n\n' "${NAME}"

  if mise exec -C "${DIR}" -- bats -r "${DIR}"; then
    SUCCESS+=("${NAME}")
  else
    FAILURE+=("${NAME}")
  fi
done

declare -i EXIT=0

if ((${#SUCCESS[@]})); then
  printf '██ Passed:\n'
  printf '  - %s\n' "${SUCCESS[@]}"
  printf '\n'
fi

if ((${#FAILURE[@]})); then
  printf '██ Failed:\n'
  printf '  - %s\n' "${FAILURE[@]}"
  printf '\n'
  EXIT=1
fi

exit ${EXIT}
