#!/bin/bash

music_dir="$HOME/Music"
tmp_script="/tmp/cachegen.sh"

cat<<'EOF' >"$tmp_script"
#!/bin/bash
# $1=Full path to file, $2=Size of artwork
artwork_cache="$HOME/.cache/artwork/$2"
if [[ ! -e "$artwork_cache" ]]; then
	mkdir -p "$artwork_cache"
fi

artwork_file="$artwork_cache/${1//\//|}.png"
if [[ ! -e "$artwork_file" ]]; then
	if ffmpeg -y -i "$1" -an -vcodec copy "$artwork_file" 2>/dev/null ; then
		mogrify "$artwork_file" -geometry "$2" "$artwork_file" 2>/dev/null
	else
		touch "$artwork_file"
	fi
fi
EOF

chmod +x "$tmp_script"

mpc listall | tr \\n \\0 | xargs -0 -iTHIS "$tmp_script" "$music_dir/THIS" "96x96"

# vim: set fdm=marker fen:
