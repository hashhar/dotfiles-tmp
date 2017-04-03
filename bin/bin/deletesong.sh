#!/bin/sh

# Description:  Deletes the currently playing file in mpd.
# Dependencies: mpc, mpd
# Usage:        ./deletesong.sh [mpd-basedir]

usage() {
    USAGE=$(cat << EOF
Deletes the currently playing file in mpd.
${EM}USAGE${NONE}:
${EM}./deletesong.sh [mpd-basedir]${NONE}

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
[ $(command -v mpc) ] || printf '%s\n' "${EM}mpc is needed.${NONE}"
[ $(command -v mpd) ] || printf '%s\n' "${EM}mpd is needed.${NONE}"

# Show usage if extra arguments are present.
if [ $# -gt 1 ]; then
    usage
else
    mpd_basedir="${1:='~/Music'}"
    rm -i "$mpd_basedir/$(mpc current -f %file%)"
fi
