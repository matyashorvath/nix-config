#!/usr/bin/env bash

picturePath="$HOME/Pictures/"
wallpapers=("39.jpg" "mountains.jpg")
wpStore="/tmp/wallpapers"

if [ -n $wpStore ]; then
    for i in ${wallpapers[@]}; do
        echo -e "$i\n" >>$wpStore
    done
fi

currentWp=$(awk 'BEGIN {RS = ""} {print $1}' $wpStore)
nextWp=$(awk 'BEGIN {RS = ""} {print $2}' $wpStore)

hyprctl hyprpaper reload ,$picturePath/$nextWp
echo -e "${nextWp}\n${currentWp}" >$wpStore