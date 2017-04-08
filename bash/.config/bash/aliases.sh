# ls {{{
alias ls='ls --group-directories-first --color=auto -h'
alias ll='ls --group-directories-first --color=auto -hF -lA'
alias la='ls --group-directories-first --color=auto -hF -A'
# }}}

# Disk Usage {{{
alias df='df -h'
alias du='du -h -c'
alias du1='du -h -c --max-depth=1'
# }}}

# Searching and Pagers {{{
alias grep='grep --color=auto'
# }}}

# Networking {{{
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias ping='ping -c 4'
# }}}

# Preventing Data Loss {{{
alias mkdir='mkdir -p -v'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# }}}

# Information Querying and Storing {{{
alias path='echo $PATH | tr -s ":" "\n"'
alias histg='history | grep'
alias ranman='whatis $(find /usr/share/man/man{1,4,5,6,7,8}/ -printf "%f\n" | \
    shuf -n 5 | cut -d. -f1) | head -n 5'
alias anyman='whatis $(find /usr/share/man/man[1-8]/ -printf "%f\n" | \
    shuf -n 5 | cut -d. -f1) | head -n 5'

note() {
    case $@ in
        "-e") vim ~/.note;;
          "") cat ~/.note | less;;
           *) printf "$(date +%F\ %T): $@\n" >> ~/note
              printf "\"$@\" added to your notes.\n";;
    esac
}
# }}}

alias bc='bc -q'
alias lock='~/.config/i3/scripts/lock.sh'

# Privileged Access {{{
if [ $UID -ne 0 ]; then
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias fuck='sudo !!'
fi
# }}}

# Make errors tolerable {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias quit=' exit'
alias cd..='cd ..'
alias vi='vim'
# }}}

# Miscellaneous {{{
bg_run() {
    nohup "$@" > /dev/null 2>&1 &
}

randomvideo() {
    bg_run mpv "$(find "${1:-$HOME/Videos}" -type f -not -name "*.srt" \
        -not -name "*.torrent" | shuf -n 1)"
}

# Cowsay Fortune
alias cowfor='fortune -eac | tee >(head -n 1 >> \
"$HOME/.fortune-category-log") | tail -n +3 | cowsay -f "$(find \
/usr/share/cowsay/cows/ -type f | sort -R | head -1)" -W $((COLUMNS - 10))\
| lolcat'
# }}}

# vim: tw=80 fdm=marker
