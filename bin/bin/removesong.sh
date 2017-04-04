#!/bin/sh

# Description:  Deletes or moves the currently playing file in mpd.
# Dependencies: mpc, mpd

# Usage {{{
show_help() {
    cat << EOF
Deletes or moves the currently playing file in mpd.
${cbr}Usage:${cc} $scriptname [option...]
${cbr}Options:${cc}
  -h        Show this help.
  -m        Move the file. This is the default behaviour.
  -d        Delete the file. This and ${cbg}-m${cc} are mutually exclusive.
  -b dir    The ${cbg}music-directory${cc} variable in mpd's configuration.
            Defaults to ${cbg}$HOME/Music${cc}. It MUST exist.
  -l dir    The directory where files should be moved when using ${cbg}-m${cc}.
            This has no effect when used with ${cbg}-d${cc}. It MUST exist.
  -f        No confirmation when deleting or moving files.

This script depends on ${cbg}mpc${cc} and ${cbg}mpd${cc}.

${cbr}Exit Codes:${cc}
  0         Indicates successful move or deletion of a file.
  1         Problem parsing command line arguments.
  2         Extra arguments passed to the script which cause an issue while
            parsing command line arguments.
  3         Problem with the directories passed to (or default values)
            ${cbg}-d${cc} or ${cbg}-l${cc} options.
            Check if they exist and are writable by the current user.

EOF
}
# }}}

# Colours {{{
initializeColours() {
    # Check if stdout is a terminal.
    if [ -t 1 ]; then
        # See if it supports colors.
        ncolors=$(tput colors)
        if [ -n "$ncolors" ] && (( $ncolors > 8 )); then
            cb="$(tput bold)"
            cu="$(tput smul)"
            cc="$(tput sgr0)"
            cr="$(tput setaf 1)"; cbr="$cb$(tput setaf 1)"
            cg="$(tput setaf 2)"; cbg="$cb$(tput setaf 2)"
        else
            cb="$(tput bold)"
            cu="$(tput smul)"
            cc="$(tput sgr0)"
            cr="$cb"; cbr="$cb"
            cg="$cb"; cbg="$cb"
        fi
    fi
}
# }}}

scriptname='removesong.sh'

# Set up colours.
initializeColours
# Go to root directory to ensure only absolute paths work.
oldpwd=$(pwd)
cd /

# Check for dependencies {{{
[ ! $(command -v mpc) ] && printf "${cbr}ERROR${cc}: mpc is needed.\n"
[ ! $(command -v mpd) ] && printf "${cbr}ERROR${cc}: mpd is needed.\n"
# }}}

# Default options {{{
action="move"
action_set=0
music_dir="$HOME/Music"
move_location="$music_dir/.deleted"
interactive="-i"
# }}}

# Argument parsing using getopts {{{
while getopts :hfmdb:l: opt; do
    case $opt in
        h)
            show_help
            exit 0
            ;;
        m|d)
            if (( $action_set == 1 )); then
                printf "${cbr}ERROR:${cc} ${cb}-m${cc} and ${cb}-d${cc} are mutually exclusive. Use only one.\n" >&2
                exit 1
            fi
            # Set action according to option.
            if [ "$opt" = "m" ]; then
                action="move"
            else
                action="delete"
            fi
            action_set=1
            ;;
        b)
            # Exit if the directory does not exist.
            if [ ! -d "$OPTARG" ]; then
                printf "${cbr}ERROR:${cc} ${cb}$OPTARG${cc} is not a directory. Cannot proceed.\n" >&2
                exit 3
            fi
            music_dir="$OPTARG"
            ;;
        l)
            # Skip if the action is delete. This can fail if the action arg comes later than this.
            [ "$action" = "delete" ] && continue
            move_location="$OPTARG"
            ;;
        f)
            interactive=
            ;;
        :)
            # Argument missing.
            printf "${cbr}ERROR:${cc} Option ${cb}-$OPTARG${cc} requires an argument.\n"
            exit 1
            ;;
        *)
            show_help >&2
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))" # Shift off the options and optional --.
# Everything that's left in "$@" is a non-option. We consider this an error for this script.
if [ $# -ne 0 ]; then
    printf "${cbr}ERROR:${cc} This script does not accept any un-named positional parameters.\n"
    exit 2
fi
# }}}

# Validate move_location and music_dir {{{
# If the location is not a directory (or a symlink that points to a directory), exit.
if [ ! -d "$music_dir" ]; then
    printf "${cbr}ERROR:${cc} ${cb}$music_dir${cc} is not a directory or does not point to a directory. Cannot proceed.\n" >&2
    exit 3
fi

if [ ! -d "$move_location" ]; then
    printf "${cbr}ERROR:${cc} ${cb}$move_location${cc} is not a directory or does not point to a directory. Cannot proceed.\n" >&2
    exit 3
fi
# }}}

# Perform the functions {{{
if [ "$action" = "move" ]; then
    mv "$interactive" "$music_dir/$(mpc current -f %file%)" "$move_location/"
else
    rm "$interactive" "$music_dir/$(mpc current -f %file%)"
fi
# }}}

# Reset working directory.
cd "$oldpwd"

# vim: set tw=80 sts=4 ts=4 sw=4 et fdm=marker
