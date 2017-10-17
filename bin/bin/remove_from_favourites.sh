#!/bin/bash

file="$(mpc current -f %file%)"
current="$(mpc current -f "[[%albumartist%|%artist% - ]%title%]|[%file%]")"

playlist="$HOME/.config/mpd/playlists/Favourites.m3u.bup"
fixedplaylist="$HOME/.config/mpd/playlists/Favourites.m3u"
deletedplaylist="/tmp/deleted"
if [ "$file" != "" ]; then
	echo "$file" > "$deletedplaylist"
	cp "$playlist" /tmp/cache
	comm -13 <(sort "$deletedplaylist") <(sort "/tmp/cache") > "$playlist"
	sort -u "$playlist" -o "$fixedplaylist"
	notify-send -t 3000 "MPD" "Successfully removed <b>${current//&/&amp;}</b> from Favourites"
	exit 0
else
	notify-send -t 3000 "MPD" "Nothing playing right now"
	exit 1
fi
