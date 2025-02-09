#!/usr/bin/env bash

picturePath="$HOME/Pictures/"
wallpapers=("39.jpg" "mountains.jpg")
wpStore="/tmp/wallpapers"

if [ ! -e $wpStore ]; then
    wpCat="";
    for i in ${wallpapers[@]}; do
        wpCat+="${i}\n"
    done
    echo -e $wpCat >$wpStore
fi

currentWp=$(awk 'BEGIN {RS = ""} {print $1}' $wpStore)
nextWp=$(awk 'BEGIN {RS = ""} {print $2}' $wpStore)

hyprctl hyprpaper reload ,$picturePath/$nextWp
echo -e "${nextWp}\n${currentWp}" >$wpStore