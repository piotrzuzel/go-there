#!/bin/sh

usage="$(basename "$0") [OPTION]... [DIR]...
Quickly navigate between favorite directories.

    -a, --add - adds new entry with specified name, if no directory is specified current directory is taken as parameter
    -h, --help - displays this help message
    -l, --list - lists all existing directory aliases
    -p, --print - prints directory under speciried alias
    -r, --remove - removes specified entry from database" 

# creates ~/.go_config settings file if it doesn't exist
function createSettings() {
    if [ ! -f $HOME/.go_config ]
    then
        touch $HOME/.go_config
    fi
}

function addAlias() {
    echo "addalias"
}

function removeAlias() {
    echo "ha"
}

function isAliasDefined() {
    echo $1
}

function setLastDir() {
    export last_dir=`pwd`
}

function readProperties() {
    # save old Internal Field Separator shell variable
    OIFS=$IFS
    IFS='='

    # set aliases array
    aliases=()

    # read settings file line by line
    while read line
    do
        for i in ${line[@]}
        do
            aliases+=($line[0])
            echo $i, ${line[0]}
        done
    done <$HOME/.go_config
    export d=$aliases
    # restore old IFS variable}
    IFS=$OIFS
}

createSettings
isAliasDefined
setLastDir
readProperties

if [ $# -lt 1 ]
then
	echo "$usage"
else
    case "$1" in
        "-a" | "--add")
            echo "ADD"
            ;;
        "-h" | "--help")
            echo $usage
            ;;
        "-l" | "--list")
            echo $usage
            ;;
        "-r" | "--remove")
            if [ -z "$2" ]; then
                echo "You have to specify which alias you want to remove"
            else
                echo "removed"
                # remove alias
            fi
            ;;
        *)
            echo "default"
            ;;
    esac
fi

# keywords:
#	back
