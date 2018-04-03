#!/bin/bash

# command not found hook {{{
if brew command command-not-found-init > /dev/null 2>&1; then
    eval "$(brew command-not-found-init)"
fi
# }}}

# FASD {{{
fasd_cache="${XDG_CACHE_HOME:=$HOME/.cache}/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
# }}}

# Completions {{{
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
        . $(brew --prefix)/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
# }}}

# NVM {{{
nvm_init() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
    [ -s "/usr/local/opt/nvm/nvm.sh/bash_completion" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
}
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
