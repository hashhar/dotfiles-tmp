#!/bin/bash

# FASD {{{
fasd_cache="${XDG_CACHE_HOME:=$HOME/.cache}/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" ] || [ ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
. "$fasd_cache"
unset fasd_cache
# }}}

# Completions {{{
if ! shopt -oq posix; then
    BREW_PREFIX=$(brew --prefix)
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    fi
    if [ -f "$BREW_PREFIX"/share/bash-completion/bash_completion ]; then
        . "$BREW_PREFIX"/share/bash-completion/bash_completion
    fi
    if [ -d "$BREW_PREFIX"/etc/bash_completion.d ]; then
        for i in "$BREW_PREFIX"/etc/bash_completion.d/* ; do
            . "$i"
        done
    fi
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
# }}}

# NVM {{{
nvm_init() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
}
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
