#!/bin/bash

i3status | while :
do
    read line

    printf -v mpd_song "%q" "$(mpc current)"
    status="$(mpc status)"
    pos="$(echo "$status" | grep -o -P "\\d+:\\d+/\\d+:\\d+")"
    pos="${pos//\// of }"

    # printf -v sets the variable to a pair of single quotes if the assignment is empty
    if [ "$mpd_song" != "''" ]; then
        mpd_status="$(echo "$status" | tail -2 | head -1 | cut -d' ' -f1 | tr -d '[]')"
        if [ "$mpd_status" = "playing" ]; then
            color="#00AAAA"
        else
            color="#AAAA00"
        fi
        echo "$(echo "$line" | sed 's|{\"name|{\"name\":\"music\",\"color\": \"'"$color"'\",\"full_text\":\"'"$mpd_song"' - '"$pos"'\"},{\"name|')" || exit 1
        continue
    fi
    echo -n "$line" || exit 1
done
