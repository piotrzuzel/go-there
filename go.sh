#!/bin/sh

usage="$(basename "$0") [OPTION]... [DIR]...
Program to quickly navigate between favorite directories.

    -a, --add - adds new entry with specified name, if no directory is specified current directory is taken as parameter
    -h, --help - displays this help message
    -l, --list - lists all existing directory aliases
    -r, --remove - removes specified entry from database" 

# creates ~/.go_config settings file if it doesn't exist
function createSettings() {
    if [ ! -f $HOME/.go_config ]
    then
        touch $HOME/.go_config
    fi
}

createSettings

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
    esac
fi

# keywords:
#	back
