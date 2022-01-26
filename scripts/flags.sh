#! /bin/bash

function usage() {
    cat <<USAGE

    Usage: ./flags.sh [--flag1 flag1] [--flag2 flag2]

    Options:
        -f1, --flag1: Using flag1
        -f2, --flag2: Using flag2
        -h, --help: Help
USAGE
    exit 1
}

function flag1() {
    if [[ "$1" == "" || "$1" == "-"* ]]; then
        echo "You must provide a proper parameter for flag1";
        exit 2;
    fi
    echo "this is flag1 function $1"
}

function flag2() {
    if [[ "$1" == "" || "$1" == "-"* ]]; then
        echo "You must provide a proper parameter for flag2";
        exit 2;
    fi
    echo "this is flag2 function $1"
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

FLAG1=
FLAG2=

while [ "$1" != "" ]; do
    case $1 in
    -f1 | --flag1)
        shift
        FLAG1=$1
	flag1 $FLAG1
        ;;
    -f2 | --flag2)
        shift
        FLAG2=$1
	flag2 $FLAG2
        ;;
    -h | --help)
        usage
        ;;
    *)
        usage
        exit 1
        ;;
    esac
    shift
done
