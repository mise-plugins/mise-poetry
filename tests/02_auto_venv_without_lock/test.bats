#! /usr/bin/env bats

@test "check environment: VIRTUAL_ENV is not set" {
    [[ ! -v VIRTUAL_ENV ]]
}

@test "check environment: POETRY_ACTIVE is not set" {
    [[ ! -v POETRY_ACTIVE ]]
}
