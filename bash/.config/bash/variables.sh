# Path {{{
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# }}}

# Default programs {{{
export EDITOR=vim
export VISUAL=vim

# Browser {{{
if [[ -n "$DISPLAY" ]]; then
    export BROWSER=firefox
else
    export BROWSER=elinks
fi
# }}}
# }}}

# Mount point variables {{{
export Resources='/media/Resources'
export Media='/media/Media'
export Data='/media/Data'
export GitHub="${Resources}/GitHub"
# }}}

# Pacaur {{{
export AURDEST='/home/ashhar/makepkg/pacaur-cache/'
# }}}

# Ruby {{{
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
# }}}

# WeeChat {{{
export WEECHAT_HOME='/home/ashhar/.config/weechat'
# }}}

# Less {{{
export LESSHISTFILE="${XDG_DATA_HOME:="$HOME/.local/share"}/less/history"
[ -d "$(dirname $LESSHISTFILE)" ] || mkdir -pi "$(dirname "$LESSHISTFILE")"
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4
