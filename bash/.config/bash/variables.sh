#!/bin/bash

# Path {{{
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# Ruby {{{
export GEM_HOME="$(ruby -e 'print Gem.user_dir')"
export PATH="$GEM_HOME/bin:$PATH"
# }}}

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
# }}}

# Default programs {{{
export EDITOR=nvim
export VISUAL=nvim

# Browser {{{
if [[ -n "$DISPLAY" ]]; then
    export BROWSER=nightly
else
    export BROWSER=elinks
fi
# }}}
# }}}

# WeeChat {{{
export WEECHAT_HOME="$HOME/.config/weechat"
# }}}

# Less {{{
export LESSHISTFILE="${XDG_DATA_HOME:="$HOME/.local/share"}/less/history"
_lessdir="$(dirname "$LESSHISTFILE")"
[ -d "$_lessdir" ] || mkdir -p "$_lessdir"
# }}}

# GPG {{{
export GPG_TTY="$(tty)"
# }}}

# Hstr config {{{
export HH_CONFIG='hicolor'
# }}}

# Golang {{{
export GOPATH="$HOME/code"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
