#!/bin/bash

# Path {{{
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Ruby {{{
export GEM_HOME="$(ruby -e 'print Gem.user_dir')"
export PATH="$GEM_HOME/bin:$PATH"
# }}}
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
[[ -d "$_lessdir" ]] || mkdir -p "$_lessdir"
# }}}

# GPG {{{
export GPG_TTY="$(tty)"
# }}}

# Hstr config {{{
export HSTR_CONFIG='hicolor'
# }}}

# Golang {{{
export GOROOT="/usr/local/go"
export GOPATH="$HOME/code"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
