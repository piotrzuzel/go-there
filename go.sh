#!/bin/sh

#
# global settings
#

# config file location
configFile=$HOME/.go-there_config

usage="$(basename "$0") [OPTION]... [DIR]...
Quickly navigate between favorite directories.

    -a, --add - adds new entry with specified name, if no directory is specified current directory is taken as parameter
    -h, --help - displays this help message
    -l, --list - lists all existing directory aliases
    -p, --print - prints directory under speciried alias
    -r, --remove - removes specified entry from database" 

# creates ~/.go_config settings file if it doesn't exist
function createSettings() {
    if [ ! -f $configFile ]
    then
        touch $configFile
    fi
}

function addAlias() {
    if [ -z $2 ]
    then
        saveAlias $1 `pwd`
    else
        saveAlias $1 $2
    fi
}

function saveAlias(){
    echo $1=$2>>$configFile
}

function removeAlias() {
    echo "ha"
}

function isAliasDefined() {
    bb=2
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
    aliasvalues=()

    # read settings file line by line
    while read line
    do
        #echo $line
        # aliases+=$line[0]
        # aliasvalues+=$line[1]
        for i in ${line[@]}
        do
            aliases+=($line[0])
            aliasvalues+=($line[1])
            #echo $i
        done
    done <$configFile
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
            addAlias $2 $3
            ;;
        "-h" | "--help")
            echo "$usage"
            ;;
        "-l" | "--list")
            for i in ${aliases[*]}; do
                echo ${i[0]}
            done
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
