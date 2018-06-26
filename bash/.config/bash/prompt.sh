#!/bin/bash

# Prompt {{{
PS1='[\u@\h \W]\$ '
export PROMPT_DIRTRIM=0

# Remove Apple Terminal injected code
PROMPT_COMMAND="${PROMPT_COMMAND%update_terminal_cwd}"

default_prompt_setup()
{
    local exit_code=$?
    local trailing="\$"
    local force_color_prompt=yes
    if [[ "$force_color_prompt" = yes ]]; then
        local NONE='\[\033[0m\]'             # unsets color to term's fg color

        local R='\[\033[0;31m\]'             # red
        local C='\[\033[0;36m\]'             # cyan
        local G='\[\033[0;32m\]'             # green

        local UC=$G                          # user's color
        local EC=$R                          # user's exit color
        if (( UID == 0 )); then
            local UC=$R     # root's color
            local EC=$G     # root's exit color
        fi

        if (( exit_code != 0 )); then
            trailing="${EC}\$"
        else
            trailing="${UC}\$"
        fi
    fi
    PS1="${C}\\w ${trailing} ${NONE}"
    export prefix="${C}\\w"
    export suffix="${trailing} ${NONE}"
}

. "$HOME"/.local/src/oh-my-git/posh-git.sh
export PROMPT_COMMAND='default_prompt_setup; __posh_git_ps1 "$prefix " "$suffix"; history -a; history -n; '"${PROMPT_COMMAND}"
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
