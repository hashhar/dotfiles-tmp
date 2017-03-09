# Prompt {{{
PS1='[\u@\h \W]\$ '

bash_prompt_command()
{
    local NONE="\[\033[0m\]"    # unsets color to term's fg color

    local R="\[\033[0;31m\]"    # red
    local C="\[\033[0;36m\]"    # cyan
    local EMG="\[\033[1;32m\]"  # green

    local UC=$EMG               # user's color
    (($(id -u) == "0")) && UC=$R   # root's color

    force_color_prompt=yes
    if [[ "$force_color_prompt" = yes ]]; then
        PS1="${C}\w\n${UC}\\$ ${NONE}"
    else
        PS1="\w\n\\$ "
    fi
}
bash_prompt_command
unset bash_prompt_command
# }}}

# vim: tw=80 fdm=marker
