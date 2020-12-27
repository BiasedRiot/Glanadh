#!/bin/bash

# CLI Arguments (Specify -e email or -d domain when running script)
TEMP=`getopt -o d: --long directory: -- "$@"`
eval set -- "$TEMP"

# Just the directory you want all the files scrubbed from

my_directory=/nextcloud-data/Coogy/files

while :
do
sleep 10

while inotifywait -r -e create $my_directory; do
  # Sleep for 10 seconds in case there are a few files being uploaded
  sleep 10
  /usr/local/bin/remove_bulk_data.sh -d $my_directory 
done
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "glanfile.service finished at $TIMESTAMP"
done
