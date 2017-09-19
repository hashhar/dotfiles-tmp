# Prompt {{{
PS1='[\u@\h \W]\$ '
export PROMPT_DIRTRIM=0

bash_prompt_command()
{
    local exit_code=$?
    local NONE="\[\033[0m\]"             # unsets color to term's fg color

    local R="\[\033[0;31m\]"             # red
    local C="\[\033[0;36m\]"             # cyan
    local G="\[\033[0;32m\]"             # green

    local UC=$G                          # user's color
    local EC=$R                          # user's exit color
    (($(id -u) == 0)) && local UC=$R     # root's color
    (($(id -u) == 0)) && local EC=$G     # root's exit color

    local force_color_prompt=yes
    local trailing=""
    if (( exit_code != 0 )); then
        trailing="${EC}\\$"
    else
        trailing="${UC}\\$"
    fi
    if [[ "$force_color_prompt" = yes ]]; then
        PS1="${C}\w ${trailing} ${NONE}"
    else
        PS1="\w \\$ "
    fi
    #PS1+="\[\033]0;\]$USER@$HOSTNAME: \w\[\007\]"
}
bash_prompt_command
export PROMPT_COMMAND=bash_prompt_command
export PROMPT_COMMAND="${PROMPT_COMMAND}; history -a; history -n"
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
