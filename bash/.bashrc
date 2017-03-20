#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.config/bash/bashopts.sh ]] && . ~/.config/bash/bashopts.sh
[[ -f ~/.config/bash/variables.sh ]] && . ~/.config/bash/variables.sh
[[ -f ~/.config/bash/sourcing.sh ]] && . ~/.config/bash/sourcing.sh

[[ -f ~/.config/bash/prompt.sh ]] && . ~/.config/bash/prompt.sh

[[ -f ~/.config/bash/aliases.sh ]] && . ~/.config/bash/aliases.sh
[[ -f ~/.config/bash/keybinds.sh ]] && . ~/.config/bash/keybinds.sh
