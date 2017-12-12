#!/bin/bash

file="$(mpc current -f %file%)"
current="$(mpc current -f "[[%albumartist%|%artist% - ]%title%]|[%file%]")"

playlist="$HOME/Music/Playlists/Favourites.m3u"
if [ "$file" != "" ]; then
	echo "$file" >> "$playlist"
	sort -u "$playlist" -o "$playlist"
	notify-send -t 3000 "MPD" "Successfully added <b>${current//&/&amp;}</b> to Favourites"
	exit 0
else
	notify-send -t 3000 "MPD" "Nothing playing right now"
	exit 1
fi
