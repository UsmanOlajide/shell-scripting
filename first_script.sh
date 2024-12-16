#!/bin/bash

sourcedir=$1
destinationdir=$2
TS=$(date +"%d%m%y%H%M%S")

log_file=${log}_${TS}

if (($# != 2))
then
  echo "FAIL!!! >>${log_file}
 Usage: To run this script, you need: 
         comm_arg1
         comm_arg2"
  exit
fi

cp "$sourcedir" "$destinationdir"
echo "A file called $sourcedir has been copied from Documents to $destinationdir at $TS" >>$log_file

# copy file