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

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4
