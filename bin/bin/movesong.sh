#!/bin/bash

# Description:  Moves the currently playing file in mpd.
# Dependencies: mpc, mpd
# Usage:        ./movesong.sh [move-location] [mpd-basedir]

usage() {
    USAGE=$(cat << EOF
Moves the currently playing file in mpd.
${EM}USAGE${NONE}:
${EM}./movesong.sh [move-location] [mpd-basedir]${NONE}

The default ${EM}move-location${NONE} is ${EM}mpd-basedir/.deleted${NONE}.

${EM}mpd-basedir${NONE} is the path to the mpd music directory. If left empty
it is assumed to be ${EM}~/Music${NONE}.

EOF
)
    printf '%s\n' "$USAGE"
}

# Set up colours
NONE=$(tput sgr0)
EM=$(tput bold)
# Check dependencies.
[ $(command -v mpc) ] || printf '%s\n' "mpc is needed."
[ $(command -v mpd) ] || printf '%s\n' "mpd is needed."

# Show usage if extra arguments are present.
if [ $# -ne 2 ]; then
    usage
else
    mpd_basedir="${2:='~/Music'}"
    move_location="$mpd_basedir/${1:='.deleted'}"
    [ ! -d "$move_location" ] && mkdir "$move_location" || exit
    mv "$mpd_basedir/$(mpc current -f %file%)" "$mpd_basedir/$move_location/"
fi
