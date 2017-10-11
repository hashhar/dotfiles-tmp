#!/bin/bash

i3status | while :
do
    read -r line

    # Get repeat, random, single and consume mode from mpd
    output=( $(mpc status | tail -1 | grep -o ": [[:alpha:]]\+" | tr -d ': ') )
    repeat=${output[0]}
    random=${output[1]}
    single=${output[2]}
    consume=${output[3]}

    printf -v mpd_song "%q" "$(mpc current -f "[[%albumartist%|%artist% - ]%title%]")"
    # printf -v sets the variable to '' in case of empty assignment
    if [[ "$mpd_song" == "''" ]]; then
        printf -v mpd_song "%q" "$(basename "$(mpc current -f "%file%")")"
    fi

    status="$(mpc status)"
    mpd_status="$(echo "$status" | tail -2 | head -1 | cut -d' ' -f1 | tr -d '[]')"
    flag=1

    case "$mpd_status" in
        "playing" )
            color="#00AAAA" ;;
        "paused" )
            color="#AAAA00" ;;
        * )
            flag=0 ;;
    esac
    if (( flag == 1 )); then
        echo "$line" | sed 's|{\"name|{\"name\":\"mpdstats\",\"full_text\":\"'"r: $repeat z: $random s: $single c: $consume"'\"},{\"name\":\"music\",\"color\": \"'"$color"'\",\"full_text\":\"  '"$mpd_song"'\"},{\"name|' || exit 1
        continue
    else
        echo -n "$line" || exit 1
        continue
    fi
done
