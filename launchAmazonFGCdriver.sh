#!/bin/bash

eventNum=`cat /proc/bus/input/devices | grep "Amazon Fire Game Controller" -A4 -B0 | awk 'NR==5' | grep -o 'event[0-9]\{1,\}'`
if [[ "$eventNum" == "" ]]
then
    echo "Could not find Amazon Fire Game Controller bluetooth device. Make sure that bluetooth is on and that the controller is paired and connected."
    exit 1
fi 

result="$(xboxdrv --evdev "/dev/input/$eventNum" --config amazon.conf --no-extra-events --silent &)"
err=`$result | sed -n -e '/[ ERROR ]/,$p'`
if [[ "$err" == "" ]]
then
    echo "Driver now activated. Your Amazon Fire Game Controller should be recognized as an Xbox controller in Steam."
else
    echo "There was an error. Here is the output of xboxdrv:"
    echo ""
    echo "$result"
fi
