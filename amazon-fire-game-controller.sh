#!/bin/bash

sudo ls &> /dev/null

eventNum=`cat /proc/bus/input/devices | grep "Amazon Fire Game Controller" -A4 -B0 | awk 'NR==5' | grep -o 'event[0-9]\{1,\}'`
jsNum=`cat /proc/bus/input/devices | grep "Amazon Fire Game Controller" -A4 -B0 | awk 'NR==5' | grep -o 'js[0-9]\{1,\}'`


if [[ "$eventNum" == "" ]]
then
    echo "Could not find Amazon Fire Game Controller bluetooth device."
    echo "Make sure that bluetooth is on and that the controller is paired and connected."
    exit 1
fi 

echo "Attempting driver activation..."
xboxdrv --evdev "/dev/input/$eventNum" --config amazon.conf --no-extra-events --silent &

sleep 1 

echo " "
sudo rm "/dev/input/$eventNum"
sudo rm "/dev/input/$jsNum"
echo "Removed original Amazon Fire Game Controller Input Events $eventNum and $jsNum." 
echo "This is a fix for games like Rocket League, which do not recognize the emulated"
echo "Xbox360 controller if the original Amazon gamepad is still visible to the system."




# this seems to have been fixed
# echo "Note that even if successful you might have to wait ~30-60 seconds for the controller to be usable by the system."
