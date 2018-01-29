#!/bin/bash

# Run a command in background and detach from current shell
bg_run() {
    nohup "$@" > /dev/null 2>&1 &
}

# Personal notes app
note() {
    local file="$HOME/note"
    if [[ ! -f "$file" ]]; then
        touch "$file"
    fi

    case $@ in
        "-e") nvim "$file";;
          "") less "$file";;
           *) printf '%s: %s\n' "$(date +%F\ %T)" "$*" >> "$file"
              printf '%s added to your notes.\n' "\"$*\"";;
    esac
}

# Personal todo app
todo() {
    local file="$HOME/todo"
    if [[ ! -f "$file" ]]; then
        touch "$file"
    fi

    case $@ in
        "-l") nl -b a "$file";;
        "-c") >"$file";;
        "-r") nl -b a "$file"
              eval printf %.0s- '{1..'"${COLUMNS:-$(tput cols)}"\}; echo
              read -p "Type a number to remove: " number
              if [ "x$number" != "x" ]; then
                  sed -i "$number"d "$file" "$file"
              fi;;
          "") cat "$file";;
           *) printf "%s\n" "$*" >> "$file";;
    esac
}

# Simple calculator
calc() {
    echo "scale=3;$*" | bc -l
}

# Find a program in $PATH
findinpath() {
    [ -n "$1" ] || return 1
    for path in $(echo "$PATH" | tr -s ":" "\n"); do
        find "$path" -iname "*$1*" -type f
    done
}

#copy and go to dir
cpg() {
    if [ -d "$2" ];then
        cp "$1" "$2" && cd "$2"
    else
        cp "$1" "$2"
    fi
}

#move and go to dir
mvg() {
    if [ -d "$2" ];then
        mv "$1" "$2" && cd "$2"
    else
        mv "$1" "$2"
    fi
}

# mkdir and go to dir
mkdirg() {
    mkdir -p "$1"
    cd "$1"
}

# Manually Pause/Unpause Firefox Process with POSIX-Signals
# Suspends all Firefox Threads. Results in Zero CPU load.
# Useful when having 100+ Tabs open and you temporarily need the power elsewhere.
# Be careful - might produce RACE CONDITIONS or LOCKUPS in other processes or FF itself.
ffs() {
    killall -SIGSTOP firefox
}

ffc() {
    killall -SIGCONT firefox
}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
