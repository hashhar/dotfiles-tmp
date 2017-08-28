# Path {{{
export PATH="$HOME/.local/bin:$PATH"
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

# Frequently used directory variables {{{
export gitatt="$HOME/src/_touse/gitattributes"
export gitig="$HOME/src/_touse/gitignore"
# }}}

# WeeChat {{{
export WEECHAT_HOME="$HOME/.config/weechat"
# }}}

# Less {{{
export LESSHISTFILE="${XDG_DATA_HOME:="$HOME/.local/share"}/less/history"
[ -d "$(dirname "$LESSHISTFILE")" ] || mkdir -p "$(dirname "$LESSHISTFILE")"
# }}}

# GPG {{{
export GPG_TTY="$(tty)"
# }}}

# VDPAU Hardware Video Acceleration {{{
export VDPAU_DRIVER='va_gl'
# }}}

# Hstr config {{{
export HH_CONFIG='hicolor'
# }}}

# Golang {{{
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
