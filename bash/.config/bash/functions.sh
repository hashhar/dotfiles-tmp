# Run a command in background and detach from current shell
bg_run() {
    nohup "$@" > /dev/null 2>&1 &
}

# Play a random video
randomvideo() {
    bg_run mpv "$(find "${1:-$HOME/Videos}" -type f -not -name "*.srt" \
        -not -name "*.torrent" | shuf -n 1)"
}

# Personal notes app
note() {
    case $@ in
        "-e") vim ~/.note;;
          "") cat ~/.note | less;;
           *) printf "$(date +%F\ %T): $@\n" >> ~/note
              printf "\"$@\" added to your notes.\n";;
    esac
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

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
