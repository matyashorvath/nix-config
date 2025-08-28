#!/usr/bin/env bash

profileList=()
i=1
while [ true ]; do
    currentEntry=$(powerprofilesctl list | awk 'BEGIN {RS=""} {print $1}' | awk -v i="$i" 'BEGIN {RS=""} {print $i}')
    if [ "$currentEntry" == "" ]; then
        break
    fi
    if [ "$(echo $currentEntry | grep :)" == "" ]; then
        currentEntry=active
    fi
    profileList+=($(echo $currentEntry | awk -F: '{print $1}'))
    let "i++"
done
prev=${profileList[-1]}
for i in ${profileList[@]}; do
    if [ "$prev" == "active" ]; then
        powerprofilesctl set $i
        break
    else
        prev=$i
    fi
done