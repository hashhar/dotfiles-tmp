# Completion {{{
bind TAB:menu-complete
bind \C-space:complete

# Complete current command using history
# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'
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

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
