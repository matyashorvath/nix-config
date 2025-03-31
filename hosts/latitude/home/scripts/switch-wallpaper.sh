#!/usr/bin/env bash

picturePath="$HOME/Pictures/Wallpapers"

getWallpapers() {
    wpArr=()
    for (( i=0; ; i++ )); do
        element=$(ls ${picturePath} | sed -ne "$(( i+1 ))p")
        if [ "${element}" == "" ]; then
            break
        fi
        wpArr[${i}]=$element
    done
}

getCurrentWpNum() {
    currentWpNum=0
    currentWallpaper=$(hyprctl hyprpaper listactive | sed -ne "1p" | awk '{print $2}' | awk -F"/" '{print $NF}')
    for (( i=0; i<${#wpArr[*]}; i++ )); do
        if [ "${currentWallpaper}" == "${wpArr[${i}]}" ]; then
            currentWpNum=$i
            break
        fi
    done
}

getWallpapers
getCurrentWpNum
wpArrLen=${#wpArr[*]}

hyprctl hyprpaper reload ,$picturePath/${wpArr[$(( (currentWpNum+1) % wpArrLen ))]}
