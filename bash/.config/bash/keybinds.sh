#!/bin/bash

# Completion {{{
bind 'TAB: menu-complete'
bind '\C-space: complete'

# Complete current command using history
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'
# }}}

# Macros {{{
# Ctrl+Alt+m will show manpage of current command in buffer
bind '"\e\C-m": "\C-a\eb\ed\C-y\e#man \C-y\C-m\C-p\C-p\C-a\C-d\C-e"'
# Ctrl+Alt+B to send program to background
bind '"\e\C-b": "\C-e > /dev/null 2>&1 &\C-m"'
# }}}

# Movement {{{
# Ctrl+Arrow keys
bind '"\eOc": forward-word'
bind '"\eOd": backward-word'
# }}}

# Hstr {{{
if [[ $- =~ .*i.* ]]; then
    bind '"\C-r": "\C-a hh -- \C-j"'
fi
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
