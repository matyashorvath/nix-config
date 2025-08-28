#!/usr/bin/env bash

currentProfile=$(powerprofilesctl get)
case $currentProfile in
    performance)
        class=perf
        percentage=100
        ;;
    power-saver)
        class=pows
        percentage=0
        ;;
    *)
        class=baln
        percentage=50
        ;;
esac
echo -n '{"tooltip": "' && echo -n ${currentProfile} && echo -n '", "class": "' && echo -n ${class} && echo -n '", "percentage": ' && echo -n ${percentage} && echo -n ' }'