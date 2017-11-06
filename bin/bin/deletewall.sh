#!/bin/sh

# Description:  Deletes the currently set wallpaper as specified in ~/.fehbg.
# Usage:        ./deletewall.sh [-f]

# Check if fehbg exists.
if [ ! -f "$HOME/.fehbg" ]; then
    printf '%s\n' "No ~/.fehbg file found."; exit;
fi

wallpaper=$(grep -P -o "'.*'" ~/.fehbg | tr -d "'")
if [ "$1" = '-f' ]; then
    rm "$wallpaper"
else
    rm -i "$wallpaper"
fi

