# ls {{{
alias sl='\ls --group-directories-first --color=auto -h'
alias ls='\ls --group-directories-first --color=auto -h -A'
alias ll='\ls --group-directories-first --color=auto -hF -lA'
alias tree='tree -C'
# }}}

# GPG and Keybase and SSH {{{
alias gpg='gpg2'
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
alias pcc='xclip -selection clipboard'
# }}}

alias bc='bc -q'
alias lock='"$HOME/.config/i3/scripts/lock.sh"'

# Privileged Access {{{
if [ $UID -ne 0 ]; then
    alias scat='sudo cat'
    alias svim='sudo nvim'
    alias root='sudo su'
    alias fuck='sudo !!'
fi
# }}}

# Make errors tolerable {{{
alias :q='exit'
alias :Q='exit'
alias :x='exit'
alias quit='exit'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias vi='nvim'
# }}}

# Miscellaneous {{{
alias cowfor='fortune -eac | tee >(head -n 1 >> \
    "$HOME/.fortune-category-log") | tail -n +3 | cowsay -f "$(find \
    /usr/share/cowsay/cows/ -type f | sort -R | head -1)" \
    -W $(($(tput cols) - 10)) | lolcat'
alias rainbowroad='seq 1 $(tput cols) | sort -R | sparklines | lolcat'
alias mpv='mpv --vo=opengl --hwdec=vaapi'
# }}}

# FASD {{{
alias nv='a -e nvim'
# }}}

# SSH and SCP {{{
alias sshp='ssh -o "PubkeyAuthentication no"'
alias scpp='scp -o "PubkeyAuthentication no"'
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
