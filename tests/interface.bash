#!/usr/bin/env bash
#
# This is simply a command line interface to 
# optparse for testing. We define an argument of each type and
# just print the resulting input by default. Test verification is done outside.
#
# MODES
# Different modes can be activated using the environment variable
# OPTPARSE-TEST-MODE, possible values are:
# print - Just print input to output, with no requirements (Default)
# require - Use some required options 

#source "../optparse.bash"
source "/home/erikp/bin/optparse.bash"


main() {

    case "$1" in
        require)
            mode_require
            ;;
        *)
            mode_print "$@"
    esac
}

mode_require() {
    echo "Mode require"
}

mode_print() {
    optparse.define short=i long=input desc="The input file. No default)" required="true" variable=INPUT
    optparse.define short=o long=output desc="Output file. Default is default_value" variable=OUTPUT default="default_value"
    optparse.define short=v long=val desc="Boolean value." variable=VAL value="true" default="false"
    source $(optparse.build);

    echo "INPUT=${INPUT}"
    echo "OUTPUT=${OUTPUT}"
    echo "VAL=${VAL}"

}

main "$@"






