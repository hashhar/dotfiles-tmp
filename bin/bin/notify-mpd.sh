#!/bin/bash

# Get currently playing song's path
current_file="$(mpc current -f "%file%")"
current_file_name="$(basename "$current_file")"

# Pango templates and notification string {{{
title_png='Title:\t'
album_png='Album:\t'
artist_png='Artist:\t'

# Extract metadata {{{
#title="$title_png$(mpc current -f "[[%track% - ]%title%]|$current_file_name")"
title="$title_png$(mpc current -f "%title%|$current_file_name")"
album="$album_png$(mpc current -f "%album%[ \[%date%\]]|Non-Album")"
artist="$(mpc current -f "[$artist_png[%albumartist%]%artist%]")"
# }}}

# }}}

# Extract paths and define artwork size {{{
nowplaying_path="$HOME/Music/$current_file"
artist_album="$(mpc current -f "[[[%artist%]|%albumartist%]/%album%]")"
artwork_size='96x96'

# Replace all slashes with pipes in the artist_album and song name
artwork_cache="$HOME/.cache/artwork/$artwork_size/${artist_album//\//|}"
artwork_file="$artwork_cache/${current_file_name//\//|}.png"
# }}}

# Extract artwork if not already cached {{{
# Check if destination directory exists and is writable
if [[ ! -w "$artwork_cache" ]]; then
	mkdir -p "$artwork_cache"
fi

# Extract artwork if it isn't cached already
if [[ ! -e "$artwork_file" ]]; then
	if ffmpeg -y -i "${nowplaying_path}" -an -vcodec copy "$artwork_file" 2>/dev/null ; then
		mogrify "$artwork_file" -geometry "$artwork_size" "$artwork_file" 2>/dev/null
	else
		touch "$artwork_file"
	fi
fi
# }}}

function _sys_notify() {
    local notification_command="display notification \"$3\" with title \"$1\" subtitle \"$2\""
    osascript -e "$notification_command"
}

_sys_notify "$title" "$artist" "$album"

# vim: set fdm=marker fen
