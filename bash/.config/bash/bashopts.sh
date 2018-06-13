#!/bin/bash

# Bash options {{{
shopt -s cdspell autocd
shopt -s checkhash

# Check if any jobs are jobs are running before exiting
shopt -s checkjobs

# Save multiline commands in single history entry
shopt -s cmdhist lithist

# Globbing
shopt -s dotglob extglob globstar nocaseglob

# Append to history file instead of overwriting it
shopt -s histappend

# Load the history substitution into the editing buffer, rather than directly executing it
shopt -s histverify
# }}}

# History {{{
export HISTCONTROL='ignorespace:erasedups'
export HISTFILESIZE='100000'
export HISTSIZE='100000'
#export HISTTIMEFORMAT='%F %T '
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
