#!/bin/bash

file="$(mpc current -f %file%)"
current="$(mpc current -f "[[%albumartist%|%artist% - ]%title%]|[%file%]")"

playlist_dir="$HOME/Music/Playlists"
[[ -e "$playlist_dir" ]] || mkdir -p "$playlist_dir" 

playlist="${playlist_dir}/Favourites.m3u"
if [[ "$file" != "" ]]; then
	printf "%s\\n" "$file" >> "$playlist"
	sort -u "$playlist" -o "$playlist"
	notify-send -t 3000 "MPD" "Successfully added <b>${current//&/&amp;}</b> to Favourites"
	exit 0
else
	notify-send -t 3000 "MPD" "Nothing playing right now"
	exit 1
fi
