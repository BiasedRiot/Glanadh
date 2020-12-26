#!/bin/bash

# CLI Arguments (Specify -e email or -d domain when running script)
TEMP=`getopt -o d: --long directory: -- "$@"`
eval set -- "$TEMP"

# Just the directory you want all the files scrubbed from

while true ; do
    case "$1" in
        -d|--directory)
            my_directory=$2 ; shift 2;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

find $my_directory -type f | xargs exiftool -overwrite_original -all=  
