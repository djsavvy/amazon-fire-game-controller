#!/bin/bash

eventNum=`cat /proc/bus/input/devices | grep "Amazon Fire Game Controller" -A4 -B0 | awk 'NR==5' | grep -o 'event[0-9]\{1,\}'`
if [[ "$eventNum" == "" ]]
then
    echo "Could not find Amazon Fire Game Controller bluetooth device. Make sure that bluetooth is on and that the controller is paired and connected."
    exit 1
fi 

echo "Attempting driver activation..."
xboxdrv --evdev "/dev/input/$eventNum" --config amazon.conf --no-extra-events --silent &


echo "Note that even if successful you might have to wait ~30-60 seconds for the controller to be usable by the system."
