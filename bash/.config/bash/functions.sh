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
              sed -i "$number"d "$file" "$file";;
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

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
