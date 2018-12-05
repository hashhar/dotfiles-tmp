#!/bin/bash

# FASD {{{
fasd_cache="${XDG_CACHE_HOME:=$HOME/.cache}/.fasd-init-bash"
if [[ ! -s "$fasd_cache" ]]; then
    fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
. "$fasd_cache"
unset fasd_cache
# }}}

# Completions {{{
if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        . /etc/bash_completion
    fi
fi
# }}}

# NVM {{{
nvm_init() {
    export NVM_DIR="$HOME/.nvm"
    [[ -f "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"
    [[ -f "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"
}
# }}}

# Rust {{{
rust_init() {
    [[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
}
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
