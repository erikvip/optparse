#!/usr/bin/env bats

@test "run with no arguments" {
    run ./interface.bash
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "INPUT=" ]
    [ "${lines[1]}" = "OUTPUT=default_value" ]
    [ "${lines[2]}" = "VAL=false" ]
}

@test "specify short input argument" {
    run ./interface.bash -i DEADBEEF
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "INPUT=DEADBEEF" ]
    [ "${lines[1]}" = "OUTPUT=default_value" ]
    [ "${lines[2]}" = "VAL=false" ]
}

@test "specify long input argument" {
    run ./interface.bash --input DEADBEEF
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "INPUT=DEADBEEF" ]
    [ "${lines[1]}" = "OUTPUT=default_value" ]
    [ "${lines[2]}" = "VAL=false" ]
}

@test "override default argument with shortopt" {
    run ./interface.bash --input DEADBEEF -o OVERRIDDEN 
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "INPUT=DEADBEEF" ]
    [ "${lines[1]}" = "OUTPUT=OVERRIDDEN" ]
    [ "${lines[2]}" = "VAL=false" ]
}

@test "override default argument with longopt" {
    run ./interface.bash --input DEADBEEF --output OVERRIDDEN 
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "INPUT=DEADBEEF" ]
    [ "${lines[1]}" = "OUTPUT=OVERRIDDEN" ]
    [ "${lines[2]}" = "VAL=false" ]
}

@test "test boolean value with shortname" {
    run ./interface.bash -v
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "INPUT=" ]
    [ "${lines[1]}" = "OUTPUT=default_value" ]
    [ "${lines[2]}" = "VAL=true" ]
}

@test "test boolean value with longname" {
    run ./interface.bash --val
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "INPUT=" ]
    [ "${lines[1]}" = "OUTPUT=default_value" ]
    [ "${lines[2]}" = "VAL=true" ]
}

@test "use an invalid argument" {
    run ./interface.bash --unspecified_argument
    [ "$status" -eq 1 ]
    [ "${lines[0]}" = "Unrecognized long option: --unspecified_argument" ]
}