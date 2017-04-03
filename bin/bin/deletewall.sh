#!/bin/sh

# Description:  Deletes the currently set wallpaper as specified in ~/.fehbg.
# Usage:        ./deletewall.sh [-f]

usage() {
    USAGE=$(cat << EOF
Deletes the currently set wallpaper as specified in ~/.fehbg.
${EM}USAGE${NONE}:
${EM}./deletewall.sh [-f]${NONE}

This script uses the file specified in ~/.fehbg. It asks for a confirmation
before deleting if the ${EM}-f${NONE} argument is absent.

EOF
)
    printf '%s\n' "$USAGE"
}

# Set up colours
NONE=$(tput sgr0)
EM=$(tput bold)

# Check if fehbg exists.
if [ ! -f '~/.fehbg' ]; then
    printf '%s\n' "No ~/.fehbg file found."; exit;
fi

wallpaper=$(grep -P "'.*'" ~/.fehbg)
if [ "$1" == '-f' ]; then
    rm "$wallpaper"
else
    rm -i "$wallpaper"
fi



