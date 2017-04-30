# Run a command in background and detach from current shell
bg_run() {
    nohup "$@" > /dev/null 2>&1 &
}

# Play a random video
randomvideo() {
    mpv --vo=opengl --hwdec=vaapi "$(find "${1:-$HOME/Videos}" -type f \
        -not -name "*.srt" -not -name "*.torrent" | shuf -n 1)"
}

# Personal notes app
note() {
    case $@ in
        "-e") vim ~/note;;
          "") cat ~/note | less;;
           *) printf "$(date +%F\ %T): $@\n" >> ~/note
              printf "\"$@\" added to your notes.\n";;
    esac
}

# Personal todo app
todo() {
    if [[ ! -f $HOME/todo ]]; then
        touch "$HOME/todo"
    fi

    if ! (($#)); then
        cat "$HOME/todo"
    elif [[ "$1" == "-l" ]]; then
        nl -b a "$HOME/todo"
    elif [[ "$1" == "-c" ]]; then
        > $HOME/todo
    elif [[ "$1" == "-r" ]]; then
        nl -b a "$HOME/todo"
        eval printf %.0s- '{1..'"${COLUMNS:-$(tput cols)}"\}; echo
        read -p "Type a number to remove: " number
        sed -i ${number}d $HOME/todo "$HOME/todo"
    else
        printf "%s\n" "$*" >> "$HOME/todo"
    fi
}

# Simple calculator
calc() {
    echo "scale=3;$@" | bc -l
}

# Find a program in $PATH
findinpath() {
    [ -n "$1" ] || return 1
    for path in $(echo $PATH | tr -s ":" "\n"); do
        find "$path" -iname "*$1*" -type f
    done
}

# Now playing song info
nowplaying() {
    cb=$(tput bold)
    cc=$(tput sgr0)
    cbg=${cb}$(tput setaf 2)
    cbr=${cb}$(tput setaf 1)
    # Plain String: [[[Title:\t%title%\n]Artist:\t%artist%\n]Album:\t%album%]|File:\t%file%
    # Coloured String:
    # [[[\e\[1;32mTitle:\e\[0m\t%title%\n]\e\[1;32mArtist:\e\[0m\t%artist%\n]\e\[1;32mAlbum:\e\[0m\t%album%]|\e\[1;31mFile:\e\[0m\t%file%
    mpc current -f "[[[\e\[1;32mTitle:\e\[0m\t%title%\n]\e\[1;32mArtist:\e\[0m\t%artist%\n]\e\[1;32mAlbum:\e\[0m\t%album%]|\e\[1;31mFile:\e\[0m\t%file%"
}

# Command not found handler
command_not_found_handle() {
      local pkgs cmd=$1
      local FUNCNEST=10
      set +o verbose
      readarray -t pkgs < <(pacman -Fs "$cmd" 2>/dev/null)
      if (( ${#pkgs[*]} )); then
            printf '%s may be found in the following packages:\n' "$cmd"
            printf '  %s\n' "${pkgs[@]}"
            return 0
      else
            printf "bash: %s: command not found\n" "$cmd" >&2
            return 127
      fi
}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
