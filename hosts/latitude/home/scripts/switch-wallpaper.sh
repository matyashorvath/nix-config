#!/usr/bin/env bash

picturePath="$HOME/Pictures/Wallpapers"
currentWallpaper=$(hyprctl hyprpaper listactive | sed -ne "1p" | awk '{print $NF}' | awk -F"/" '{print $NF}')
wpArr=()
currentWpNum=0

for (( i=0; ; i++ )); do
    element=$(ls ${picturePath} | sed -ne "$(( i+1 ))p")
    if [ "${element}" == "" ]; then
        break
    fi
    wpArr[${i}]=$element
done
wpArrLen=${#wpArr[*]}
    
for (( i=0; i<${#wpArr[*]}; i++ )); do
    if [ "${currentWallpaper}" == "${wpArr[${i}]}" ]; then
        currentWpNum=$i
        break
    fi
done

hyprctl hyprpaper reload ,$picturePath/${wpArr[$(( (currentWpNum+1) % wpArrLen ))]}
